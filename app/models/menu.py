from flask import Flask, jsonify, request
from app.utils.db import get_db

class Menu:
    def __init__(self, nombre=None, precio=None, ingredientes=None, id_tipoPlato=None, id_plato=None,):
        self.id_plato = id_plato
        self.nombre = nombre
        self.precio = precio
        self.ingredientes = ingredientes
        self.id_tipoPlato = id_tipoPlato
    @staticmethod
    def obtener_menu():
        db = get_db()
        cursor = db.cursor()
        cursor.execute("select c.*, tp.descripcion as tipo from comidas c inner join tipo_plato tp on tp.id_tipo = c.id_tipoplato ")
        # cursor.execute("SELECT c.id_plato, c.nombre, c.precio, c.ingredientes, c.id_tipoplato, tc.descripcion AS Tipo FROM comidas c INNER JOIN tipo_plato tc ON tc.id_plato = c.id_tipoplato")
        menu = cursor.fetchall()
        
        # Cerrar el cursor
        cursor.close()

        menu_items = []
        for item in menu:
            menu_item = {
                'id_plato': item[0],
                'nombre': item[1],
                'precio': item[2],
                'ingredientes': item[3],
                'id_tipoPlato': item[4],
                'tipo': item[5]
            }
            menu_items.append(menu_item)
        
        return menu_items

        # # Devolver los resultados como JSON
        # return jsonify(menu_items)

    def insertar_comida(self):
            db = get_db()
            cursor = db.cursor()
            cursor.execute("INSERT INTO comidas(nombre, precio, ingredientes, id_tipoPlato) VALUES (%s, %s, %s, %s)",(self.nombre, self.precio, self.ingredientes, self.id_tipoPlato))
            db.commit()
            cursor.close()
            datos_comidas = {
                'nombre': self.nombre,
                'precio': self.precio,
                'ingredientes': self.ingredientes,
                'id_tipoPlato': self.id_tipoPlato
            }
            return jsonify(datos_comidas)

    def actualizar_comida(self):
            db = get_db()
            cursor = db.cursor()
            cursor.execute("UPDATE comidas SET nombre = %s, precio = %s, ingredientes = %s, id_tipoPlato = %s WHERE id_plato = %s", (self.nombre, self.precio, self.ingredientes, self.id_tipoPlato,self.id_plato))

            db.commit()
            cursor.close()

            datos_comidas = {
                'id_plato': self.id_plato,
                'nombre': self.nombre,
                'precio': self.precio,
                'ingredientes': self.ingredientes,
                'id_tipoPlato': self.id_tipoPlato
            }
            return jsonify(datos_comidas)

    def eliminar_comida(self):
        db = get_db()
        cursor = db.cursor()
        
        # Ejecuta el DELETE con RETURNING
        cursor.execute("DELETE FROM comidas WHERE id_plato = %s RETURNING id_plato", (self.id_plato,))
        comida_eliminada = cursor.fetchone()
        db.commit()
        cursor.close()

        # Verifica si la comida fue eliminada
        if comida_eliminada:
            return {"mensaje": "Comida eliminada exitosamente"}, 200
        else:
            return {"error": "No se encontró la comida con el id proporcionado"}, 404