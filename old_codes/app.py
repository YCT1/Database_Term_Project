from flask import Flask, render_template, request, redirect,url_for

app = Flask(__name__)

@app.route("/")
def index():
    message = "Bu bir mesajdır"

    numbers = [1,2,3,4,5,6,7]
    return render_template("index.html", number = 10,number2 = 12, message = message, numbers=numbers)


@app.route("/search")
def search():
    return "Search Page"



@app.route("/delete/<string:id>")
def delete(id):
    return "Merhaba " + id



@app.route("/toplam", methods = ["GET", "POST"])
def toplam():
    if request.method == "POST":
        number1 = request.form.get("number1")
        number2 = request.form.get("number2")
        return render_template("number.html", total = int(number1) + int(number2))
    else:
        return redirect(url_for("index"))

if __name__ == "__main__":
    app.run(debug = True)