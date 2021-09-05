alter table `users`  
	change column created_at  creatred_at DATETIME default current_timestamp, 
	change column updated_at  updated_at DATETIME default current_timestamp on update current_timestamp;