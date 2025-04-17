from odoo import models, fields

class MeuModelo(models.Model):
    _name = 'meu.modulo.modelo'
    _description = 'Meu Modelo Personalizado'

    name = fields.Char(string="Nome", required=True)
    descricao = fields.Text(string="Descrição")