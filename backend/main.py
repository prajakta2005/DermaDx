from flask import Flask, request, jsonify
from werkzeug.utils import secure_filename
import os
from model.your_model_module import predict_image  # make sure this exists

app = Flask(__name__)

# Configure upload folder
UPLOAD_FOLDER = 'uploads'
os.makedirs(UPLOAD_FOLDER, exist_ok=True)
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

# Max upload size: 16 MB
app.config['MAX_CONTENT_LENGTH'] = 16 * 1024 * 1024


# Health check route
@app.route('/')
def home():
    return jsonify({"message": "Flask API is running!"})


# Prediction route
@app.route('/predict', methods=['POST'])
def predict():
    # Check if request has file part
    if 'file' not in request.files:
        return jsonify({'error': 'No file provided. Use form-data with key "file".'}), 400

    file = request.files['file']

    # Check if file has a name
    if file.filename == '':
        return jsonify({'error': 'No file selected.'}), 400

    try:
        # Save file securely
        filename = secure_filename(file.filename)
        filepath = os.path.join(app.config['UPLOAD_FOLDER'], filename)
        file.save(filepath)

        # Run prediction
        disease_result, confidence_score = predict_image(filepath)

        return jsonify({
            'disease': disease_result,
            'confidence': float(confidence_score)
        }), 200

    except Exception as e:
        return jsonify({'error': f'Error during prediction: {str(e)}'}), 500


if __name__ == '__main__':
    # Accessible from other devices on same network
    app.run(debug=True, host='0.0.0.0', port=5000)
