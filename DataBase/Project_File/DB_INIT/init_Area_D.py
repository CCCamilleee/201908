import pandas as pd
import pymysql
from sqlalchemy import create_engine


def GetData(url):
    data = pd.read_excel(url, encoding='gbk')
    return data

def UploadData(Data, User, Passwd, DBname, TableName):
    commend = 'mysql+pymysql://' + User + ':' + Passwd + '@localhost:3306/' + DBname
    # commend = 'mysql+pymysql://root:mubin1996@localhost:3306/dsl'
    conn = create_engine(commend, encoding='utf8')
    pd.io.sql.to_sql(Data, TableName, conn, if_exists='replace')
    return ''

def Init_Area_D(url, User, Passwd, DBname, TableName):
    Data = GetData(url)
    UploadData(Data, User, Passwd, DBname, TableName)
    return ''
