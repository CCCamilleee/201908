#--------------------------------------#
#服务名：B2I_User&Product_S
#服务：用户特征-产品关联学习
#分性别
#性别：M-男性，F-女性
#
#---------------------------------------#
#用户特征-产品关系关联学习 --男性
SELECT
	ProductName_Code,
	Sex_Code,
	Birth,
	Age_Code,
	UserLocal_Code 
FROM
	dol_orderinformation_f Info 
WHERE
	Info.Sex_Code = 'M' 
	AND Info.ActiveStatus_Code = 1 INTO OUTFILE 'C:/python/pythonws/Project/data/OUTPUT/B2I_User&Product_Male.csv' FIELDS TERMINATED BY ",";
	

#用户特征-产品关系关联学习 --女性
SELECT
	ProductName_Code,
	Sex_Code,
	Birth,
	Age_Code,
	UserLocal_Code 
FROM
	dol_orderinformation_f Info 
WHERE
	Info.Sex_Code = 'F' AND 
	Info.ActiveStatus_Code = 1 INTO OUTFILE 'C:/python/pythonws/Project/data/OUTPUT/B2I_User&Product_Female.csv' FIELDS TERMINATED BY ","