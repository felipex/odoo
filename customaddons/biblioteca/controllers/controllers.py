# -*- coding: utf-8 -*-
# from odoo import http


# class Biblioteca(http.Controller):
#     @http.route('/biblioteca/biblioteca', auth='public')
#     def index(self, **kw):
#         return "Hello, world"

#     @http.route('/biblioteca/biblioteca/objects', auth='public')
#     def list(self, **kw):
#         return http.request.render('biblioteca.listing', {
#             'root': '/biblioteca/biblioteca',
#             'objects': http.request.env['biblioteca.biblioteca'].search([]),
#         })

#     @http.route('/biblioteca/biblioteca/objects/<model("biblioteca.biblioteca"):obj>', auth='public')
#     def object(self, obj, **kw):
#         return http.request.render('biblioteca.object', {
#             'object': obj
#         })

from odoo import http
from odoo.http import request

class BibliotecaController(http.Controller):

    @http.route('/biblioteca/biblioteca', auth='public')
    def index(self, **kw):
        return "Hello, world"

    # Rota para listar autores e editoras em JSON
    @http.route('/biblioteca/dados', type='json', auth='public')
    def listar_dados(self):
        autores = request.env['biblioteca.autor'].search([])
        editoras = request.env['biblioteca.editora'].search([])
        
        return {
            'autores': [{'id': a.id, 'nome': a.name} for a in autores],
            'editoras': [{'id': e.id, 'nome': e.name, 'cidade': e.cidade} for e in editoras]
        }

    # Rota para exibir uma página HTML
    @http.route('/biblioteca/pagina', type='http', auth='public', website=True)
    def pagina_biblioteca(self):
        return request.render('biblioteca.pagina_template', {
            'autores': request.env['biblioteca.autor'].search([]),
            'editoras': request.env['biblioteca.editora'].search([]),
        })