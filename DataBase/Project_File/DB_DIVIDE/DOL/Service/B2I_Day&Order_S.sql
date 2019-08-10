#--------------------------------------#
#服务名：B2I_Day&Order_S
#
#服务：按会计期(日）统计订单数目
#
#
#---------------------------------------#
SELECT
	F.OrderTime AS Time,
	F.Month AS Month,
	F.Day AS Day,
	COUNT( 1 ) AS OrderNum 
FROM
	(
	SELECT
		Info.OrderYear * 100 + Info.OrderMonth AS OrderTime,
		Info.OrderMonth AS Month,
		Info.OrderDay AS Day
	FROM
		dol_orderinformation_f Info 
	WHERE
		Info.Province_Code = 33 
		AND Info.ActiveStatus_Code = 1 
	) F 
GROUP BY
	Time,
	Month,
	Day