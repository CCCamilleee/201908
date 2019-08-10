#--------------------------------------#
#服务名：B2I_Age&Trans_S
#
#服务：年龄-最终用户转化情况关系
#用户转化情况：从有订单到订单激活
#以年龄升序
#---------------------------------------#
SELECT
	Total.Birth AS Birth,
	Total.Age AS Age,
	Total.OrderNum AS TotalNum,
	IFNULL( Active.OrderNum, 0 ) AS ActiveNum,
	ROUND( IFNULL( Active.OrderNum, 0 ) / Total.OrderNum, 2 ) AS TransRate,
	CONCAT( ROUND( IFNULL( Active.OrderNum, 0 ) / Total.OrderNum * 100, 2 ), '%' ) AS TransRate2 
FROM
	(
	SELECT
		Info.Birth AS Birth,
		2019 - Info.Birth AS Age,
		COUNT( 1 ) AS OrderNum 
	FROM
		dol_orderinformation_f Info 
	WHERE
		Info.Province_Code = 33 
	GROUP BY
		Birth,
		Age 
	ORDER BY
		Age 
	) Total
	LEFT JOIN (
	SELECT
		Info.Birth AS Birth,
		2019 - Info.Birth AS Age,
		COUNT( 1 ) AS OrderNum 
	FROM
		dol_orderinformation_f Info 
	WHERE
		Info.ActiveStatus_Code = 1 
		AND Info.Province_Code = 33 
	GROUP BY
		Birth,
		Age 
	ORDER BY
		Age 
	) Active ON Total.Birth = Active.Birth 
ORDER BY
	Age