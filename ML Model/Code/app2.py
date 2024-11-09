from flask import Flask, jsonify, request
import pandas as pd
import joblib
import requests

app = Flask(__name__)


class FloodRiskModel:
    def __init__(self, model_path):
        self.model = joblib.load(model_path)
        self.input_features = ['Station_Names', 'Month']
        self.output_features = ['Max_Temp', 'Min_Temp', 'Rainfall', 'Relative_Humidity',
                                'Wind_Speed', 'Cloud_Coverage', 'Bright_Sunshine']

    def predict(self, station_name, month):
        station_name = str(station_name)
        month = str(month)
        input_df = pd.DataFrame([[station_name, month]],
                                columns=self.input_features)
        prediction = self.model.predict(input_df)
        output = {feature: prediction[0][i]
                  for i, feature in enumerate(self.output_features)}
        return output


model = FloodRiskModel('ML Model/Code/rf_model_with_pipeline.sav')


@app.route('/predict', methods=['POST'])
def flood_risk_prediction():
    try:
        input_data = request.get_json()
        station_name = input_data.get('Station_Names')
        month = input_data.get('Month')

        if not station_name or not month:
            return jsonify({"error": "Both 'Station_Names' and 'Month' must be provided"}), 400

        # Prediction from Server 1
        result = model.predict(station_name, month)

        # Send output from Server 1 to Server 2
        server2_url = 'http://localhost:5001/predict'
        response = requests.post(server2_url, json=result)

        if response.status_code == 200:
            return jsonify(response.json())
        else:
            return jsonify({"error": "Failed to get response from Server 2"}), response.status_code

    except Exception as e:
        return jsonify({'error': str(e)}), 500


if __name__ == '__main__':
    app.run(port=5000, debug=True)
