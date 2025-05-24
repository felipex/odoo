# -*- coding: utf-8 -*-

from odoo import models, fields, api


# class fabrica2(models.Model):
#     _name = 'fabrica2.fabrica2'
#     _description = 'fabrica2.fabrica2'

#     name = fields.Char()
#     value = fields.Integer()
#     value2 = fields.Float(compute="_value_pc", store=True)
#     description = fields.Text()
#
#     @api.depends('value')
#     def _value_pc(self):
#         for record in self:
#             record.value2 = float(record.value) / 100

class WOEmployee(models.Model):
    _name = 'fabrica2.woemployee'
    _description = "Fabrica2 WO-Employee"
    _order = 'name'
    _rec_name = 'name'

    employee = fields.Many2one('hr.employee')
    workorder = fields.Many2one('mrp.workorder')

    name = fields.Char(compute='_get_name', store=True)
    @api.depends('employee', 'workorder')
    def _get_name(self):
        for record in self:
            record.name = f'{record.employee.name} - ({record.workorder.name})'    


    state = fields.Char(compute='_get_state')
    @api.depends('workorder')
    def _get_state(self):
        for record in self:
            record.state = record.workorder.state   

#     @api.depends('value')
#     def _value_pc(self):
#         for record in self:
#             record.value2 = float(record.value) / 100
