INSERT INTO customer        (`name`,   phone,        email,                             address, 		note)
VALUES
						
						('nguyen van a',  '07045496000', 'haidang2productions@gmail.com',	 	'district1', 	'nhanhangngay' ),
						('nguyen van b',  '04045426000', 'haidg2productions@gmail.com', 		'district4', 	'khongan' ),
						('guyen van c',   '07045491200', 'haihgyfdsgions@gmail.com', 			'district7', 	'nhaiki' ),
						('nguyen van d',  '07455496000', 'hahduons@gmail.com', 				'district6', 	'khongan' ),
						('nguyen van e',  '07045491200', 'hanbdfihwfs@gmail.com', 				'district2', 	'mauon' );
                        
                         
INSERT INTO car			(maker, 			model, 			`year`, 		color, 			note)
VALUES
						
						("HONDA", 				'a2021', 		"20211010",			'den', 				'nhanhgangngay' ),
						("TOYOTA", 				'b1987', 		"20181212",			'xam', 				'khongan'),
						("NISSAN",				 'q1982', 		"20170102",			'nau',				 'nhanhnahu'),
						("NISSAN", 				'a1987', 		"20160405",			'do', 				'meoga'),
						("NISSAN", 				'c1985', 		"20120203",			'lam', 				'heo');                       
                        
INSERT INTO `order`(customer_id,		 	car_id, 	amount, 	saleprice, 	orderdate, 			deliverydate, 		deliveryaddress,  	`status`, 	note)
VALUES
					(1,				 01, 			1, 			50, 	'20211028', 		'20201210', 		'district6',  			"1", 'khongnhan'),
					(2,				 05, 			3, 			10, 	'20211021', 		'20201112', 		'district1',  			"0", 'khnhan'),
					(1,				 04, 			4, 			20, 	'20210220', 		'20200312', 		'district2',  			"2", 'lanhmangan'),
					(3,				 02, 			2, 			30, 	'20211028', 		'20201212', 		'district4',  			"1", 'onha'),
					(2,			 	03, 			1, 			40, 	'20211220', 		'20200302', 		'district1',  			"1", 'dian');
				
						


