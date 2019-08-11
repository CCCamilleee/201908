import MySQLdb


def ConnectDB(DBname, User, Passwd):
    DB = MySQLdb.connect('localhost', User, Passwd, DBname, charset='utf8')
    return DB
def DisConnectDB(DB):
    DB.close()
    return ''
def InsertIntoDB(DB, TableName, Field, Data):
    Field_Series = '('
    for i in range(0, len(Field)):
        Field_Series = Field_Series + str(Field[i])
        if i<len(Field)-1:
            Field_Series = Field_Series + ','
    Field_Series = Field_Series + ')'

    Data_Series = '('
    for i in range(0, len(Data)):
        Data_Series = Data_Series + str(Data[i])
        if i < len(Data)-1:
            Data_Series = Data_Series + ','
    Data_Series = Data_Series + ')'


    SQL = 'Insert into ' + TableName + Field_Series + ' Values' + Data_Series
    cursor = DB.cursor()
    cursor.execute(SQL)
    cursor.execute('COMMIT')
    return ''
def InsertIntoDB_SQL(DB, SQL):
    cursor = DB.cursor()
    cursor.execute(SQL)
    cursor.execute('COMMIT')
    return ''

def DML_INSERT_Para(Field, Data, TableName = 'dol_orderinformation_f', DBname = 'dol', User = 'root', Passwd = 'mubin1996'):

    TableName = TableName

    DB = ConnectDB(DBname, User, Passwd)
    print('1')
    InsertIntoDB(DB, TableName, Field, Data)

    DisConnectDB(DB)

    return ''
def DML_INSERT_SQL(SQL, DBname = 'dol', User = 'root', Passwd = 'mubin1996'):
    DB = ConnectDB(DBname, User, Passwd)
    InsertIntoDB_SQL(DB, SQL)
    DisConnectDB(DB)
    return ''

