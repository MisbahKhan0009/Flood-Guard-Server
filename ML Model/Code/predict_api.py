from flask import Flask, request, jsonify
import joblib

# Load your model
model_path = 'ML Model/Code/predict_api.py'
model = joblib.load(model_path)

app = Flask(__name__)


@app.route('/predict', methods=['POST'])
def predict():
    data = request.get_json()
    station_name = data.get('Station_Name')
    month = data.get('Month')

    # Convert inputs to the format your model expects
    input_data = [[station_name, month]]

    # Predict probability (modify based on how your model outputs)
    try:
        # Example for binary classification
        probability = model.predict_proba(input_data)[0][1]
        return jsonify({'Predicted_Probability': probability})
    except Exception as e:
        return jsonify({'error': str(e)}), 500


if __name__ == '__main__':
    app.run(port=5001)  # Run on port 5001 or any other free port
