/*
 Navicat Premium Data Transfer

 Source Server         : Jun_F
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : localhost:3306
 Source Schema         : etl

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 11/08/2019 19:27:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Procedure structure for B2I_AreaDivide_P
-- ----------------------------
DROP PROCEDURE IF EXISTS `B2I_AreaDivide_P`;
delimiter ;;
CREATE PROCEDURE `B2I_AreaDivide_P`()
BEGIN
	#Routine body goes here...
	DECLARE Time INT DEFAULT 20180501;
	
	WHILE Time<20180801 DO

	TRUNCATE TABLE etl_orderinformation_tmp;
	
	
	INSERT INTO etl_orderinformation_tmp
	(
		OrderNum,
		Province,
		Province_Code,
		City,
		City_Code,
		Region,
		Region_Code,
		OrderTime,
		OrderYear,
		OrderMonth,
		OrderDay,
		ProductName,
		ProductName_Code,
		OrderStatus,
		OrderStatus_Code,
		Sex,
		Sex_Code,
		Birth,
		Age_Code,
		ActiveTime,
		ActiveStatus,
		ActiveStatus_Code,
		SixIDNumber,
		NDC,
		DeliverTime,
		RecAddress,
		NDCName,
		NDCCode,
		UserLocal,
		UserLocal_Code,
		Attr1,
		Attr2,
		Attr3,
		Attr4,
		Attr5,
		Attr6,
		Attr7,
		Attr8,
		Attr9,
		Attr10,
		Attr11,
		Attr12,
		Attr13,
		Attr14,
		Attr15
	)
	SELECT 
	OrderNum,
		Province,
		Province_Code,
		City,
		City_Code,
		Region,
		Region_Code,
		OrderTime,
		OrderYear,
		OrderMonth,
		OrderDay,
		ProductName,
		ProductName_Code,
		OrderStatus,
		OrderStatus_Code,
		Sex,
		Sex_Code,
		Birth,
		Age_Code,
		ActiveTime,
		ActiveStatus,
		ActiveStatus_Code,
		SixIDNumber,
		NDC,
		DeliverTime,
		RecAddress,
		NDCName,
		NDCCode,
		UserLocal,
		UserLocal_Code,
		Attr1,
		Attr2,
		Attr3,
		Attr4,
		Attr5,
		Attr6,
		Attr7,
		Attr8,
		Attr9,
		Attr10,
		Attr11,
		Attr12,
		Attr13,
		Attr14,
		Attr15
		FROM etl_orderinformation_f Info
		WHERE Info.OrderTime = Time;
		
		UPDATE etl_orderinformation_tmp tmp SET tmp.Province = LEFT(tmp.RecAddress, 2);
		
		UPDATE etl_orderinformation_tmp tmp SET tmp.City = SUBSTRING(tmp.RecAddress, 3, 3);
		
		UPDATE etl_orderinformation_tmp tmp, etl_area_d Area SET tmp.Province_Code = Area.Province_Code
		WHERE tmp.Province = Area.Province AND Area.Feature_Flag = 'R1';
		
		UPDATE etl_orderinformation_tmp tmp, etl_area_d Area SET tmp.City_Code = Area.City_Code
		WHERE tmp.City = Area.City AND Area.Feature_Flag = 'R2';
		
		COMMIT;
		
		UPDATE etl_orderinformation_tmp tmp, etl_area_d Area SET tmp.Region_Code = Area.Region_Code
		WHERE tmp.Region = Area.Region AND 
					Area.Feature_Flag = 'R3' AND
					tmp.Province_Code = Area.Province_Code AND
					tmp.City_Code = Area.City_Code;
		
		COMMIT;
		
		
		
		DELETE FROM etl_orderinformation_f Info WHERE Info.OrderTime = Time;
		
		COMMIT;
		
		
		INSERT INTO etl_orderinformation_f
	(
		OrderNum,
		Province,
		Province_Code,
		City,
		City_Code,
		Region,
		Region_Code,
		OrderTime,
		OrderYear,
		OrderMonth,
		OrderDay,
		ProductName,
		ProductName_Code,
		OrderStatus,
		OrderStatus_Code,
		Sex,
		Sex_Code,
		Birth,
		Age_Code,
		ActiveTime,
		ActiveStatus,
		ActiveStatus_Code,
		SixIDNumber,
		NDC,
		DeliverTime,
		RecAddress,
		NDCName,
		NDCCode,
		UserLocal,
		UserLocal_Code,
		Attr1,
		Attr2,
		Attr3,
		Attr4,
		Attr5,
		Attr6,
		Attr7,
		Attr8,
		Attr9,
		Attr10,
		Attr11,
		Attr12,
		Attr13,
		Attr14,
		Attr15
	)
	SELECT 
	OrderNum,
		Province,
		Province_Code,
		City,
		City_Code,
		Region,
		Region_Code,
		OrderTime,
		OrderYear,
		OrderMonth,
		OrderDay,
		ProductName,
		ProductName_Code,
		OrderStatus,
		OrderStatus_Code,
		Sex,
		Sex_Code,
		Birth,
		Age_Code,
		ActiveTime,
		ActiveStatus,
		ActiveStatus_Code,
		SixIDNumber,
		NDC,
		DeliverTime,
		RecAddress,
		NDCName,
		NDCCode,
		UserLocal,
		UserLocal_Code,
		Attr1,
		Attr2,
		Attr3,
		Attr4,
		Attr5,
		Attr6,
		Attr7,
		Attr8,
		Attr9,
		Attr10,
		Attr11,
		Attr12,
		Attr13,
		Attr14,
		Attr15
		FROM etl_orderinformation_tmp;
		
		
	COMMIT;
	
	
	SET Time = Time + 1;
	
		IF Time = 20180532 THEN
		SET Time = 20180601;
		END IF;
	
		IF Time = 20180631 THEN
		SET Time = 20180701;
		END IF;
	
		IF Time = 20180732 THEN
		SET Time = 20180801;
		END IF;



END WHILE;
	

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for B2I_OrderInfo_P
-- ----------------------------
DROP PROCEDURE IF EXISTS `B2I_OrderInfo_P`;
delimiter ;;
CREATE PROCEDURE `B2I_OrderInfo_P`()
BEGIN
	#Routine body goes here...
	
	DECLARE Time INT DEFAULT 20180501;
	
	WHILE Time<20180801 DO
	
	TRUNCATE TABLE etl_orderinformation_tmp;
	
	INSERT INTO etl_orderinformation_tmp
	(			
		OrderNum,
		Province,
		Province_Code,
		City,
		City_Code,
		Region,
		Region_Code,
		OrderTime,
		OrderYear,
		OrderMonth,
		OrderDay,
		ProductName,
		ProductName_Code,
		OrderStatus,
		OrderStatus_Code,
		Sex,
		Sex_Code,
		Birth,
		Age_Code,
		ActiveTime,
		ActiveStatus,
		ActiveStatus_Code,
		SixIDNumber,
		NDC,
		DeliverTime,
		RecAddress,
		NDCName,
		NDCCode,
		UserLocal,
		UserLocal_Code,
		Attr1,
		Attr2,
		Attr3,
		Attr4,
		Attr5,
		Attr6,
		Attr7,
		Attr8,
		Attr9,
		Attr10,
		Attr11,
		Attr12,
		Attr13,
		Attr14,
		Attr15
	)
	SELECT 
		Info.OrderNum,
		null as Province,
		null as Province_Code,
		null as City,
		null as City_Code,
		Info.Region,
		null as Region_Code,
		Info.OrderTime,
		Info.OrderTime/10000 as OrderYear,
		MOD(OrderTime,10000)/100 as OrderMonth,
		MOD(OrderTime,100) as OrderDay,
		Info.ProductName,
		Prod.ProductName_Code as ProductName_Code,
		Info.OrderStatus,
		Stat.OrderStatus_Code as OrderStatus_Code,
		Info.Sex,
		Usr.Sex_Code as Sex_Code,
	  2019 - Info.Age as Birth,
		Usr2.Age_Code as Age_Code,
		Info.ActiveTime,
		Info.ActiveStatus,
		Stat2.ActiveStatus_Code as ActiveStatus_Code,
		Info.SixIDNumber,
		Info.NDC,
		Info.DeliverTime,
		Info.RecAddress,
		Prod2.NDCName as NDCName,
		Prod2.NDCCode as NDCCode,
		Area.UserLocal as UserLocal,
		Info.SixIDNumber as UserLocal_Code,
		null as Attr1,
		null as Attr2,
		null as Attr3,
		null as Attr4,
		null as Attr5,
		null as Attr6,
		null as Attr7,
		null as Attr8,
		null as Attr9,
		null as Attr10,
		null as Attr11,
		null as Attr12,
		null as Attr13,
		null as Attr14,
		null as Attr15
	FROM 	dsl.dsl_orderinformation_f 	Info
				LEFT JOIN etl_orderstatus_d Stat ON 
					Stat.OrderStatus = Info.OrderStatus AND 
					Stat.Feature_Flag = 'S'
				LEFT JOIN etl_orderstatus_d	Stat2 ON 
					Stat2.ActiveStatus = Info.ActiveStatus AND 
					Stat2.Feature_Flag = 'A'
				LEFT JOIN etl_product_d Prod ON 
					Prod.ProductName = Info.ProductName AND 
					Prod.Feature_Flag = 'P'
				LEFT JOIN etl.etl_product_d	Prod2 ON 
					Prod2.NDC = Info.NDC AND 
					Prod2.Feature_Flag = 'S'
				LEFT JOIN etl.etl_orderuser_d	Usr ON 
					Usr.Sex = Info.Sex AND 
					Usr.Feature_Flag = 'S'
				LEFT JOIN etl.etl_orderuser_d	Usr2 ON 
					Usr2.Birth = Info.Age AND 
					Usr2.Feature_Flag = 'A'
				LEFT JOIN etl.etl_area_d Area ON 
					Area.UserLocal_Code = Info.SixIDNumber AND 
					Area.Feature_Flag = 'R4'
		WHERE Info.OrderTime = Time;
				
		INSERT INTO etl_orderinformation_error_tmp
			SELECT * FROM etl_orderinformation_tmp tmp 
				WHERE tmp.Birth > 2019 OR 
							tmp.Birth < 1919 OR 
							tmp.Region REGEXP '[0-9]' > 0 OR
							tmp.Region REGEXP '\\?' > 0;
		
		COMMIT;
		
		#删除年龄异常值
 		DELETE FROM etl_orderinformation_tmp tmp WHERE tmp.Birth > 2019 OR tmp.Birth < 1919;
		
		#删除县分异常值
	  DELETE FROM etl_orderinformation_tmp tmp WHERE tmp.Region REGEXP '[0-9]';
		
		#删除县分带？的
		DELETE FROM etl_orderinformation_tmp tmp WHERE tmp.Region REGEXP '\\?';
		
		#删除信息表内相同时间记录
		DELETE FROM etl_orderinformation_f WHERE OrderTime = Time;
		
		
		
		INSERT INTO etl_orderinformation_f
		(
		  OrderNum,
			Province,
			Province_Code,
			City,
			City_Code,
			Region,
			Region_Code,
			OrderTime,
			OrderYear,
			OrderMonth,
			OrderDay,
			ProductName,
			ProductName_Code,
			OrderStatus,
			OrderStatus_Code,
			Sex,
			Sex_Code,
			Birth,
			Age_Code,
			ActiveTime,
			ActiveStatus,
			ActiveStatus_Code,
			SixIDNumber,
			NDC,
			DeliverTime,
			RecAddress,
			NDCName,
			NDCCode,
			UserLocal,
			UserLocal_Code,
			Attr1,
			Attr2,
			Attr3,
			Attr4,
			Attr5,
			Attr6,
			Attr7,
			Attr8,
			Attr9,
			Attr10,
			Attr11,
			Attr12,
			Attr13,
			Attr14,
			Attr15
		)
		SELECT 
			OrderNum,
			Province,
			Province_Code,
			City,
			City_Code,
			Region,
			Region_Code,
			OrderTime,
			OrderYear,
			OrderMonth,
			OrderDay,
			ProductName,
			ProductName_Code,
			OrderStatus,
			OrderStatus_Code,
			Sex,
			Sex_Code,
			Birth,
			Age_Code,
			ActiveTime,
			ActiveStatus,
			ActiveStatus_Code,
			SixIDNumber,
			NDC,
			DeliverTime,
			RecAddress,
			NDCName,
			NDCCode,
			UserLocal,
			UserLocal_Code,
			Attr1,
			Attr2,
			Attr3,
			Attr4,
			Attr5,
			Attr6,
			Attr7,
			Attr8,
			Attr9,
			Attr10,
			Attr11,
			Attr12,
			Attr13,
			Attr14,
			Attr15
			FROM etl_orderinformation_tmp;
		SET Time = Time + 1;
	
		IF Time = 20180532 THEN
		SET Time = 20180601;
		END IF;
	
		IF Time = 20180631 THEN
		SET Time = 20180701;
		END IF;
	
		IF Time = 20180732 THEN
		SET Time = 20180801;
		END IF;



END WHILE;


		

END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
