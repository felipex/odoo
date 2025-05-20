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

class fabrica2(models.Model):
    _name = 'fabrica2.employee'
    _description = "Fabrica2 Employee"
    _order = 'name'
    _inherit = 'hr.employee'

    new_field = fields.Char(string="New Field")

#     @api.depends('value')
#     def _value_pc(self):
#         for record in self:
#             record.value2 = float(record.value) / 100
