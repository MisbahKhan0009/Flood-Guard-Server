from flask import Flask, jsonify, request
import pickle

# Initialize Flask app
app = Flask(__name__)

# Load the trained RandomForest model (Ensure this is correctly loaded before starting)
model = pickle.load(open('ML Model/Code/rf_model_forFG.sav', 'rb'))


@app.route('/predict', methods=['POST'])
def flood_risk_prediction():
    try:
        # Get the input data from the JSON body of the request
        input_data = request.get_json()

        # Convert input data to a list or numpy array
        input_list = [
            input_data['Max_Temp'],
            input_data['Min_Temp'],
            input_data['Rainfall'],
            input_data['Relative_Humidity'],
            input_data['Wind_Speed'],
            input_data['Cloud_Coverage'],
            input_data['Bright_Sunshine'],
            input_data['Temp_Diff'],
            input_data['Rainfall_Squared']
        ]

        # Get the prediction probabilities (this returns probabilities for each class)
        y_prob_rf = model.predict_proba([input_list])[0]

        # Initialize an empty list to hold the risk categories
        risk_categories = ""

        # Assign risk categories based on the probability
        for prob in y_prob_rf:
            if prob > 0.75:
                risk_categories = 'High Risk'
            elif 0.25 < prob <= 0.75:
                risk_categories = 'Medium Risk'
            else:
                risk_categories = 'Low Risk'

        # Return the risk categories in the response
        return jsonify({'risk': risk_categories}, {'risk_percent': prob})

    except Exception as e:
        return jsonify({'error': str(e)}), 500


if __name__ == '__main__':
    app.run(debug=True)
