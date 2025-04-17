{
    'name': 'Meu Módulo',
    'version': '1.0',
    'category': 'Custom',
    'summary': 'Descrição curta',
    'depends': ['base'],  # Dependências de outros módulos
    'data': [
        'security/ir.model.access.csv',
        'views/meu_modelo_views.xml',
    ],
    #'demo': ['data/dados_demo.xml'],  # Opcional
    'installable': True,
    'application': True,
}