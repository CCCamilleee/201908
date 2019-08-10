#--------------------------------------#
#服务名：B2I_AgeGroup&Trans_S
#
#服务：年龄组-最终用户转化情况关系
#用户转化情况：从有订单到订单激活
#以年龄升序,10岁为1年龄段
#---------------------------------------#
SELECT
	* INTO OUTFILE 'C:/python/pythonws/Project/data/OUTPUT/B2I_AgeGroup&Trans_33.csv' FIELDS TERMINATED BY "," LINES TERMINATED BY '\n' 
FROM
	(
	SELECT
		'Age_Group',
		'TotalNum',
		'ActiveNum',
		'TransRate',
		'TransRate2' UNION
	SELECT
	CASE
			
		WHEN
			Age_Group = 1 THEN
				'0-10' 
				WHEN Age_Group = 2 THEN
				'11-20' 
				WHEN Age_Group = 3 THEN
				'21-30' 
				WHEN Age_Group = 4 THEN
				'31-40' 
				WHEN Age_Group = 5 THEN
				'41-50' 
				WHEN Age_Group = 6 THEN
				'51-60' 
				WHEN Age_Group = 7 THEN
				'61-70' 
				WHEN Age_Group = 8 THEN
				'71-80' 
				WHEN Age_Group = 9 THEN
				'81-90' ELSE '91-100' 
			END AS Age_Group,
			TotalNum AS TotalNum,
			ActiveNum AS ActiveNum,
			TransRate AS TransRate,
			TransRate2 AS TransRate2 
		FROM
			(
			SELECT
				Total.Age_Group AS Age_Group,
				Total.OrderNum AS TotalNum,
				IFNULL( Active.OrderNum, 0 ) AS ActiveNum,
				ROUND( IFNULL( Active.OrderNum, 0 ) / Total.OrderNum, 2 ) AS TransRate,
				CONCAT( ROUND( IFNULL( Active.OrderNum, 0 ) / Total.OrderNum * 100, 2 ), '%' ) AS TransRate2 
			FROM
				(
				SELECT
					FLOOR( ( Info.Age_Code - 2018000+1 ) / 2 ) AS Age_Group,
					COUNT( 1 ) AS OrderNum 
				FROM
					dol_orderinformation_f Info 
				WHERE
					Info.Province_Code = 33 
				GROUP BY
					Age_Group 
				) Total
				LEFT JOIN (
				SELECT
					FLOOR( ( Info.Age_Code - 2018000+1 ) / 2 ) AS Age_Group,
					COUNT( 1 ) AS OrderNum 
				FROM
					dol_orderinformation_f Info 
				WHERE
					Info.ActiveStatus_Code = 1 
					AND Info.Province_Code = 33 
				GROUP BY
					Age_Group 
				) Active ON Active.Age_Group = Total.Age_Group 
			) F 
	) F