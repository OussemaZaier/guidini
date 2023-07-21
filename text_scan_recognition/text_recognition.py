from PIL import Image
from pytesseract import pytesseract
import re
import os


# takes raw data return clean lines
def clean_data(raw_data):
    lines = raw_data.split("\n")
    pattern = r"\s+"
    price_pattern = r"\b[\w\s]+\s*\d+\.\d+\b"
    res = []
    lines = list(filter(lambda a: a != "", lines))
    for l in lines:
        l.replace("\n", " ")
        l = re.sub(pattern, " ", l)
        # some conditions to eliminate non important lines
        l = l.lower()
        # if "tel" in l or "fax" in l or ":" in l or (not has_number(l)):
        #    continue
        # l = l.split(" ")
        if re.search(price_pattern, l) and not re.search(
            r"\btotal\b|\bprice\b|\btax\b", l
        ):
            res.append(l)

    return split_product_price(res)


def split_product_price(list):
    pattern = r"(.+)\s+(\d+\.\d+)"
    detected_products = []
    for element in list:
        match = re.match(pattern, element)
        if match:
            product_name = match.group(1)
            price = match.group(2)
            detected_products.append([product_name, price])
    return detected_products


def extract_data_from_image(image_path):
    # return a list of lines read from an image
    # Defining paths to tesseract.exe

    path_to_tesseract = r"lib/tesseract.exe"
    # image_path = r"./recu.jpg"

    # Opening the image & storing it in an image object
    img = Image.open(image_path)

    # Providing the tesseract executable
    # location to pytesseract library
    pytesseract.tesseract_cmd = path_to_tesseract

    # Passing the image object to image_to_string() function
    # This function will extract the text from the image
    text = pytesseract.image_to_string(img)

    raw_text = text[:-1]
    # print("raw text", raw_text)

    print("after processing")

    result = clean_data(raw_data=raw_text)
    # os.unlink(image_path)
    return result


# functions that detects prices, quantities and product name in the list of lines
def line_contains_price(lines):  # creating a conflict
    # this line did not exitst
    # qfzvezdcz
    # fqsvezrcqzef
    pass


def has_number(s):
    return bool(re.search(r"\d", s))


# new comment
# we can test the functions here bellow
print(extract_data_from_image("recu.jpg"))
