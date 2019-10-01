CREATE DATABASE 'Bookstore';
USE Bookstore;

CREATE TABLE `book` (
  `book_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `author` varchar(45) NOT NULL,
  `price` float NOT NULL,
  PRIMARY KEY (`book_id`),
  UNIQUE KEY `book_id_UNIQUE` (`book_id`),
  UNIQUE KEY `title_UNIQUE` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1

insert into book values (1234 , 'effective java' , 'john' , 100);
insert into book values (14 , 'effective ' , 'jon' , 10);
insert into book values (12 , 'eff ' , 'jo' , 10);
