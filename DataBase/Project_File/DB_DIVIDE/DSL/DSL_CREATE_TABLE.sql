CREATE TABLE DSL_OrderInformation_F(
		OrderNum 			bigint		COMMENT '订单号',
		Region 				char(20)	COMMENT '县分',
		OrderTime 		int				COMMENT '下单时间',
		ProductName 	char(100)	COMMENT '产品名称',
		OrderStatus 	char(20)	COMMENT '订单状态',
		Sex 					char(4)		COMMENT '性别',
		Age 					int				COMMENT '年龄',
		ActiveTime 		int				COMMENT '激活时间',
		ActiveStatus 	char(10)	COMMENT '激活状态',
		SixIDNumber 	int				COMMENT '身份证前六位',
		NDC 					int				COMMENT '用户号码前三位',
		DeliverTime 	int				COMMENT '发货时间',
		RecAddress 		char(150)	COMMENT '收货地址',
		Attr1 				char(100)	COMMENT '备用属性1',
		Attr2 				char(100)	COMMENT '备用属性2',
		Attr3 				char(100)	COMMENT '备用属性3',
		Attr4 				char(100)	COMMENT '备用属性4',
		Attr5 				char(100)	COMMENT '备用属性5',
		Attr6 				char(100)	COMMENT '备用属性6',
		Attr7 				char(100)	COMMENT '备用属性7',
		Attr8 				char(100)	COMMENT '备用属性8',
		Attr9 				char(100)	COMMENT '备用属性9',
		Attr10 				char(100)	COMMENT '备用属性10',
		Attr11 				char(100)	COMMENT '备用属性11',
		Attr12 				char(100)	COMMENT '备用属性12',
		Attr13 				char(100)	COMMENT '备用属性13',
		Attr14 				char(100)	COMMENT '备用属性14',
		Attr15 				char(100)	COMMENT '备用属性15'
);

CREATE TABLE DSL_OrderInformation_TMP AS SELECT * FROM DSL_OrderInformation_F LIMIT 0;

























































