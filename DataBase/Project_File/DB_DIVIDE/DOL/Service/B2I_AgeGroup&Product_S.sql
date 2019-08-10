#--------------------------------------#
#服务名：B2I_AgeGroup&Product_S
#
#服务：年龄段-产品关联
#总年龄为1-100，10岁为一段
#
#---------------------------------------#
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
		ProductName AS ProductName,
		ProductName_Code AS ProductName_Code,
		OrderNum AS OrderNum 
	FROM
		(
		SELECT
			FLOOR( ( Info.Age_Code - 2018000+1 ) / 2 ) AS Age_Group,
			ProductName,
			ProductName_Code,
			COUNT( 1 ) AS OrderNum 
		FROM
			dol_orderinformation_f Info 
		WHERE
			Info.ActiveStatus_Code = 1 
			AND Info.Province_Code = 33 
		GROUP BY
			Age_Group,
			ProductName,
			ProductName_Code 
		) F 
ORDER BY
	Age_Group