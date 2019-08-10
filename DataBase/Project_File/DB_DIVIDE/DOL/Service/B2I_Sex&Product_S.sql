#--------------------------------------#
#服务名：B2I_Sex&Product_S
#服务：性别-产品关联
#
#性别：M-男性，F-女性
#
#---------------------------------------#
SELECT
	Sex,
	Sex_Code,
	ProductName,
	ProductName_Code,
	COUNT( 1 ) AS OrderNum 
FROM
	dol_orderinformation_f Info 
WHERE
	Info.ActiveStatus_Code = 1 
	AND Info.Province_Code = 33 
GROUP BY
	Sex,
	Sex_Code,
	ProductName,
	ProductName_Code 
ORDER BY
	Sex_Code,
	ProductName_Code