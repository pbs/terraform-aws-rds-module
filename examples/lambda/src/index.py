import os
import pymysql

MYSQL_HOST = os.getenv('MYSQL_HOST')
MYSQL_READONLY_HOST = os.getenv('MYSQL_READONLY_HOST')
MYSQL_USER = os.getenv('MYSQL_USER')
MYSQL_PASSWORD = os.getenv('MYSQL_PASSWORD')


def handler(event, context):
    print("Testing DB")
    print("Connecting to Primary")
    db = pymysql.connect(
        host=MYSQL_HOST,
        user=MYSQL_USER,
        password=MYSQL_PASSWORD,
    )
    print("Connecting to Read Only Endpoint")
    db_ro = pymysql.connect(
        host=MYSQL_READONLY_HOST,
        user=MYSQL_USER,
        password=MYSQL_PASSWORD,
    )

    with db.cursor() as cursor:
        print("Create DB if not exists")
        cursor.execute("CREATE DATABASE IF NOT EXISTS test")
        print("Create table")
        cursor.execute(
            "CREATE TABLE IF NOT EXISTS test.test (id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(255))")
        print("Insert data into table")
        cursor.execute("INSERT INTO test.test (name) VALUES ('test')")
        db.commit()

    with db_ro.cursor() as ro_cursor:
        print("Select data from table")
        ro_cursor.execute("SELECT * FROM test.test")
        print("Fetch data")
        result = ro_cursor.fetchall()
        print("Verify results")
        assert result[0][1] == 'test'
