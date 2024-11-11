from flask import Flask, jsonify, request
import pandas as pd
import joblib

# Initialize Flask app
app = Flask(__name__)

# Define a Model class to handle model loading and prediction


class FloodRiskModel:
    def __init__(self, model_path):
        # Load the trained model pipeline
        self.model = joblib.load(model_path)
        # Define input and output features for reference
        self.input_features = ['Station_Names', 'Month']
        self.output_features = ['Max_Temp', 'Min_Temp', 'Rainfall', 'Relative_Humidity',
                                'Wind_Speed', 'Cloud_Coverage', 'Bright_Sunshine']

    def predict(self, station_name, month):
        # Convert inputs to string or expected format
        station_name = str(station_name)
        month = str(month)
        # Create a DataFrame for the input (ensure correct types)
        input_df = pd.DataFrame([[station_name, month]],
                                columns=self.input_features)
        # Make the prediction
        prediction = self.model.predict(input_df)
        # Format predictions into a dictionary
        output = {feature: prediction[0][i]
                  for i, feature in enumerate(self.output_features)}
        return output


# Initialize the model class with the path to the saved model
model = FloodRiskModel('ML Model/Code/rf_model_with_pipeline.sav')


@app.route('/predict', methods=['POST'])
def flood_risk_prediction():
    try:
        # Get the input data from the JSON body of the request
        input_data = request.get_json()
        # Extract Station_Names and Month from the input JSON
        station_name = input_data.get('Station_Names')
        month = input_data.get('Month')

        # Validate inputs
        if not station_name or not month:
            return jsonify({"error": "Both 'Station_Names' and 'Month' must be provided"}), 400

        # Make the prediction using the model
        result = model.predict(station_name, month)

        # Return the full prediction output as JSON
        return jsonify(result)

    except Exception as e:
        return jsonify({'error': str(e)}), 500


if __name__ == '__main__':
    app.run(debug=True)
