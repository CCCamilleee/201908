#--------------------------------------#
#服务名：B2I_Product&Trans_S
#
#服务：各产品-最终用户转化情况关系
#用户转化情况：从有订单到订单激活
#
#---------------------------------------#
SELECT
	Total.ProductName AS ProductName,
	Total.ProductName_Code AS ProductName_Code,
	Total.OrderNum AS TotalNum,
	IFNULL( Active.OrderNum, 0 ) AS ActiveNum,
	ROUND( IFNULL( Active.OrderNum, 0 ) / Total.OrderNum, 2 ) AS TransRate,
	CONCAT( ROUND( IFNULL( Active.OrderNum, 0 ) / Total.OrderNum * 100, 2 ), '%' ) AS TransRate2 
FROM
	(
	SELECT
		Info.ProductName AS ProductName,
		Info.ProductName_Code AS ProductName_Code,
		COUNT( 1 ) AS OrderNum 
	FROM
		dol_orderinformation_f Info 
	WHERE
		Info.Province_Code = 33 
	GROUP BY
		ProductName,
		ProductName_Code 
	) Total
	LEFT JOIN (
	SELECT
		Info.ProductName AS ProductName,
		Info.ProductName_Code AS ProductName_Code,
		COUNT( 1 ) AS OrderNum 
	FROM
		dol_orderinformation_f Info 
	WHERE
		Info.ActiveStatus_Code = 1 
		AND Info.Province_Code = 33 
	GROUP BY
		ProductName,
		ProductName_Code 
	) Active ON Total.ProductName_Code = Active.ProductName_Code 
ORDER BY
	TransRate