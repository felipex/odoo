# MRPX - Material Requirements Planning Extended

## Overview

MRPX is an Odoo ERP module that enhances manufacturing process monitoring by extending the standard Workorder model with employee assignment capabilities and enhanced timing tracking. This module provides manufacturing teams with better visibility and control over their production workflow.

## Features

### 🎯 Core Functionality
- **Employee Assignment**: Assign specific employees to workorders
- **Enhanced Timing**: Track planned start, actual start, and actual end dates
- **Status Tracking**: Real-time assignment status monitoring
- **Performance Analytics**: Duration variance analysis between planned and actual times

### 🎨 User Interface
- **Kanban Board**: Visual workorder assignment dashboard
- **Quick Assignment Form**: Streamlined employee assignment interface  
- **Enhanced Views**: Extended tree and form views with new fields
- **Smart Buttons**: Easy access to assignment actions

### 📊 Reporting & Analytics
- **Assignment Status**: Visual status indicators (Unassigned, Assigned, In Progress, Completed)
- **Duration Variance**: Comparison between planned and actual work duration
- **Employee Workload**: Track which employees are assigned to which workorders

## Installation

### Prerequisites
- Odoo 18.0 or higher
- MRP (Manufacturing) module installed
- HR (Human Resources) module installed

### Version Compatibility
- **Odoo 18.0**: ✅ Fully compatible (recommended)
- **Odoo 17.0**: ✅ Compatible with minor adjustments
- **Odoo 16.0**: ⚠️ Requires view syntax modifications (attrs → invisible)

### Installation Steps
1. Copy the `mrpx_module` folder to your Odoo addons directory
2. Update the addons list in Odoo
3. Install the "MRPX - Material Requirements Planning Extended" module
4. Configure user permissions as needed

## Usage

### Quick Assignment Workflow
1. Navigate to **Manufacturing → MRPX → Workorder Assignment**
2. Use the kanban view to see all workorders by assignment status
3. Click "Assign" button on unassigned workorders
4. Select employee and planned start date
5. Save to complete assignment

### Enhanced Workorder Management
1. Go to **Manufacturing → Work Orders** or **MRPX → Enhanced Workorders**
2. Open any workorder to see extended fields
3. Use "Assign Employee" button for quick assignment
4. Use "Start Work" and "Finish Work" buttons to track actual timing

### Monitoring and Analytics
- Check assignment status in kanban view
- Review duration variance in workorder forms
- Monitor employee workload distribution
- Track performance metrics over time

## Technical Details

### Database Schema
The module extends `mrp.workorder` model with these fields:
- `assigned_employee_id`: Many2one to hr.employee
- `date_planned_start_extended`: Datetime for planned start
- `date_actual_start`: Datetime for actual start (auto-filled)
- `date_actual_end`: Datetime for actual completion (auto-filled)
- `assignment_status`: Selection field (computed)
- `duration_planned_vs_actual`: Float for variance analysis (computed)

### Security Groups
- **MRP User**: Read/Write access to assignments
- **MRP Manager**: Full access including delete
- **HR User**: Read access to view employee assignments

### Custom Methods
- `action_start_workorder_extended()`: Enhanced start with validation
- `action_finish_workorder_extended()`: Enhanced finish with timing
- `action_assign_employee()`: Quick assignment dialog
- `_compute_assignment_status()`: Status calculation
- `_compute_duration_variance()`: Performance analysis

## Configuration

### User Permissions
Ensure users have appropriate access rights:
- **Manufacturing User**: Can assign and manage workorders
- **Manufacturing Manager**: Full administrative access
- **HR User**: Can view employee assignments

### Menu Structure
```
Manufacturing
├── MRPX
│   ├── Workorder Assignment (Kanban dashboard)
│   └── Enhanced Workorders (Extended list view)
└── Work Orders
    └── Quick Assignment (Shortcut link)
```

## Customization

### Adding Custom Fields
To add more fields to the workorder extension:

```python
# In models/mrp_workorder_extended.py
custom_field = fields.Char(string='Custom Field', help='Description')
```

### Modifying Views
Views are defined in `views/mrp_workorder_extended_views.xml` and can be customized to show/hide fields or change layouts.

### Extending Functionality
The module follows Odoo best practices and can be easily extended by inheriting from the model or creating additional views.

## Troubleshooting

### Common Issues
1. **Module not appearing**: Ensure MRP and HR modules are installed first
2. **Permission errors**: Check user access rights in security settings
3. **View not loading**: Verify XML syntax in view files
4. **Assignment not saving**: Check employee selection and required fields

### Support
For technical support or feature requests, contact the development team.

## Development

### File Structure
```
mrpx_module/
├── __init__.py
├── __manifest__.py
├── README.md
├── models/
│   ├── __init__.py
│   └── mrp_workorder_extended.py
├── views/
│   ├── mrp_workorder_extended_views.xml
│   └── menu_items.xml
├── security/
│   └── ir.model.access.csv
└── static/
    └── description/
        └── index.html
```

### Contributing
1. Follow Odoo development guidelines
2. Test all functionality thoroughly
3. Document any new features
4. Maintain backward compatibility

## License
This module is licensed under LGPL-3.

## Credits
Developed by MiniMax Agent for enhanced manufacturing process management.
