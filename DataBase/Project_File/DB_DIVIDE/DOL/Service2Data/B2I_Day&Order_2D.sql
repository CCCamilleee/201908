#--------------------------------------#
#服务名：B2I_Day&Order_S
#
#服务：按会计期(日）统计订单数目
#
#
#---------------------------------------#
SELECT
	* INTO OUTFILE 'C:/python/pythonws/Project/data/OUTPUT/B2I_Day&Order_33.csv' FIELDS TERMINATED BY "," LINES TERMINATED BY '\n' 
FROM
	(
	SELECT
		'Time',
		'Month',
		'Day',
		'OrderNum' UNION
	SELECT
		F.OrderTime AS Time,
		F.MONTH AS MONTH,
		F.DAY AS DAY,
		COUNT( 1 ) AS OrderNum 
	FROM
		(
		SELECT
			Info.OrderYear * 100 + Info.OrderMonth AS OrderTime,
			Info.OrderMonth AS MONTH,
			Info.OrderDay AS DAY 
		FROM
			dol_orderinformation_f Info 
		WHERE
			Info.Province_Code = 33 
			AND Info.ActiveStatus_Code = 1 
		) F 
	GROUP BY
		Time,
		MONTH,
DAY 
	) F