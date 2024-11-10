import psycopg2
from flask import current_app, g

def get_db():
    if 'db' not in g:
        g.db = psycopg2.connect(
            dbname=current_app.config['POSTGRES_DB'],
            user=current_app.config['POSTGRES_USER'],
            password=current_app.config['POSTGRES_PASSWORD'],
            host=current_app.config['POSTGRES_HOST'],
            port=current_app.config['POSTGRES_PORT']
        )
    return g.db

def cerrar_db(e=None):
    db = g.pop('db', None)

    if db is not None:
        db.close()

def init_app(app):
    app.teardown_appcontext(cerrar_db)