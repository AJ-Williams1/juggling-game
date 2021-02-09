import os
from flask import Flask, redirect, render_template, request, session

@app.route("/")
def index():
    return render_template("index.html")
