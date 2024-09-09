from . import db
from datetime import datetime

class Usuario(db.Model):
    __tablename__ = 'usuarios'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    nombre = db.Column(db.String, nullable=False)
    email = db.Column(db.String, unique=True, nullable=False)
    fecha_registro = db.Column(db.DateTime, default=datetime.utcnow)
    username = db.Column(db.String, unique=True, nullable=False)
    password = db.Column(db.String, nullable=False)
    
    # Relaciones
    direcciones = db.relationship('Direccion', backref='usuario', lazy=True)
    telefonos = db.relationship('Telefono', backref='usuario', lazy=True)
    experiencias_laborales = db.relationship('ExperienciaLaboral', backref='usuario', lazy=True)

class Direccion(db.Model):
    __tablename__ = 'direcciones'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    usuario_id = db.Column(db.Integer, db.ForeignKey('usuarios.id'), nullable=False)
    calle = db.Column(db.String, nullable=False)
    ciudad = db.Column(db.String, nullable=False)
    estado = db.Column(db.String, nullable=False)
    pais = db.Column(db.String, nullable=False)

class Telefono(db.Model):
    __tablename__ = 'telefonos'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    usuario_id = db.Column(db.Integer, db.ForeignKey('usuarios.id'), nullable=False)
    numero_telefono = db.Column(db.String, nullable=False)

class ExperienciaLaboral(db.Model):
    __tablename__ = 'experiencia_laboral'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    usuario_id = db.Column(db.Integer, db.ForeignKey('usuarios.id'), nullable=False)
    empresa = db.Column(db.String, nullable=False)
    puesto = db.Column(db.String, nullable=False)
    fecha_inicio = db.Column(db.Date, nullable=False)
    fecha_fin = db.Column(db.Date)
    responsabilidades = db.Column(db.Text)