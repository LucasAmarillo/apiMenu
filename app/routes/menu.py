from flask import Blueprint, request, jsonify
from app.models.menu import Menu


bp = Blueprint('menu', __name__, url_prefix='/api')

@bp.route('/menu', methods=['GET'])
def obtener_menu():
    try:
        menu = Menu.obtener_menu()
        menu_json = [{"nombre": item["nombre"], "precio": item["precio"], "ingredientes": item["ingredientes"], "Tipo": item["tipo"]} for item in menu]
        return jsonify(menu_json), 200
    except Exception as e:
        return jsonify({"error": f"No se pudo obtener el menu: {str(e)}"}), 500

@bp.route('/insertar_comida', methods=['POST'])
def insertar_comida():
    try:
        nombre = request.json['nombre']
        precio = request.json['precio']
        ingredientes = request.json['ingredientes']
        id_tipoPlato = request.json['id_tipoPlato']

        comida = Menu(nombre, precio, ingredientes, id_tipoPlato)
        comida_id = comida.insertar_comida()
        return jsonify({"mensaje": "Comida insertada exitosamente", "comida_id": str(comida_id)}), 201
    except KeyError as e:
        return jsonify({"error": f"Todos los campos son requeridos: {str(e)}"}), 400
    except Exception as e:
        return jsonify({"error": f"No se pudo insertar la comida: {str(e)}"}), 500

@bp.route('/actualizar_comida', methods=['POST'])
def actualizar_comida():
    try:
        id_plato = request.json['id_plato']
        nombre = request.json['nombre']
        precio = request.json['precio']
        ingredientes = request.json['ingredientes']
        id_tipoPlato = request.json['id_tipoPlato']

        comida = Menu(nombre, precio, ingredientes, id_tipoPlato, id_plato)
        copmida_actualizada = comida.actualizar_comida()

        return jsonify({"mensaje": "Comida actualizada exitosamente", "comida_actualizada": str(copmida_actualizada)}), 201
    except KeyError as e:
        return jsonify({"error": f"Todos los campos son requeridos: {str(e)}"}), 400
    except Exception as e:
        return jsonify({"error": f"No se pudo insertar la comida: {str(e)}"}), 500

@bp.route('/eliminar_comida', methods=['DELETE'])
def eliminar_comida():
    try:
        id_plato = request.json['id_plato']
        comida = Menu(id_plato=id_plato)
        
        # Llamamos al método y obtenemos el mensaje y el código de estado
        respuesta, status_code = comida.eliminar_comida()
        
        # Retornamos con jsonify y el código de estado
        return jsonify(respuesta), status_code

    except KeyError:
        return jsonify({"error": "El campo 'id_plato' es requerido"}), 400
    except Exception as e:
        return jsonify({"error": f"No se pudo eliminar la comida: {str(e)}"}), 500