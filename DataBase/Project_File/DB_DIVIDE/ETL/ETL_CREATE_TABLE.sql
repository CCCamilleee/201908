CREATE TABLE ETL_OrderUser_D(
		Feature_Flag 	char(4) 	COMMENT '编码标识符',
		Sex 					char(4) 	COMMENT '性别',
		Sex_Code 			char(2) 	COMMENT '性别编码',
		Birth 				int 			COMMENT '出生年份',
		Age_Code 			int 			COMMENT '年龄段编码',
		Attr1 				char(100) COMMENT '备用属性1',
		Attr2 				char(100) COMMENT '备用属性2',
		Attr3 				char(100) COMMENT '备用属性3',
		Attr4 				char(100) COMMENT '备用属性4',
		Attr5 				char(100) COMMENT '备用属性5'
);


CREATE TABLE ETL_Product_D(
		Feature_Flag 			char(4) 	COMMENT '编码标识符',
		ProductName 			char(100)	COMMENT '产品名称',
		ProductName_Code 	int				COMMENT '产品名称编码',
		NDCName 					char(50)	COMMENT '运营商名称',
		NDCCode 					int				COMMENT '运营商编码',
		Attr1 						char(100) COMMENT '备用属性1',
		Attr2 						char(100) COMMENT '备用属性2',
		Attr3 						char(100) COMMENT '备用属性3',
		Attr4 						char(100) COMMENT '备用属性4',
		Attr5 						char(100) COMMENT '备用属性5'
);

CREATE TABLE ETL_OrderStatus_D(
		Feature_Flag 			char(4)		COMMENT '编码标识符',
		OrderStatus 			char(20)	COMMENT '订单状态',
		OrderStatus_Code 	char(20)	COMMENT '订单状态编码',
		ActiveStatus 			char(10)	COMMENT '激活状态',
		ActiveStatus_Code int				COMMENT '激活状态编码',
		Attr1 						char(100)	COMMENT '备用属性1',
		Attr2 						char(100)	COMMENT '备用属性2',
		Attr3 						char(100)	COMMENT '备用属性3',
		Attr4 						char(100)	COMMENT '备用属性4',
		Attr5 						char(100)	COMMENT '备用属性5'
);


CREATE TABLE ETL_Area_D(
		Feature_Flag 		char(20)	COMMENT '编码标识符',
		Province 				char(20)	COMMENT	'省份',
		Province_Code 	int				COMMENT	'省份编码',
		City 						char(20)	COMMENT	'市级',
		City_Code 			int				COMMENT	'市级编码',
		Region 					char(20)	COMMENT	'县分',
		Region_Code 		int				COMMENT	'县分编码',
		UserLocal				char(150) COMMENT '用户归属地',
		UserLocal_Code 	INT				COMMENT	'用户归属地编码',
		Attr1 					char(100)	COMMENT '备用属性1',
		Attr2 					char(100)	COMMENT '备用属性2',
		Attr3 					char(100)	COMMENT '备用属性3',
		Attr4 					char(100)	COMMENT '备用属性4',
		Attr5 					char(100)	COMMENT '备用属性5'
);


CREATE TABLE ETL_OrderInformation_F(
		OrderNum 					bigint		COMMENT '订单号',
		Province 					char(20)	COMMENT '省份',
		Province_Code			int				COMMENT '省份编码',
		City 							char(20)	COMMENT '市级',
		City_Code 				int				COMMENT '市级编码',
		Region 						char(20)	COMMENT '县分',
		Region_Code 			int				COMMENT '县分编码',
		OrderTime 				int				COMMENT '下单时间',
		OrderYear 				int				COMMENT '下单年份',
		OrderMonth 				int				COMMENT '下单月份',
		OrderDay 					int				COMMENT '下单日期',
		ProductName 			char(100)	COMMENT '产品名称',
		ProductName_Code 	int				COMMENT '产品名称编码',
		OrderStatus 			char(20)	COMMENT '订单状态',
		OrderStatus_Code 	char(20)	COMMENT '订单状态编码',
		Sex 							char(4)		COMMENT '性别',
		Sex_Code 					char(2)		COMMENT '性别编码',
		Birth 						int				COMMENT '出生年份',
		Age_Code 					int				COMMENT '年龄段编码',
		ActiveTime 				int				COMMENT '激活时间',
		ActiveStatus 			char(10)	COMMENT '激活状态',
		ActiveStatus_Code int				COMMENT '激活状态编码',
		SixIDNumber 			int				COMMENT '身份证前六位',
		NDC 							int				COMMENT '用户号码前三位',
		DeliverTime 			int				COMMENT '发货时间',
		RecAddress 				char(150)	COMMENT '收货地址',
		NDCName 					char(20)	COMMENT '运营商名称',
		NDCCode					 	int				COMMENT '运营商编码',
		UserLocal 				char(150)	COMMENT '用户归属地',
		UserLocal_Code 		int				COMMENT '用户归属地编码',
		Attr1 						char(100)	COMMENT '备用属性1',
		Attr2 						char(100)	COMMENT '备用属性2',
		Attr3 						char(100)	COMMENT '备用属性3',
		Attr4 						char(100)	COMMENT '备用属性4',
		Attr5 						char(100)	COMMENT '备用属性5',
		Attr6 						char(100)	COMMENT '备用属性6',
		Attr7 						char(100)	COMMENT '备用属性7',
		Attr8 						char(100)	COMMENT '备用属性8',
		Attr9 						char(100)	COMMENT '备用属性9',
		Attr10 						char(100)	COMMENT '备用属性10',
		Attr11 						char(100)	COMMENT '备用属性11',
		Attr12 						char(100)	COMMENT '备用属性12',
		Attr13 						char(100)	COMMENT '备用属性13',
		Attr14 						char(100)	COMMENT '备用属性14',
		Attr15 						char(100)	COMMENT '备用属性15'
);


CREATE TABLE ETL_OrderInformation_TMP AS SELECT * FROM ETL_OrderInformation_F LIMIT 0;











































