# -*- coding: utf-8 -*-

from odoo import models, fields, api

destaque = '\033[31m'

class EmployeeWorkorder(models.Model):
    _name = 'fabrica4.employee_workorder'
    _description = 'Employee Workorder'
 
    name = fields.Char(string='Nome', compute='_compute_name', store=False)

    @api.depends('workorder_id', 'employee_id')
    def _compute_name(self):
        for record in self:
            record.name = f'{record.workorder_id.name} - {record.employee_id.name}'


    employee_id = fields.Many2one(
        'hr.employee', 
        string='Funcionário', 
        required=True)
    workorder_id = fields.Many2one(
        'mrp.workorder', 
        string='Ordem de Trabalho', 
        unique=True,
        index=True,
        required=True)
    planned_start_date = fields.Date(
        string='Data de Início Planejada', 
        required=True, 
        default=fields.Date.today())
    
    workcenter_id = fields.Many2one(related='workorder_id.workcenter_id', string='Centro de Trabalho', store=False)
    
    start_date = fields.Date(string='Data de Início', required=False)
    end_date = fields.Date(string='Data de Término', required=False)
    
    def write(self, vals):
        super(EmployeeWorkorder, self).write(vals)
        for record in self:
            if 'workorder_id' in vals:
                self._onchange_workorder_id(record.id, vals['workorder_id'])
        

    def create(self, vals_list):
        res = super(EmployeeWorkorder, self).create(vals_list)
        if 'workorder_id' in vals_list:
            self._onchange_workorder_id(res.id, vals_list['workorder_id'])
        return res


    def _onchange_workorder_id(self, employee_workorder_id, workorder_id):
        workorder = self.env['mrp.workorder'].browse(workorder_id)
        if workorder:
            workorder.write({'employee_workorder_id': employee_workorder_id})
        else:
            workorder.write({'employee_workorder_id': None})



class Workorder(models.Model):
    _inherit = 'mrp.workorder'

    employee_workorder_id = fields.Many2one(
        'fabrica4.employee_workorder',
        string='Funcionário',
        index=True, 
        unique=True
    )
    employee_name = fields.Char(string='Funcionário', compute='_compute_employee_name', store=True)

    assigned = fields.Boolean(compute='_compute_assigned', store=False)

    @api.depends('employee_workorder_id')
    def _compute_assigned(self):
        for record in self:
            record.assigned = record.employee_workorder_id is not None

    @api.depends('employee_workorder_id')
    def _compute_employee_name(self):
        for record in self:
            record.employee_name = record.employee_workorder_id.employee_id.name