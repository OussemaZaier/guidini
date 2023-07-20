from flask import Flask, render_template, request, redirect, session
from PIL import Image
import text_recognition
import json

app = Flask(__name__)

# this server


@app.route("/")
def hello_world():
    return render_template("index.html")


@app.route("/", methods=["POST"])
def save_image():
    try:
        if "image" not in request.files:
            return "No image file provided", 400

        file = request.files["image"]
        if file.filename == "":
            return "Invalid image filename", 400

        # Save the image
        image_pathname = "received_image.jpg"
        file.save(image_pathname)
        print("Image received and saved successfully!")

        extracted_list = text_recognition.extract_data_from_image(
            image_path=image_pathname
        )
        print("extracted list in the server")
        return list_to_json(extracted_list)
    except Exception as e:
        return str(e), 500


def list_to_json(my_list):
    # returns a json from a list
    json_data = json.dumps(my_list)
    return json_data


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8000)
