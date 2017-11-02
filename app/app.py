# -*- coding: utf-8 -*-
from flask import Flask
app = Flask(__name__)

@app.route("/")
def root():
    return "hello"

if __name__ == "main":
    app.run(host='0.0.0.0', debug=True)
