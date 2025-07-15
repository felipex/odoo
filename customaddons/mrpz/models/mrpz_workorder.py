# -*- coding: utf-8 -*-
from odoo import models, fields, api

class MrpWorkorderExtended(models.Model):
    _inherit = 'mrp.workorder'

    employee_id = fields.Many2one(
        'hr.employee', 
        string='Funcionário', 
        required=False)

    effective_start_date = fields.Datetime(
        string='Data de Início Efetiva', 
        required=False)

    effective_end_date = fields.Datetime(
        string='Data de Término Efetiva', 
        required=False)
    
    
    
    def assign_employee(self, employee_id, effective_start_date):
        print("Ação em lote executada")
        for workorder in self:
            workorder.employee_id = employee_id
            workorder.effective_start_date = effective_start_date
            print(workorder.name, employee_id)
    


class AssignEmployeeWizard(models.TransientModel):
    _name = 'assign.employee.wizard'
    _description = 'Selecionar Funcionário para Ordens de Produção'

    employee_id = fields.Many2one('hr.employee', string='Funcionário', required=True)
    workorder_ids = fields.Many2many('mrp.workorder', string='Ordens de Produção', required=True)
    effective_start_date = fields.Datetime(
        string='Data de Início Efetiva', 
        required=True,
        default=fields.Datetime.now())
    

    def action_assign_employee(self):
        for workorder in self.workorder_ids:
            workorder.assign_employee(self.employee_id, self.effective_start_date)
            print(workorder.name, self.employee_id)

        return {'type': 'ir.actions.act_window_close'}