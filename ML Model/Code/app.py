from flask import Flask, jsonify, request
import pickle

app = Flask(__name__)

model = pickle.load(open('ML Model/Code/rf_model_forFG.sav', 'rb'))


@app.route('/predict', methods=['POST'])
def flood_risk_prediction():
    try:
        input_data = request.get_json()

        # Get the required fields, with default values if they are missing
        input_list = [
            # Default 0 if key is missing
            input_data.get('Max_Temp'),
            input_data.get('Min_Temp'),
            input_data.get('Rainfall'),
            input_data.get('Relative_Humidity'),
            input_data.get('Wind_Speed'),
            input_data.get('Cloud_Coverage'),
            input_data.get('Bright_Sunshine'),
            # Optional additional features
            input_data.get('Temp_Diff'),
            # Optional additional features
            input_data.get('Rainfall_Squared')
        ]

        # Model prediction
        y_prob_rf = model.predict_proba([input_list])[0]
        risk_category = ""

        # Determine the risk category based on probabilities
        for prob in y_prob_rf:
            if prob > 0.75:
                risk_category = 'High Risk'
            elif 0.25 < prob <= 0.75:
                risk_category = 'Medium Risk'
            else:
                risk_category = 'Low Risk'

        return jsonify({'risk': risk_category, 'risk_percent': max(y_prob_rf)})

    except Exception as e:
        return jsonify({'error': str(e)}), 500


if __name__ == '__main__':
    app.run(port=5050, debug=True)
