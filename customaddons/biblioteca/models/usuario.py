# -*- coding: utf-8 -*-

from odoo import models, fields

class Usuario(models.Model):
    _name = 'biblioteca.usuario'
    _description = 'Usuario'

    nome = fields.Char()
    matricula = fields.Char()

