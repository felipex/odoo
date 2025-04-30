# -*- coding: utf-8 -*-

import logging
import random

from odoo import http
from odoo.http import request, Response
import json

logger = logging.getLogger(__name__)

class AwesomeDashboard(http.Controller):

    @http.route('/dashboard/produtos', type='http', auth='public', methods=['GET'], csrf=False)
    def produtos(self):
        #producoes = models.execute_kw(db, uid, password, 'mrp.production', 'search_read', [[('state', 'in', ['draft', 'confirmed', 'progress'])]], {'fields': ['name', 'priority', 'product_id', 'state']})
        #producoes = request.env['mrp.production'].search_read([[('state', 'in', ['draft', 'confirmed', 'progress'])]], {'fields': ['name', 'priority', 'product_id', 'state']})
        Producao = request.env['mrp.production']
        producoes = Producao.search_read([('state', 'in', ['draft', 'confirmed', 'progress'])], ['name', 'priority', 'product_id', 'state', 'date_start'])

        producoes_ser = []
        for p in producoes:
            print(p)
            producoes_ser.append({
                'id': p['id'],
                'name': p['name'],
                'priority': p['priority'],
                'product_id': p['product_id'],
                'state': p['state'],
                'date_start': p['date_start'].isoformat()

            })
        return Response(
            json.dumps(producoes_ser, ensure_ascii=False),
            content_type='application/json; charset=utf-8'
        )

    @http.route('/awesome_dashboard/statistics', type='json', auth='user')
    def get_statistics(self):
        """
        Returns a dict of statistics about the orders:
            'average_quantity': the average number of t-shirts by order
            'average_time': the average time (in hours) elapsed between the
                moment an order is created, and the moment is it sent
            'nb_cancelled_orders': the number of cancelled orders, this month
            'nb_new_orders': the number of new orders, this month
            'total_amount': the total amount of orders, this month
        """

        return {
            'average_quantity': random.randint(4, 12),
            'average_time': random.randint(4, 123),
            'nb_cancelled_orders': random.randint(0, 50),
            'nb_new_orders': random.randint(10, 200),
            'orders_by_size': {
                'm': random.randint(0, 150),
                's': random.randint(0, 150),
                'xl': random.randint(0, 150),
            },
            'total_amount': random.randint(100, 1000)
        }

