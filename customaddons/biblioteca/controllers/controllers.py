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
import json
from odoo.http import Response, Request


class BibliotecaController(http.Controller):

    @http.route('/biblioteca/biblioteca', auth='public')
    def index(self, **kw):
        return "Hello, world"


    # Rota GET para obter informações do website atual
    @http.route('/api/website/info', type='http', auth='public', website=True, csrf=False)
    def get_website_info(self):
        try:
            website = request.website  # Acesso ao website atual via request.website
            data = {
                "website_id": website.id,
                "website_name": website.name,
                "company": website.company_id.name,
                "domain": website.domain,
                "active_languages": [lang.name for lang in website.language_ids]
            }
            
            return Response(
                json.dumps(data, ensure_ascii=False),  # ensure_ascii=False para manter acentos
                content_type='application/json; charset=utf-8',
                status=200
            )
        except Exception as e:
            return Response(
                json.dumps({"error": str(e)}, ensure_ascii=False),
                content_type='application/json; charset=utf-8',
                status=500
            )

    @http.route('/biblioteca/dados', type='http', auth='public', methods=['GET'], csrf=False)
    def listar_dados(self):
        autores = request.env['biblioteca.autor'].search_read([], ['id', 'name'])
        return Response(
            json.dumps(autores, ensure_ascii=False),
            content_type='application/json; charset=utf-8'
        )

    # Rota para listar autores e editoras em JSON
    #@http.route('/biblioteca/dados', type='json', auth='public')
    #@http.route('/biblioteca/dados', auth='public')
    def _listar_dados(self):

        #autores = request.env['biblioteca.autor'].search([])
        #editoras = request.env['biblioteca.editora'].search([])
        
        autores = [{'id': 1, 'nome': 'José de Alencar' }, {'id': 2, 'nome': 'Horge Amada' }]
        return Response(
            json.dumps({"mensagem": "Olá, mundo!"}),
            content_type="application/json;  charset=utf-8",
            status=200
        )
        #responseX = http.Request(self))
        
        #return {
        #    'autores': [{'id': a.id, 'nome': a.name} for a in autores],
        #    'editoras': [{'id': e.id, 'nome': e.name, 'cidade': e.cidade} for e in editoras]
        #}

        #order = request.env[res_model].browse(order_id)
        #return order.with_company(order.company_id)._update_order_line_info(
        #    product_id, quantity, **kwargs,
        #)

    # Rota para exibir uma página HTML
    @http.route('/biblioteca/pagina', type='http', auth='public', website=True)
    def pagina_biblioteca(self):
        return request.render('biblioteca.pagina_template', {
            'autores': request.env['biblioteca.autor'].search([]),
            'editoras': request.env['biblioteca.editora'].search([]),
        })