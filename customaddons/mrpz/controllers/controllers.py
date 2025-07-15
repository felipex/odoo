# -*- coding: utf-8 -*-
# from odoo import http


# class Mrpz(http.Controller):
#     @http.route('/mrpz/mrpz', auth='public')
#     def index(self, **kw):
#         return "Hello, world"

#     @http.route('/mrpz/mrpz/objects', auth='public')
#     def list(self, **kw):
#         return http.request.render('mrpz.listing', {
#             'root': '/mrpz/mrpz',
#             'objects': http.request.env['mrpz.mrpz'].search([]),
#         })

#     @http.route('/mrpz/mrpz/objects/<model("mrpz.mrpz"):obj>', auth='public')
#     def object(self, obj, **kw):
#         return http.request.render('mrpz.object', {
#             'object': obj
#         })

from odoo import http
from odoo.http import request

class CustomFormController(http.Controller):
    @http.route('/custom_form', type='http', auth='public', website=True, methods=['POST', 'GET'])
    def render_custom_form(self, **post):

        values = {
            'employees': request.env['hr.employee'].search([]),
            'workorders': request.env['mrp.workorder'].search([]),
        }
        if request.httprequest.method == 'POST':
            print('-------------- POST ------------------')
            print(post)
            print(request.httprequest)

        return request.render('mrpz.custom_form_no_model', values)