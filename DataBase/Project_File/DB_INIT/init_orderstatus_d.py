import MySQLdb


def ConnectDB(DBname, User, Passwd):

    DB = MySQLdb.connect('localhost', User, Passwd, DBname, charset='utf8')

    return DB


def DisConnectDB(DB):
    DB.close()
    return ''

def Init_OrderStatus_d(DBname, User = 'root', Passwd = 'mubin1996'):
    SQL1 = 'insert into etl_orderstatus_d(Feature_Flag, ActiveStatus, ActiveStatus_Code) values("A","已激活", 1)'
    SQL2 = 'insert into etl_orderstatus_d(Feature_Flag, ActiveStatus, ActiveStatus_Code) values("A","未激活", 0)'
    SQL3 = 'insert into etl_orderstatus_d(Feature_Flag, ActiveStatus, ActiveStatus_Code) values("A","激活失败", -1)'

    SQL4 = 'insert into etl_orderstatus_d(Feature_Flag, OrderStatus, OrderStatus_Code) values("S","成功关闭", "success")'
    SQL5 = 'insert into etl_orderstatus_d(Feature_Flag, OrderStatus, OrderStatus_Code) values("S","处理中", "processing")'
    SQL6 = 'insert into etl_orderstatus_d(Feature_Flag, OrderStatus, OrderStatus_Code) values("S","审核处理中", "checking")'
    SQL7 = 'insert into etl_orderstatus_d(Feature_Flag, OrderStatus, OrderStatus_Code) values("S","未签收", "unsigned")'
    SQL8 = 'insert into etl_orderstatus_d(Feature_Flag, OrderStatus, OrderStatus_Code) values("S","待分配退单", "cancel_going")'
    SQL9 = 'insert into etl_orderstatus_d(Feature_Flag, OrderStatus, OrderStatus_Code) values("S","待支付退单", "cancel_unpay")'
    SQL10 = 'insert into etl_orderstatus_d(Feature_Flag, OrderStatus, OrderStatus_Code) values("S","物流退单", "cancel_post")'
    SQL11 = 'insert into etl_orderstatus_d(Feature_Flag, OrderStatus, OrderStatus_Code) values("S","系统退单", "cancel_sys")'
    SQL12 = 'insert into etl_orderstatus_d(Feature_Flag, OrderStatus, OrderStatus_Code) values("S","订单处理退单", "cancel_order")'
    SQL13 = 'insert into etl_orderstatus_d(Feature_Flag, OrderStatus, OrderStatus_Code) values("S","客户拒收退单", "cancel_refuse")'
    SQL14 = 'insert into etl_orderstatus_d(Feature_Flag, OrderStatus, OrderStatus_Code) values("S","新订单中心退单", "cancel_center")'


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
    cursor.execute(SQL11)
    cursor.execute(SQL12)
    cursor.execute(SQL13)
    cursor.execute(SQL14)

    cursor.execute('COMMIT')

    DisConnectDB(DB)

    return ''
