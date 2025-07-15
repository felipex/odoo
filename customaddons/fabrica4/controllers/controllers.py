# -*- coding: utf-8 -*-
# from odoo import http


# class Fabrica4(http.Controller):
#     @http.route('/fabrica4/fabrica4', auth='public')
#     def index(self, **kw):
#         return "Hello, world"

#     @http.route('/fabrica4/fabrica4/objects', auth='public')
#     def list(self, **kw):
#         return http.request.render('fabrica4.listing', {
#             'root': '/fabrica4/fabrica4',
#             'objects': http.request.env['fabrica4.fabrica4'].search([]),
#         })

#     @http.route('/fabrica4/fabrica4/objects/<model("fabrica4.fabrica4"):obj>', auth='public')
#     def object(self, obj, **kw):
#         return http.request.render('fabrica4.object', {
#             'object': obj
#         })

