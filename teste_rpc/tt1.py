import xmlrpc
from xmlrpc import client
from dotenv import load_dotenv
import os

from pprint import pprint

load_dotenv()
url = 'http://localhost:8069'
db = os.environ['ODOO_DATABASE']
username = os.environ['ODOO_USER']
password = os.environ['ODOO_PASSWORD']


common = client.ServerProxy('{}/xmlrpc/2/common'.format(url))
uid = common.authenticate(db, username, password, {})

models = client.ServerProxy('{}/xmlrpc/2/object'.format(url))

#mm = models.execute_kw(db, uid, password, 'res.partner', 'search', [[['is_company', '=', True]]])
#mm = models.execute_kw(db, uid, password, 'res.partner', 'filtered', [[['partner_id.is_company']]])
#print(mm)

#mm = models.execute_kw(db, uid, password, 'biblioteca.autor', 'search')
mm = models.execute_kw(db, uid, password, 'mrp.production', 'search_read', [[('state', 'in', ['draft', 'confirmed', 'progress'])]], {'fields': ['name', 'priority', 'product_id', 'state']})
pprint(mm)

mm = models.execute(db, uid, password, 'mrp.production', 'search', [])
pprint(mm)

mm = models.execute_kw(db, uid, password, 'mrp.production', 'search', [[('state', 'in', ['progress'])]])
pprint(mm)


[record] = models.execute_kw(db, uid, password, 'mrp.production', 'read', [mm[-1]])
pprint(record)
pprint(record['id'])
pprint(record['name'])
pprint(record['display_name'])
pprint(record['product_id'])

mm = models.execute_kw(db, uid, password, 'mrp.workorder', 'search', [[('state', 'in', ['progress'])]])
pprint(mm)


[record] = models.execute_kw(db, uid, password, 'mrp.workorder', 'read', [mm[-1]])
pprint(record)