import os
from flask import Blueprint, jsonify, request, render_template, redirect, url_for, flash
from .models import Usuario, Direccion, Telefono, ExperienciaLaboral
from . import db
from werkzeug.security import generate_password_hash, check_password_hash
from . import app
from .forms import PhotoForm
from werkzeug.utils import secure_filename

main = Blueprint('main', __name__)

UPLOAD_FOLDER = 'uploads'
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

@app.route('/upload', methods=['GET', 'POST'])
def upload_photo():
    form = PhotoForm()
    if form.validate_on_submit():
        f = form.photo.data
        filename = secure_filename(f.filename)
        if not os.path.exists(app.config['UPLOAD_FOLDER']):
            os.makedirs(app.config['UPLOAD_FOLDER'])
        f.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))
        flash('Foto subida exitosamente', 'success')
        return redirect(url_for('upload_photo'))
    return render_template('upload.html', form=form)

@main.route('/usuarios', methods=['GET'])
def get_usuarios():
    usuarios = Usuario.query.all()
    return jsonify([{
        'id': usuario.id,
        'nombre': usuario.nombre,
        'email': usuario.email,
        'username': usuario.username,
        'fecha_registro': usuario.fecha_registro.isoformat()
    } for usuario in usuarios])
    
@main.route('/users2')
def users_table():
    users = Usuario.query.all()
    direcciones = Direccion.query.all()
    return render_template('users_table.html', users=users, direcciones=direcciones)
    
@main.route('/usuarios/<int:id>', methods=['GET'])
def get_usuario(id):
    usuario = Usuario.query.get_or_404(id)
    return jsonify({
        'id': usuario.id,
        'nombre': usuario.nombre,
        'email': usuario.email,
        'username': usuario.username,
        'fecha_registro': usuario.fecha_registro.isoformat()
    })

@main.route('/usuarios', methods=['POST'])
def create_usuario():
    data = request.json
    hashed_password = generate_password_hash(data['password'])
    new_usuario = Usuario(
        nombre=data['nombre'],
        email=data['email'],
        username=data['username'],
        password=hashed_password
    )
    db.session.add(new_usuario)
    db.session.commit()
    return jsonify({'message': 'Usuario creado exitosamente'}), 201

@main.route('/direcciones', methods=['GET'])
def get_direcciones():
    direcciones = Direccion.query.all()
    return jsonify([{
        'id': direccion.id,
        'usuario_id': direccion.usuario_id,
        'calle': direccion.calle,
        'ciudad': direccion.ciudad,
        'estado': direccion.estado,
        'pais': direccion.pais
    } for direccion in direcciones])

@main.route('/direcciones', methods=['POST'])
def create_direccion():
    data = request.json
    new_direccion = Direccion(
        usuario_id=data['usuario_id'],
        calle=data['calle'],
        ciudad=data['ciudad'],
        estado=data['estado'],
        pais=data['pais']
    )
    db.session.add(new_direccion)
    db.session.commit()
    return jsonify({'message': 'Dirección creada exitosamente'}), 201

@main.route('/telefonos', methods=['GET'])
def get_telefonos():
    telefonos = Telefono.query.all()
    return jsonify([{
        'id': telefono.id,
        'usuario_id': telefono.usuario_id,
        'numero_telefono': telefono.numero_telefono
    } for telefono in telefonos])

@main.route('/telefonos', methods=['POST'])
def create_telefono():
    data = request.json
    new_telefono = Telefono(
        usuario_id=data['usuario_id'],
        numero_telefono=data['numero_telefono']
    )
    db.session.add(new_telefono)
    db.session.commit()
    return jsonify({'message': 'Teléfono creado exitosamente'}), 201

@main.route('/experiencias', methods=['GET'])
def get_experiencias():
    experiencias = ExperienciaLaboral.query.all()
    return jsonify([{
        'id': exp.id,
        'usuario_id': exp.usuario_id,
        'empresa': exp.empresa,
        'puesto': exp.puesto,
        'fecha_inicio': exp.fecha_inicio.isoformat(),
        'fecha_fin': exp.fecha_fin.isoformat() if exp.fecha_fin else None,
        'responsabilidades': exp.responsabilidades
    } for exp in experiencias])

@main.route('/experiencias', methods=['POST'])
def create_experiencia():
    data = request.json
    new_experiencia = ExperienciaLaboral(
        usuario_id=data['usuario_id'],
        empresa=data['empresa'],
        puesto=data['puesto'],
        fecha_inicio=data['fecha_inicio'],
        fecha_fin=data.get('fecha_fin'),
        responsabilidades=data.get('responsabilidades')
    )
    db.session.add(new_experiencia)
    db.session.commit()
    return jsonify({'message': 'Experiencia laboral creada exitosamente'}), 201