import MySQLdb


def ConnectDB(DBname, User, Passwd):
    DB = MySQLdb.connect('localhost', User, Passwd, DBname, charset='utf8')
    return DB
def DisConnectDB(DB):
    DB.close()
    return ''
def DeleteFromDB(DB, TableName, Require):

    SQL = 'Delete From ' + TableName + ' Where ' + Require
    cursor = DB.cursor()
    cursor.execute(SQL)
    cursor.execute('COMMIT')
    return ''
def DeleteFromDB_SQL(DB, SQL):
    cursor = DB.cursor()
    cursor.execute(SQL)
    cursor.execute('COMMIT')
    return ''

def DML_DELETE_Para(Require='1=1', TableName = 'dol_orderinformation_f', DBname = 'dol', User = 'root', Passwd = 'mubin1996'):

    TableName = TableName

    DB = ConnectDB(DBname, User, Passwd)
    DeleteFromDB(DB, TableName, Require)
    DisConnectDB(DB)

    return ''
def DML_DELETE_SQL(SQL, DBname = 'dol', User = 'root', Passwd = 'mubin1996'):
    DB = ConnectDB(DBname, User, Passwd)
    DeleteFromDB_SQL(DB, SQL)
    DisConnectDB(DB)
    return ''

