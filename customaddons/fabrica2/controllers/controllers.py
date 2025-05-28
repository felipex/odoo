# -*- coding: utf-8 -*-
from odoo import http


class Fabrica2(http.Controller):
    @http.route('/fabrica2/fabrica2', auth='public')
    def index(self, **kw):
        pin = kw.get('pin')
        if not pin:
            return "{'error': 'PIN not provided'}"
        employee = http.request.env['hr.employee'].sudo().search([('pin', '=', pin)], limit=1)
        if employee:
            return f"'name': {employee.name}"
        else:
            return "{'error': 'Employee not found'}"
        

    @http.route('/fabrica2/fabrica2/objects', auth='public')
    def list(self, **kw):
        return http.request.render('fabrica2.pagina_mrp', {
            'root': '/fabrica2/fabrica2',
            'objects': http.request.env['fabrica2.woemployee'].search([]),
        })

    @http.route('/fabrica2/fabrica2/objects/<model("fabrica2.fabrica2"):obj>', auth='public')
    def object(self, obj, **kw):
        return http.request.render('fabrica2.object', {
            'object': obj
        })

    @http.route('/fabrica2/employee/name_', type='json', auth='public', methods=['POST'], csrf=False)
    def get_employee_name_by_pin(self, **kwargs):
        pin = kwargs.get('pin')
        if not pin:
            return {'error': 'PIN not provided'}
        employee = http.request.env['hr.employee'].sudo().search([('pin', '=', pin)], limit=1)
        if employee:
            return {'name': employee.name}
        else:
            return {'error': 'Employee not found'}

    
    #@http.route('/fabrica2/employee/name', type='json', auth='public', methods=['GET'], csrf=False)
    @http.route('/fabrica2/employee/name', auth='public')
    def get_employee_name_by_pin_get(self, **kwargs):
        pin = kwargs.get('pin')
        if not pin:
            return "{'error': 'PIN not provided'}"
        employee = http.request.env['hr.employee'].sudo().search([('pin', '=', pin)], limit=1)
        if employee:
            return f"'name': {employee.name}"
        else:
            return "{'error': 'Employee not found'}"
