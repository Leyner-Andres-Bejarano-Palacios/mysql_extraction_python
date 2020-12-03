from sqlalchemy import create_engine
mysql_conn_str = "mysql+pymysql://wordpress:wordpress@db:3306/information_schema"
engine = create_engine(mysql_conn_str)
connection = engine.connect()
q = connection.execute('select * from CHARACTER_SETS')
available_tables = q.fetchall()
print(available_tables)



