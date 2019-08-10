#--------------------------------------#
#服务名：B2I_Sex&Trans_S
#
#服务：性别-最终用户转化情况关系
#用户转化情况：从有订单到订单激活
#
#---------------------------------------#
SELECT
	Total.Sex AS Sex,
	Total.Sex_Code AS Sex_Code,
	Total.OrderNum AS TotalNum,
	IFNULL( Active.OrderNum, 0 ) AS ActiveNum,
	ROUND( IFNULL( Active.OrderNum, 0 ) / Total.OrderNum, 2 ) AS TransRate,
	CONCAT( ROUND( IFNULL( Active.OrderNum, 0 ) / Total.OrderNum * 100, 2 ), '%' ) AS TransRate2 
FROM
	(
	SELECT
		Info.Sex AS Sex,
		Info.Sex_Code AS Sex_Code,
		COUNT( 1 ) AS OrderNum 
	FROM
		dol_orderinformation_f Info 
	WHERE
		Info.Province_Code = 33 
	GROUP BY
		Sex,
		Sex_Code 
	) Total
	LEFT JOIN (
	SELECT
		Info.Sex AS Sex,
		Info.Sex_Code AS Sex_Code,
		COUNT( 1 ) AS OrderNum 
	FROM
		dol_orderinformation_f Info 
	WHERE
		Info.Province_Code = 33 
		AND Info.ActiveStatus_Code = 1 
	GROUP BY
		Sex,
	Sex_Code 
	) Active ON Total.Sex_Code = Active.Sex_Code