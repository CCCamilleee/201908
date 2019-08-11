/*
 Navicat Premium Data Transfer

 Source Server         : Jun_F
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : localhost:3306
 Source Schema         : dol

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 11/08/2019 19:30:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Procedure structure for Data_Extract
-- ----------------------------
DROP PROCEDURE IF EXISTS `Data_Extract`;
delimiter ;;
CREATE PROCEDURE `Data_Extract`()
BEGIN#Routine body goes here...
	DECLARE
		Time INT DEFAULT 20180501;
	
	WHILE
			Time < 20180801 DO
			TRUNCATE TABLE dol_orderinformation_tmp;
		INSERT INTO dol_orderinformation_tmp (
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
		) SELECT
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
		FROM
			etl.etl_orderinformation_f f
		WHERE
			f.OrderTime = Time;
			
		DELETE FROM dol_orderinformation_f WHERE OrderTime = Time;
			
		INSERT INTO dol_orderinformation_f (
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
		) SELECT
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
		FROM
			dol_orderinformation_tmp;
		
		SET Time = Time + 1;
		IF
			Time = 20180532 THEN
				
				SET Time = 20180601;
			
		END IF;
		IF
			Time = 20180631 THEN
				
				SET Time = 20180701;
			
		END IF;
		IF
			Time = 20180732 THEN
				
				SET Time = 20180801;
			
		END IF;
		
	END WHILE;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
