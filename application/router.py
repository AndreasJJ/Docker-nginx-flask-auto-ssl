#Imports
from flask import Flask, render_template

#Index page
@app.route('/')
def hello_world():
    return 'Hello, World!'
