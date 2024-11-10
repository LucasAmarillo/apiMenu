from flask import Flask
from app.routes import menu


def crear_app():
    app = Flask(__name__)
    app.config.from_object('app.configs.ConfigDB')
    app.register_blueprint(menu.bp)
    return app