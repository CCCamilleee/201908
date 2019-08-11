import MySQLdb
import string

def ConnectDB(DBname, User, Passwd):
    DB = MySQLdb.connect('localhost', User, Passwd, DBname, charset='utf8')
    return DB
def DisConnectDB(DB):
    DB.close()
    return ''
def UpdateDB(DB, TableName, FieldValue, Require):
    FieldValue_Series = ''

    for column in FieldValue:
        FieldValue_Series = FieldValue_Series + str(column) + ' = ' +str(FieldValue[column]) + ','

    FieldValue_Series = FieldValue_Series.strip(string.punctuation)

    #SQL = Update table_name set column_name = *** where ***
    SQL = 'Update ' + TableName + ' set ' + FieldValue_Series + ' where ' + Require
    cursor = DB.cursor()
    cursor.execute(SQL)
    cursor.execute('COMMIT')
    return ''
def UpdateDB_SQL(DB, SQL):
    cursor = DB.cursor()
    cursor.execute(SQL)
    cursor.execute('COMMIT')
    return ''

def DML_Update_Para(FieldValue, Require='1=1', TableName = 'dol_orderinformation_f', DBname = 'dol', User = 'root', Passwd = 'mubin1996'):

    TableName = TableName

    DB = ConnectDB(DBname, User, Passwd)
    print('1')
    UpdateDB(DB, TableName, FieldValue, Require)

    DisConnectDB(DB)

    return ''
def DML_Update_SQL(SQL, DBname = 'dol', User = 'root', Passwd = 'mubin1996'):
    DB = ConnectDB(DBname, User, Passwd)
    UpdateDB_SQL(DB, SQL)
    DisConnectDB(DB)
    return ''

