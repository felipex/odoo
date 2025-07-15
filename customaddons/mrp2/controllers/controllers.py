# -*- coding: utf-8 -*-
# from odoo import http


# class Mrp2(http.Controller):
#     @http.route('/mrp2/mrp2', auth='public')
#     def index(self, **kw):
#         return "Hello, world"

#     @http.route('/mrp2/mrp2/objects', auth='public')
#     def list(self, **kw):
#         return http.request.render('mrp2.listing', {
#             'root': '/mrp2/mrp2',
#             'objects': http.request.env['mrp2.mrp2'].search([]),
#         })

#     @http.route('/mrp2/mrp2/objects/<model("mrp2.mrp2"):obj>', auth='public')
#     def object(self, obj, **kw):
#         return http.request.render('mrp2.object', {
#             'object': obj
#         })

