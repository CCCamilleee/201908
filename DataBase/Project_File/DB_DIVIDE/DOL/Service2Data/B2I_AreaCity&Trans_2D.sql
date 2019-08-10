#--------------------------------------#
#服务名：B2I_AreaCity&Trans_S
#
#服务：地域-最终用户转化情况关系
#用户转化情况：从有订单到订单激活
#切分到县分
#---------------------------------------#
SELECT
	* INTO OUTFILE 'C:/python/pythonws/Project/data/OUTPUT/B2I_AreaCity&Trans_33.csv' FIELDS TERMINATED BY "," LINES TERMINATED BY '\n' 
FROM
	(
	SELECT
		'Province',
		'Province_Code',
		'City',
		'City_Code',
		'TotalNum',
		'ActiveNum',
		'TransRate',
		'TransRate2' UNION
	SELECT
		Total.Province,
		Total.Province_Code,
		Total.City,
		Total.City_Code,
		Total.OrderNum AS TotalNum,
		IFNULL( Active.OrderNum, 0 ) AS ActiveNum,
		ROUND( IFNULL( Active.OrderNum, 0 ) / Total.OrderNum, 2 ) AS TransRate,
		CONCAT( ROUND( IFNULL( Active.OrderNum, 0 ) / Total.OrderNum * 100, 2 ), '%' ) AS TransRate2 
	FROM
		(
		SELECT
			Province AS Province,
			Province_Code AS Province_Code,
			City AS City,
			City_Code AS City_Code,
			COUNT( 1 ) AS OrderNum 
		FROM
			dol_orderinformation_f Info 
		WHERE
			Info.Province_Code = 33 
		GROUP BY
			Province,
			Province_Code,
			City,
			City_Code 
		) Total
		LEFT JOIN (
		SELECT
			Province AS Province,
			Province_Code AS Province_Code,
			City AS City,
			City_Code AS City_Code,
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
			City_Code 
		) Active ON Total.City_Code = Active.City_Code 
	) F