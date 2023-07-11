from PIL import Image
from pytesseract import pytesseract
import re


# takes raw data return clean lines
def clean_data(raw_data):
    lines = raw_text.split("\n")
    pattern = r"\s+"

    for l in lines:
        l.replace("\n", " ")
        l = re.sub(pattern, " ", l)
    lines = list(filter(lambda a: a != "", lines))

    print("lines", lines)


# Defining paths to tesseract.exe
# and the image we would be using
path_to_tesseract = r"lib/tesseract.exe"
image_path = r"./text.jpg"

# Opening the image & storing it in an image object
img = Image.open(image_path)

# Providing the tesseract executable
# location to pytesseract library
pytesseract.tesseract_cmd = path_to_tesseract

# Passing the image object to image_to_string() function
# This function will extract the text from the image
text = pytesseract.image_to_string(img)
text2 = pytesseract.image_to_boxes(img)

# cfg_filename = 'words'
# pytesseract.run_and_get_output(image, extension='txt', config=cfg_filename)

# Displaying the extracted text

# extracting products i am putting them in a list of 2 elements arrays [[product1, price1]]
# second step make a json with this format :

# parsing

# raw_text = raw_text.replace("\n", " ")

raw_text = text[:-1]
print("raw text", raw_text)

print("after processing")

clean_data(raw_data=raw_text)

# tokens = raw_text.split(" ")
# print(tokens)


# need dto extract lines
# produit marque quantité prix


# functions that detects prices, quantities and product name in the list of lines
def line_contains_price(lines):
    pass


# new comment
