# -*- coding: utf-8 -*-
{
    'name': 'MRPX - Material Requirements Planning Extended',
    'version': '18.0.1.0.0',
    'category': 'Manufacturing',
    'summary': 'Enhanced Manufacturing Process Monitoring with Employee Assignment and Timing Tracking',
    'description': """
        MRPX Module - Material Requirements Planning Extended
        ====================================================
        
        This module enhances the manufacturing process monitoring by extending the Workorder model with:
        
        Key Features:
        * Employee assignment to workorders
        * Planned start date tracking
        * Actual start date tracking  
        * Actual end date tracking
        * Improved workorder assignment interface
        * Enhanced manufacturing process visibility
        
        This module helps manufacturing teams better track and manage their production workflow
        by providing clear assignment and timing visibility for each workorder.
    """,
    'author': 'MiniMax Agent',
    'website': '',
    'depends': ['mrp', 'hr'],
    'data': [
        'security/ir.model.access.csv',
        'views/mrp_workorder_extended_views.xml',
        'views/menu_items.xml',
    ],
    'demo': [],
    'installable': True,
    'auto_install': False,
    'application': True,
    'license': 'LGPL-3',
}
