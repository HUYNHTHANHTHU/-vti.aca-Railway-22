INSERT INTO departments(department_name)
VALUES 
("soluta"),
("libero"),
("sed"),
("reiciendis"),
("unde"),
("a"),
("asperiores"),
("at"),
("tenetur"),
("assumenda");

INSERT INTO positions(position_name)
VALUES 
("Dev"),
("Test"),
("Srum Master"),
("PM");

INSERT INTO accounts(email,				username,			fullname,			gender,		department_id,		position_id,			create_date)
VALUES 
					("abc@gmail.com", 	"banhlonk", 		"huynhthanh", 		"", 			"1", 				"1", 				"20211010"),
					("def@gmail.com", 	"nguyenvana", 		"lanhuynthanh", 	"",			"2",				"3",				"20210102");
                    
INSERT INTO `groups`(group_name,			creator_id,			create_date)
VALUES 
					("nhoma", 				"1", 				"20210203"),
					("nhomab", 				"2", 				"20210306");
                    
INSERT INTO group_accounts(group_id, 		account_id, 		join_date)
VALUES 
						("1", 				"1",				"20210408"),
                        ("2", 				"4",				"20210905");
