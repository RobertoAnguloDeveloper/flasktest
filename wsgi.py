# Importaciones
from app import create_app
from waitress import serve

# Creación de la aplicación
application = create_app()

# Bloque principal
if __name__ == "__main__":
    serve(application, host='0.0.0.0', port=5000)