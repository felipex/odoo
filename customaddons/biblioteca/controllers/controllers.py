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


from odoo import SUPERUSER_ID
from odoo.exceptions import ValidationError as VE
from odoo.http import db_list
def ___authenticate(func):
    #@wraps(func)
    def validate_api_key(*args, **kw):
        auth_error = messages.get('access')
        key = request.httprequest.headers.get('api-key')
        if not key:
            raise VE(auth_error)

        if not request.session.db:
            request.session.db = db_list()[0]  # here we pick the first available db if the instance is a multi db and db_name has not been set in the odoo.conf

        uid = request.env['res.users.apikeys'].with_user(SUPERUSER_ID)._check_credentials(scope='rpc', key=key)

        if not uid:
            logger.error(f"{func.__name__} auth_error['message']")
            raise VE(auth_error)

        request.update_env(user=uid)  # here we switch the user to the one owning this key
        return func(*args, **kw)

    return validate_api_key

def xauthenticate(func):

    def validate_api_key(*args, **kw):
        key = request.httprequest.headers.get('api-key')
        print("----------------', key, '-----------------------")
        return func(*args, **kw)

    return validate_api_key

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
    #@xauthenticate
    def listar_dados(self):
        from ..models.autor import Autor

        #autores = self.env['biblioteca.autor'].search_read([], ['id', 'name'])
        #print("------ Deu certo -----")
        autores = request.env['biblioteca.autor'].search_read([], ['id', 'name'])
        
        return Response(
            json.dumps(autores, ensure_ascii=False),
            content_type='application/json; charset=utf-8'
        )

    @http.route('/biblioteca/dados', type='http', auth='public', methods=['GET'], csrf=False)
    #@xauthenticate
    def listar_dados_ok(self):
        autores = request.env['biblioteca.autor'].search_read([], ['id', 'name'])
        
        return Response(
            json.dumps(autores, ensure_ascii=False),
            content_type='application/json; charset=utf-8'
        )

   
    # Rota para exibir uma página HTML
    @http.route('/biblioteca/pagina', type='http', auth='public', website=True)
    def pagina_biblioteca(self):
        return request.render('biblioteca.pagina_template', {
            'autores': request.env['biblioteca.autor'].search([]),
            'editoras': request.env['biblioteca.editora'].search([]),
        })