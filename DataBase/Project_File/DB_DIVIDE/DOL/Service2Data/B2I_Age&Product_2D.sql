#--------------------------------------#
#服务名：B2I_Age&Product_S
#
#服务：年龄-产品关联
#数据库内存储年龄为出生日期
#需转化为年龄
#
#---------------------------------------#
SELECT
	* INTO OUTFILE 'C:/python/pythonws/Project/data/OUTPUT/B2I_Age&Product_33.csv' FIELDS TERMINATED BY "," lines terminated by '\n' 
FROM
	(
	SELECT
		'Age',
		'ProductName',
		'ProductName_Code',
		'OrderNum' UNION
	SELECT
		2019 - Birth AS Age,
		ProductName AS ProductName,
		ProductName_Code AS ProductName_Code,
		OrderNum AS OrderNum 
	FROM
		(
		SELECT
			Birth,
			ProductName,
			ProductName_Code,
			COUNT( 1 ) AS OrderNum 
		FROM
			dol_orderinformation_f Info 
		WHERE
			Info.ActiveStatus_Code = 1 
			AND Info.Province_Code = 33 
		GROUP BY
			Birth,
			ProductName,
			ProductName_Code 
		) F 
	) f 
-- 	ProductName_Code