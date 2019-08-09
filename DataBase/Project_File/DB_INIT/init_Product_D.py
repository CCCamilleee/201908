import MySQLdb


def ConnectDB(DBname, User, Passwd):

    DB = MySQLdb.connect('localhost', User, Passwd, DBname, charset='utf8')

    return DB

# def WriteIntoDB(cursor, Age, Code):
#     SQL = 'insert into dsl_orderuser_d(Feature_Flag, Birth, Age_Code) values("A",'+str(Age)+','+str(Code)+')'
#     cursor.execute(SQL)
#     return ''

def DisConnectDB(DB):
    DB.close()
    return ''

def Init_Product_d(DBname, User = 'root', Passwd = 'mubin1996'):
    SQL1 = 'insert into etl_product_d(Feature_Flag, NDCName, NDCCode) values("N","中国移动", 100)'
    SQL2 = 'insert into etl_product_d(Feature_Flag, NDCName, NDCCode) values("N","中国联通", 101)'
    SQL3 = 'insert into etl_product_d(Feature_Flag, NDCName, NDCCode) values("N","中国电信", 102)'
    SQL10 = 'insert into etl_product_d(Feature_Flag, NDCName, NDCCode) values("N","虚拟运营商", 103)'

    SQL4 = 'insert into etl_product_d(Feature_Flag, ProductName, ProductName_Code) values("P","腾讯大王卡", 1)'
    SQL5 = 'insert into etl_product_d(Feature_Flag, ProductName, ProductName_Code) values("P","大王超级会员卡", 2)'
    SQL6 = 'insert into etl_product_d(Feature_Flag, ProductName, ProductName_Code) values("P","腾讯大王卡回归", 3)'
    SQL7 = 'insert into etl_product_d(Feature_Flag, ProductName, ProductName_Code) values("P","腾讯地王卡", 4)'
    SQL8 = 'insert into etl_product_d(Feature_Flag, ProductName, ProductName_Code) values("P","天王卡", 5)'
    SQL9 = 'insert into etl_product_d(Feature_Flag, ProductName, ProductName_Code) values("P","腾讯亲情卡", 6)'


    DB = ConnectDB(DBname, User, Passwd)
    cursor = DB.cursor()

    cursor.execute(SQL1)
    cursor.execute(SQL2)
    cursor.execute(SQL3)
    cursor.execute(SQL4)
    cursor.execute(SQL5)
    cursor.execute(SQL6)
    cursor.execute(SQL7)
    cursor.execute(SQL8)
    cursor.execute(SQL9)
    cursor.execute(SQL10)

    cursor.execute('COMMIT')

    DisConnectDB(DB)

    return ''
