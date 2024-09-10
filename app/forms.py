from flask_wtf import FlaskForm
from flask_wtf.file import FileField, FileAllowed, FileRequired

class PhotoForm(FlaskForm):
    photo = FileField('Selecciona una foto', validators=[
        FileRequired(),
        FileAllowed(['jpg', 'png', 'jpeg', 'gif'], 'Solo se permiten imágenes.')
    ])