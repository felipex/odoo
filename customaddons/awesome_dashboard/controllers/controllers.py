# -*- coding: utf-8 -*-

import logging
import random

from odoo import http
from odoo.http import request, Response
import json

logger = logging.getLogger(__name__)

#API KEY 0180ffacbd565d6abedf3d94dd686321ded695fa
#7d3e8ad0a806b0eede2e36ccdf2a77d4d1350116

'''
curl -X GET \
     -H "Accept: application/json" \
     -H "Authorization: Bearer 7d3e8ad0a806b0eede2e36ccdf2a77d4d1350116" \
     http://localhost:8069/dashboard/produtos
'''
'''
curl -v -X GET \
  -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36" \
  -H "Accept: application/json" \
  -H "Cookie: session_id=InfbngZxJDnKh5XCWlQmFqf2XB6c4uXGWit-juNvDAGOBIRZ-mldyUZtghLRQLUaTE-sZdY62cBRDySFEYsd; frontend_lang=pt_BR" \
  http://localhost:8069/dashboard/produtos
'''

class AwesomeDashboard(http.Controller):

    def _get_datetime(self, value):
        if (value):
            return value.isoformat()
        else:
            return value

    def _get_workorder_ids(self, workorder_ids):
        WorkOrder = request.env['mrp.workorder']
        workorders = WorkOrder.search_read([('id', 'in', workorder_ids)], ['id', 'name', 'workcenter_id', 'production_state', 
        'date_start', 'date_finished', 'duration_expected', 'duration', 'progress', 
        'qty_producing', 'qty_remaining', 'qty_produced', 'production_id'])
        wos = []
        print('-------')
        for wo in workorders:
            wos.append({
                'id': wo['id'],
                'name': wo['name'],
                'workcenter_id': wo['workcenter_id'], 
                'production_state': wo['production_state'], 
                'date_start': self._get_datetime(wo['date_start']),
                'date_finished': self._get_datetime(wo['date_finished']),
                'duration_expected': wo['duration_expected'],
                'duration': wo['duration'],
                'progress': wo['progress'],
                'qty_producing': wo['qty_remaining'],
                'qty_produced': wo['qty_produced'],
            })
            print(wo['production_id'], wo['name'], wo['date_start'], wo['date_finished'])
        return wos
        



    @http.route('/dashboard/producao', type='http', auth='public', methods=['GET'], csrf=False)
    #@http.route('/dashboard/produtos', type='http', auth='public', methods=['GET'], csrf=False)
    def produtos(self):
        #producoes = models.execute_kw(db, uid, password, 'mrp.production', 'search_read', [[('state', 'in', ['draft', 'confirmed', 'progress'])]], {'fields': ['name', 'priority', 'product_id', 'state']})
        #producoes = request.env['mrp.production'].search_read([[('state', 'in', ['draft', 'confirmed', 'progress'])]], {'fields': ['name', 'priority', 'product_id', 'state']})
        Producao = request.env['mrp.production']
        producoes = Producao.search_read([('state', 'in', ['draft', 'confirmed', 'progress'])], 
        ['name', 'priority', 'product_id', 'state', 'date_start', 'date_deadline', 'date_finished', 'duration_expected',
        'duration', 'workorder_ids', 'user_id', 'qty_produced', 'workorder_ids'])

        producoes_ser = []
        for p in producoes:
            print(p)
            producoes_ser.append({
                'id': p['id'],
                'name': p['name'],
                'priority': p['priority'],
                'product_id': p['product_id'],
                'state': p['state'],
                'date_start': p['date_start'].isoformat(),
                'date_deadline': self._get_datetime(p['date_deadline']),
                'date_finished': p['date_finished'].isoformat(),
                'duration_expected': p['duration_expected'],
                'duration':  p['duration'],
                'workorder_ids': p['workorder_ids'],
                'user_id': p['user_id'],
                'qty_produced': p['qty_produced'],
                'workorder_ids': p['workorder_ids'],
                'workorders': self._get_workorder_ids(p['workorder_ids'])
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

