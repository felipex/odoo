# -*- coding: utf-8 -*-
{
    'name': "Biblioteca",

    'summary': "Gerenciamento de livros de uma biblioteca geral",

    'description': """
Gerenciamento de livros de uma biblioteca e empréstimos de exemplares dos livros
    """,

    'author': "Felipe Cavalcante",
    'website': "https://www.yourcompany.com",

    # Categories can be used to filter modules in modules listing
    # Check https://github.com/odoo/odoo/blob/15.0/odoo/addons/base/data/ir_module_category_data.xml
    # for the full list
    'category': 'Custom',
    'version': '0.1',

    # any module necessary for this one to work correctly
    'depends': ['base'],

    # always loaded
    'data': [
        # 'security/ir.model.access.csv',
        'views/autor.xml',
        'views/editora.xml',
        'views/livro.xml',
        'views/usuario.xml',
        'views/exemplar.xml',
        'views/menus.xml',
        'views/templates.xml',
        'views/dashboard.xml',

        'templates/biblioteca_page.xml',
        'security/ir.model.access.csv',
    ],
    # only loaded in demonstration mode
    'demo': [
        'demo/demo.xml',
    ],

    'installable': True,
    'application': True,
    'license': 'LGPL-3',

}

