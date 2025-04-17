# -*- coding: utf-8 -*-

from odoo import models, fields, api


# class Autor(models.Model):
#     _name = 'biblioteca.autor'
#     _description = 'Autor de livros'

#     name = fields.Char()
#     value = fields.Integer()
#     value2 = fields.Float(compute="_value_pc", store=True)
#     description = fields.Text()

#     @api.depends('value')
#     def _value_pc(self):
#         for record in self:
#             record.value2 = float(record.value) / 100


class Autor(models.Model):
    _name = 'biblioteca.autor'
    _description = 'Autor de livros'

    name = fields.Char(string="Nome do Autor", help="Escreva aqui o nome do autor")

    qtde_livros = fields.Integer(compute='_compute_qtde')

    livros_ids = fields.One2many(
        'biblioteca.livro',
        'autor',
        string = 'Livros do autor'
    )

    @api.depends('livros_ids')
    def _compute_qtde(self):
        for autor in self:
            autor.qtde_livros = len(autor.livros_ids)
        '''
        livros = self.env['biblioteca.livro'].search([('autor_id', '=', self.id)])
        if livros:
            self.qtde_livros = len(livros)
        else:
            self.qtde_livros = 0
        '''

