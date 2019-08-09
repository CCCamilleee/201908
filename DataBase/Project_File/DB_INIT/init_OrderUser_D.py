import MySQLdb


def ConnectDB(DBname, User, Passwd):

    DB = MySQLdb.connect('localhost', User, Passwd, DBname, charset='utf8')

    return DB

def WriteIntoDB(cursor, Age, Code):
    SQL = 'insert into etl_orderuser_d(Feature_Flag, Birth, Age_Code) values("A",'+str(Age)+','+str(Code)+')'
    cursor.execute(SQL)

    return ''

def DisConnectDB(DB):
    DB.close()
    return ''

def Init_OrderUser_d(DBname, User = 'root', Passwd = 'mubin1996'):
    SQL1 = 'insert into etl_orderuser_d(Feature_Flag, Sex, Sex_Code) values("S","女","F")'
    SQL2 = 'insert into etl_orderuser_d(Feature_Flag, Sex, Sex_Code) values("S","男","M")'

    DB = ConnectDB(DBname, User, Passwd)
    cursor = DB.cursor()
    cursor.execute(SQL1)
    cursor.execute(SQL2)

    for Age in range(1,101):
        Code = 2018001 + (Age-1)/5
        WriteIntoDB(cursor, Age, Code)

    cursor.execute('COMMIT')

    DisConnectDB(DB)

    return ''
