from flask import Flask, jsonify, request
import pickle

app = Flask(__name__)

model = pickle.load(open('ML Model/Code/rf_model_forFG.sav', 'rb'))

@app.route('/predict', methods=['POST'])
def flood_risk_prediction():
    try:
        input_data = request.get_json()

        input_list = [
            input_data['Max_Temp'],
            input_data['Min_Temp'],
            input_data['Rainfall'],
            input_data['Relative_Humidity'],
            input_data['Wind_Speed'],
            input_data['Cloud_Coverage'],
            input_data['Bright_Sunshine'],
            input_data.get('Temp_Diff', 0),           # Optional additional features
            input_data.get('Rainfall_Squared', 0)      # Optional additional features
        ]

        y_prob_rf = model.predict_proba([input_list])[0]
        risk_category = ""

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
    app.run(port=5001, debug=True)
