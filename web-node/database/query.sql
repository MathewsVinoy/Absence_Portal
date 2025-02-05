CREATE TABLE outpasstb (id INT AUTO_INCREMENT PRIMARY KEY,indata DATE,name VARCHAR(20),admno INT,class VARCHAR(5),dept VARCHAR(10),reason VARCHAR(100),state VARCHAR(20) DEFAULT 'pending..',outstatus VARCHAR(20) DEFAULT 'pending..',outtime DATE);

CREATE TABLE student(id INT AUTO_INCREMENT PRIMARY KEY,username VARCHAR(10), passward VARCHAR(10));

INSERT INTO `outpass1`.`student` (`id`, `username`, `passward`) VALUES ('2', '5876', '5876');
INSERT INTO `outpass1`.`student` (`id`, `username`, `passward`) VALUES ('1', '5747', '5747');