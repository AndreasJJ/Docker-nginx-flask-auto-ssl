#Imports
from flask import Flask, render_template
from application import app

#Index page
@app.route('/')
def hello_world():
    return 'Hello, World!'
