# -*- coding: utf-8 -*-

from odoo import models, fields, api

class Editora(models.Model):
    _name = 'biblioteca.editora'
    _description = 'Editora de livros'

    name = fields.Char()
    cidade = fields.Char()

