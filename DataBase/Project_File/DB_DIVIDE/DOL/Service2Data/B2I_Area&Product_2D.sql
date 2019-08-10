#--------------------------------------#
#服务名：B2I_Area&Product_S
#
#服务：地域-产品关联
#切分到县级粒度
#
#---------------------------------------#
SELECT
	* INTO OUTFILE 'C:/python/pythonws/Project/data/OUTPUT/B2I_Area&Product_33.csv' FIELDS TERMINATED BY "," LINES TERMINATED BY '\n' 
FROM
	(
	SELECT
		'Province',
		'Province_Code',
		'City',
		'City_Code',
		'Region',
		'Region_Code',
		'ProductName',
		'ProductName_Code',
		'OrderNum' UNION
	SELECT
		Province,
		Province_Code,
		City,
		City_Code,
		Region,
		Region_Code,
		ProductName,
		ProductName_Code,
		COUNT( 1 ) AS OrderNum 
	FROM
		dol_orderinformation_f Info 
	WHERE
		Info.Province_Code = 33 
		AND Info.ActiveStatus_Code = 1 
	GROUP BY
		Province,
		Province_Code,
		City,
		City_Code,
		Region,
		Region_Code,
		ProductName,
	ProductName_Code 
	) F