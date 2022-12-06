import psycopg2
import psycopg2.extras
from psycopg2.extras import RealDictCursor
import json
from io import StringIO
from flask import Flask

app = Flask(__name__)
connection = psycopg2.connect('postgresql://postgres:{password}@localhost/bank_offices')

select_city = """select id, office_code, office_name, office_adress from offices where office_adress like (%s)"""

@app.get('/api/<city>')
def get_all(city):
    city = '%г.' + city + '%'
    with connection:
        with connection.cursor(cursor_factory=RealDictCursor) as cursor:
            cursor.execute(select_city, (city,))
            d = cursor.fetchall()
            city_json = json.dumps(d).encode('utf8')
            return city_json


if __name__ == '__main__':
    app.run(debug=True)
