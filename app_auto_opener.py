from flask import Flask
from door import alert

app = Flask(__name__)

@app.route("/")
def main():
    return "GO BACK"

@app.route("/request")
def request():
    try:
        alert(2, 'null')
        return "OK"
    except:
        return "error"

app.run(host='0.0.0.0', port=5000, debug=True)