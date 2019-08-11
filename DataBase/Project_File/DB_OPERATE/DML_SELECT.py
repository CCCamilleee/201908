import MySQLdb
import string
import pandas as pd

def ConnectDB(DBname, User, Passwd):
    DB = MySQLdb.connect('localhost', User, Passwd, DBname, charset='utf8')
    return DB
def DisConnectDB(DB):
    DB.close()
    return ''
def SelectFromDB(DB, TableName, Field, Require):

    Field_Series = ''

    for i in range(0, len(Field)):
        Field_Series = Field_Series + Field[i] + ','

    Field_Series = Field_Series.strip(string.punctuation)

    SQL = 'select ' + Field_Series + ' from ' + TableName + ' where ' + Require
    cursor = DB.cursor()
    cursor.execute(SQL)
    Data = pd.DataFrame(cursor.fetchall())
    return Data
def SelectFromDB_SQL(DB, SQL):
    cursor = DB.cursor()
    cursor.execute(SQL)
    Data = pd.DataFrame(cursor.fetchall())
    return Data

def DML_SELECT_Para(Field, Require='1=1', TableName = 'dol_orderinformation_f', DBname = 'dol', User = 'root', Passwd = 'mubin1996'):

    TableName = TableName
    DB = ConnectDB(DBname, User, Passwd)
    Data = SelectFromDB(DB, TableName, Field, Require)
    DisConnectDB(DB)
    return Data
def DML_SELECT_SQL(SQL, DBname = 'dol', User = 'root', Passwd = 'mubin1996'):
    DB = ConnectDB(DBname, User, Passwd)
    Data = SelectFromDB_SQL(DB, SQL)
    DisConnectDB(DB)
    return Data

