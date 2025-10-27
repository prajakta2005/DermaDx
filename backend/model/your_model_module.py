import tensorflow as tf
import numpy as np
from PIL import Image
import os

# Path to your trained model file
MODEL_PATH = os.path.join(os.path.dirname(__file__), 'cnn_tuned.h5')

# Load the trained model once when the module is imported
try:
    model = tf.keras.models.load_model(MODEL_PATH)
    print("✅ Model loaded successfully")
except Exception as e:
    print(f"❌ Error loading model: {e}")
    model = None

# HAM10000 has 7 classes
DISEASE_CLASSES = [
    'Actinic keratoses and intraepithelial carcinoma (akiec)',
    'Basal cell carcinoma (bcc)',
    'Benign keratosis-like lesions (bkl)',
    'Dermatofibroma (df)',
    'Melanoma (mel)',
    'Melanocytic nevi (nv)',
    'Vascular lesions (vasc)'
]


def preprocess_image(image_path):
    """
    Preprocess an image for the model.
    - Resize to 224x224 (common for ResNet50 / CNN models).
    - Normalize pixel values.
    """
    img = Image.open(image_path).convert("RGB").resize((224, 224))
    img_array = np.array(img) / 255.0  # Normalize (0–1)
    img_array = np.expand_dims(img_array, axis=0)  # Shape: (1, 224, 224, 3)
    return img_array


def predict_image(image_path):
    """
    Loads an image, makes a prediction using the model, and returns the result.
    """
    if model is None:
        raise RuntimeError("Model is not loaded. Cannot make prediction.")

    processed_img = preprocess_image(image_path)
    predictions = model.predict(processed_img)

    # Get highest probability class
    predicted_class_index = int(np.argmax(predictions[0]))
    confidence = float(np.max(predictions[0]))

    # Get disease name
    predicted_disease = DISEASE_CLASSES[predicted_class_index]

    return predicted_disease, confidence
