import DML_INSERT
import DML_DELETE
import DML_SELECT
import DML_UPDATE


def DML_INSERT_Para(Field, Data, TableName = 'dol_orderinformation_f', DBname = 'dol', User = 'root', Passwd = 'mubin1996'):
    DML_INSERT.DML_INSERT_Para(Field, Data, TableName, DBname, User, Passwd)
    return ''
def DML_INSERT_SQL(SQL, DBname = 'dol', User = 'root', Passwd = 'mubin1996'):
    DML_INSERT.DML_INSERT_SQL(SQL, DBname, User, Passwd)
    return ''


def DML_DELETE_Para(Require='1=1', TableName = 'dol_orderinformation_f', DBname = 'dol', User = 'root', Passwd = 'mubin1996'):
    DML_DELETE.DML_DELETE_Para(Require, TableName, DBname, User, Passwd)
    return ''
def DML_DELETE_SQL(SQL, DBname = 'dol', User = 'root', Passwd = 'mubin1996'):
    DML_DELETE.DML_DELETE_SQL(SQL, DBname, User, Passwd)
    return ''


def DML_SELECT_Para(Field, Require='1=1', TableName = 'dol_orderinformation_f', DBname = 'dol', User = 'root', Passwd = 'mubin1996'):
    Data = DML_SELECT.DML_SELECT_Para(Field, Require, TableName, DBname, User, Passwd)
    return Data
def DML_SELECT_SQL(SQL, DBname = 'dol', User = 'root', Passwd = 'mubin1996'):
    Data = DML_SELECT.DML_SELECT_SQL(SQL, DBname, User, Passwd)
    return Data


def DML_Update_Para(FieldValue, Require='1=1', TableName = 'dol_orderinformation_f', DBname = 'dol', User = 'root', Passwd = 'mubin1996'):
    DML_UPDATE.DML_Update_Para(FieldValue, Require, TableName, DBname, User, Passwd)
    return ''
def DML_Update_SQL(SQL, DBname = 'dol', User = 'root', Passwd = 'mubin1996'):
    DML_UPDATE.DML_Update_SQL(SQL, DBname, User, Passwd)
    return ''