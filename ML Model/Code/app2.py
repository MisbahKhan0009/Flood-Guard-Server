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

        # Prediction from the model
        result = model.predict(station_name, month)

        # Complete result with default values for optional features
        result_complete = {
            'Max_Temp': result.get('Max_Temp'),
            'Min_Temp': result.get('Min_Temp'),
            'Rainfall': result.get('Rainfall'),
            'Relative_Humidity': result.get('Relative_Humidity'),
            'Wind_Speed': result.get('Wind_Speed'),
            'Cloud_Coverage': result.get('Cloud_Coverage'),
            'Bright_Sunshine': result.get('Bright_Sunshine'),
            # Optional additional features
            # 'Temp_Diff': result.get('Temp_Diff'),
            # Optional additional features
            # 'Rainfall_Squared': result.get('Rainfall_Squared')
        }

        # Send output to the secondary server for flood risk prediction
        server2_url = 'http://localhost:5050/predict'
        response = requests.post(server2_url, json=result_complete)

        if response.status_code == 200:
            return jsonify({'result': response.json()}, result)
        else:
            return jsonify({"error": "Failed to get response from Server 2"}), response.status_code

    except Exception as e:
        return jsonify({'error': str(e)}), 500


if __name__ == '__main__':
    app.run(port=5051, debug=True)
