# -*- coding: utf-8 -*-

from odoo import models, fields, api

class Livro(models.Model):
    _name = 'biblioteca.livro'
    _description = 'Livro'
    _rec_name = 'nome'

    titulo = fields.Char()
    edicao = fields.Integer(default=1)
    sinopse = fields.Text()
    autor_ids = fields.Many2many('biblioteca.autor', string='Autor')
    editora = fields.Many2one('biblioteca.editora', string='Editora')
    assunto_ids = fields.Many2many('biblioteca.assunto', string='Assunto')

    exemplar_ids = fields.One2many('biblioteca.exemplar', 'livro', string='Exemplares')

    edicao_str = fields.Char(compute='_compute_edicao')
    nome = fields.Char(compute='_get_nome')
    exemplares_count = fields.Integer(compute='_get_exemplares_count')

    @api.depends('titulo')
    def _get_nome(self):
        for record in self:
            record.nome = f'{record.titulo}'

    @api.depends('edicao')
    def _compute_edicao(self):
        for record in self:
            record.edicao_str = f'{record.edicao} ed.'

    @api.depends('exemplar_ids')
    def _get_exemplares_count(self):
        for r in self:
            r.exemplares_count = len(r.exemplar_ids)

    # @api.depends('titulo', 'autor')
    # def name_get(self):
    #     return [(livro.id, f'{livro.titulo} ({livro.autor.name})') for livro in self]