# -*- coding: utf-8 -*-
from odoo import http


class Fabrica2(http.Controller):
     @http.route('/fabrica2/fabrica2', auth='public')
     def index(self, **kw):
         return "Hello, world"

     @http.route('/fabrica2/fabrica2/objects', auth='public')
     def list(self, **kw):
         return http.request.render('fabrica2.listing', {
             'root': '/fabrica2/fabrica2',
             'objects': http.request.env['fabrica2.fabrica2'].search([]),
         })

     @http.route('/fabrica2/fabrica2/objects/<model("fabrica2.fabrica2"):obj>', auth='public')
     def object(self, obj, **kw):
         return http.request.render('fabrica2.object', {
             'object': obj
         })

