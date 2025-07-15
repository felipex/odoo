# -*- coding: utf-8 -*-

from odoo import models, fields, api

class Autor(models.Model):
    _name = 'biblioteca.autor'
    _description = 'Autor de livros'

    name = fields.Char(string="Nome do Autor", help="Escreva aqui o nome do autor")

    qtde_livros = fields.Integer('Quantidade de livros', compute='_compute_qtde', store=False)

    livro_ids = fields.Many2many(
        'biblioteca.livro',
        string = 'Livros do autor'
    )

    @api.depends('livro_ids')
    def _compute_qtde(self):
        for autor in self:
            autor.qtde_livros = 0
            if autor.livro_ids:
                autor.qtde_livros = len(autor.livro_ids)
            
