from flask import Flask

app = Flask(__name__)
app.secret_key = 'super-duper-secret-key'

from application import router