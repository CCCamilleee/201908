import init_Area_D
import init_orderstatus_d
import init_OrderUser_D
import init_Product_D
import Data2MySQL

def Init_Area_D(url, User, Passwd, DBname, TableName):
    init_Area_D.Init_Area_D(url, User, Passwd, DBname, TableName)
    return 'success'

def Init_OrderStatus_D(DBname, User = 'root', Passwd = 'mubin1996'):
    init_orderstatus_d.Init_OrderStatus_d(DBname, User, Passwd)
    return ''

def Init_OrderUser_D(DBname, User, Passwd):
    init_OrderUser_D.Init_OrderUser_d(DBname, User, Passwd)
    return ''

def Init_Product_D(DBname, User, Passwd):
    init_Product_D.Init_Product_d(DBname, User, Passwd)
    return ''

def Data2MySQL(url, User, Passwd):
    Data2MySQL.Data2MySQL(url, User, Passwd)
    return ''