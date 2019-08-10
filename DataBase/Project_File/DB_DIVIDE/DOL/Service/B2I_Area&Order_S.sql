#--------------------------------------#
#服务名：B2I_Area&Order_S
#
#服务：地域-订单数量关联
#切分到县级粒度
#
#---------------------------------------#
SELECT
	Province,
	Province_Code,
	City,
	City_Code,
	Region,
	Region_Code,
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
	Region_Code 
ORDER BY
	City_Code,
	Region_Code