# -*- coding: utf-8 -*-

from odoo import models, fields, api

class Exemplar(models.Model):
    _name = 'biblioteca.exemplar'
    _description = 'Exemplar'
    _rec_name = 'nome'

    localizacao = fields.Char()
    numero = fields.Integer()
    livro = fields.Many2one('biblioteca.livro', string='Livro')
    titulo_display = fields.Char(related='livro.titulo')
    autor_display = fields.Char(related='livro.autor.name')

    nome = fields.Char(compute='_get_nome')
    numero_str = fields.Char(compute='_get_numero')
    #titulo_str = fields.Char(compute='_get_titulo')
    #autor_str = fields.Char(compute='_get_autor')
    
    @api.depends('numero', 'livro')
    def _get_nome(self):
        for r in self:
            r.nome = f'{r.livro.nome} - Ex.:{r.numero}'

    @api.depends('numero')
    def _get_numero(self):
        for r in self:
            r.numero_str = f'Ex.:{r.numero}'

    # @api.depends('livro')
    # def _get_titulo(self):
    #     for r in self:
    #         r.titulo_str = r.livro.titulo

    # @api.depends('livro')
    # def _get_autor(self):
    #     for r in self:
    #         r.autor_str = r.livro.autor.name
