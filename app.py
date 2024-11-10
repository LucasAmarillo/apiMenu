from app import crear_app
import os

app = crear_app()

if __name__=='__main__':
    puerto = int(os.environ.get('PORT', 5000))
    app.run(host='0.0.0.0', port=puerto, debug=True)
