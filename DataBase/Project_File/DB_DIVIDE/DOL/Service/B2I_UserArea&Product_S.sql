#--------------------------------------#
#服务名：B2I_UserArea&Product_S
#服务：用户地域特征-产品关联学习
#
#---------------------------------------#


#切分到省市
SELECT
	ProductName_Code,
	Sex_Code,
	Birth,
	Age_Code,
	UserLocal_Code,
	Province_Code,
	City_Code 
FROM
	dol_orderinformation_f f 
WHERE
	f.Province_Code = 33 INTO OUTFILE 'C:/python/pythonws/Project/data/OUTPUT/B2I_Area&Product_33.csv' FIELDS TERMINATED BY ",";
	
	
#切分到县
SELECT
	ProductName_Code,
	Sex_Code,
	Birth,
	Age_Code,
	UserLocal_Code,
	Province_Code,
	City_Code,
	Region_Code 
FROM
	dol_orderinformation_f f 
WHERE
	f.Province_Code = 33 INTO OUTFILE 'C:/python/pythonws/Project/data/OUTPUT/B2I_Area&Product_Region.csv' FIELDS TERMINATED BY ",";