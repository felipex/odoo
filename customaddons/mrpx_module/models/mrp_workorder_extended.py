# -*- coding: utf-8 -*-

from odoo import models, fields, api, _
from odoo.exceptions import ValidationError


class MrpWorkorderExtended(models.Model):
    _inherit = 'mrp.workorder'
    _description = 'Extended Workorder with Employee Assignment and Enhanced Timing'

    # Employee assignment field
    assigned_employee_id = fields.Many2one(
        'hr.employee',
        string='Assigned Employee',
        help='Employee assigned to execute this workorder',
        tracking=True,
        index=True
    )
    
    # Planned timing fields
    date_planned_start_extended = fields.Datetime(
        string='Planned Start Date',
        help='Planned date and time to start this workorder',
        tracking=True,
        copy=False
    )
    
    # Actual timing fields
    date_actual_start = fields.Datetime(
        string='Actual Start Date',
        help='Actual date and time when the workorder was started',
        tracking=True,
        copy=False,
        readonly=True
    )
    
    date_actual_end = fields.Datetime(
        string='Actual End Date', 
        help='Actual date and time when the workorder was completed',
        tracking=True,
        copy=False,
        readonly=True
    )
    
    # Computed fields for better visibility
    duration_planned_vs_actual = fields.Float(
        string='Duration Variance (Hours)',
        compute='_compute_duration_variance',
        store=True,
        help='Difference between planned and actual duration in hours'
    )
    
    assignment_status = fields.Selection([
        ('unassigned', 'Unassigned'),
        ('assigned', 'Assigned'),
        ('in_progress', 'In Progress'),
        ('completed', 'Completed')
    ], string='Assignment Status', compute='_compute_assignment_status', store=True)
    
    @api.depends('assigned_employee_id', 'date_actual_start', 'date_actual_end', 'state')
    def _compute_assignment_status(self):
        """Compute the assignment status based on employee assignment and timing"""
        for record in self:
            if not record.assigned_employee_id:
                record.assignment_status = 'unassigned'
            elif record.date_actual_end:
                record.assignment_status = 'completed'
            elif record.date_actual_start:
                record.assignment_status = 'in_progress'
            else:
                record.assignment_status = 'assigned'
    
    @api.depends('date_planned_start_extended', 'date_actual_start', 'date_actual_end')
    def _compute_duration_variance(self):
        """Compute the variance between planned and actual duration"""
        for record in self:
            if record.date_planned_start_extended and record.date_actual_start and record.date_actual_end:
                # Calculate planned duration (assuming 8 hours default if no end date planned)
                planned_hours = 8.0  # Default planned duration
                
                # Calculate actual duration
                actual_duration = record.date_actual_end - record.date_actual_start
                actual_hours = actual_duration.total_seconds() / 3600.0
                
                record.duration_planned_vs_actual = actual_hours - planned_hours
            else:
                record.duration_planned_vs_actual = 0.0
    
    def action_start_workorder_extended(self):
        """Enhanced start action that records actual start time"""
        self.ensure_one()
        if not self.assigned_employee_id:
            raise ValidationError(_('Please assign an employee before starting the workorder.'))
        
        # Record actual start time
        self.date_actual_start = fields.Datetime.now()
        
        # Call the original start method if it exists
        if hasattr(super(), 'button_start'):
            return super().button_start()
        else:
            # Update state manually if no parent method
            self.state = 'progress'
    
    def action_finish_workorder_extended(self):
        """Enhanced finish action that records actual end time"""
        self.ensure_one()
        
        # Record actual end time
        self.date_actual_end = fields.Datetime.now()
        
        # Call the original finish method if it exists
        if hasattr(super(), 'button_finish'):
            return super().button_finish()
        else:
            # Update state manually if no parent method
            self.state = 'done'
    
    def action_assign_employee(self):
        """Action to open employee assignment wizard"""
        return {
            'name': _('Assign Employee'),
            'type': 'ir.actions.act_window',
            'res_model': 'mrp.workorder',
            'res_id': self.id,
            'view_mode': 'form',
            'view_id': self.env.ref('mrpx_module.view_mrp_workorder_assignment_form').id,
            'target': 'new',
            'context': {'default_assigned_employee_id': self.assigned_employee_id.id}
        }
    
    @api.constrains('date_planned_start_extended', 'date_actual_start', 'date_actual_end')
    def _check_date_consistency(self):
        """Validate that dates are in logical order"""
        for record in self:
            if record.date_actual_start and record.date_actual_end:
                if record.date_actual_start > record.date_actual_end:
                    raise ValidationError(_('Actual start date cannot be after actual end date.'))
            
            if record.date_planned_start_extended and record.date_actual_start:
                # Allow some flexibility - actual can be before planned
                pass  # No strict validation for planned vs actual start
