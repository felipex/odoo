# -*- coding: utf-8 -*-

from odoo import models, fields, api

class Assunto(models.Model):
    _name = 'biblioteca.assunto'
    _description = 'Assunto'

    name = fields.Char()

