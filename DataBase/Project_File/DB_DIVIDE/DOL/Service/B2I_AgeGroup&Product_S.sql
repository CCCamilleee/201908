#--------------------------------------#
#服务名：B2I_AgeGroup&Product_S
#
#服务：年龄段-产品关联
#总年龄为1-100，5岁为一段
#
#---------------------------------------#


SELECT
CASE
		
	WHEN
		F.Age_Code = 2018001 THEN
			'1-5' 
			WHEN F.Age_Code = 2018002 THEN
			'6-10' 
			WHEN F.Age_Code = 2018003 THEN
			'11-15' 
			WHEN F.Age_Code = 2018004 THEN
			'16-20' 
			WHEN F.Age_Code = 2018005 THEN
			'21-25' 
			WHEN F.Age_Code = 2018006 THEN
			'26-30' 
			WHEN F.Age_Code = 2018007 THEN
			'31-35' 
			WHEN F.Age_Code = 2018008 THEN
			'36-40' 
			WHEN F.Age_Code = 2018009 THEN
			'41-45' 
			WHEN F.Age_Code = 2018010 THEN
			'46-50' 
			WHEN F.Age_Code = 2018011 THEN
			'51-55' 
			WHEN F.Age_Code = 2018012 THEN
			'56-60' 
			WHEN F.Age_Code = 2018013 THEN
			'61-65' 
			WHEN F.Age_Code = 2018014 THEN
			'66-70' 
			WHEN F.Age_Code = 2018015 THEN
			'71-75' 
			WHEN F.Age_Code = 2018016 THEN
			'76-80' 
			WHEN F.Age_Code = 2018017 THEN
			'81-85' 
			WHEN F.Age_Code = 2018018 THEN
			'86-90' 
			WHEN F.Age_Code = 2018019 THEN
			'91-95' ELSE '96-100' 
		END AS Age_Group,
		ProductName AS ProductName,
		ProductName_Code AS ProductName_Code,
		OrderNum AS OrderNum 
	FROM
		( SELECT 
				Age_Code, 
				ProductName, 
				ProductName_Code, 
				COUNT( 1 ) AS OrderNum 
					FROM dol_orderinformation_f Info
					WHERE Info.ActiveStatus_Code = 1
						GROUP BY 	Age_Code, 
											ProductName, 
											ProductName_Code ) F 
	ORDER BY
	Age_Group,
	ProductName_Code