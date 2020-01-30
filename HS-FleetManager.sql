create database nmt_fleet_manager;

grant all privileges on *.* to 'nmt_fleet_manager'@'localhost' identified by 'Fleet2019S2';

use nmt_fleet_manager;

ALTER DATABASE nmt_fleet_manager CHARACTER SET utf8 COLLATE utf8_general_ci;

create table Vehicles(id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, make VARCHAR(64) NOT NULL DEFAULT "UNKNOWN", model VARCHAR(128) NOT NULL, release_year INTEGER(4) ZEROFILL NOT NULL DEFAULT 1, registration VARCHAR(16) NOT NULL, fuel VARCHAR(8) NOT NULL, tank_size DECIMAL UNSIGNED NULL, initials VARCHAR(4) NOT NULL DEFAULT "XXX", created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, updated_at TIMESTAMP NULL);

create table Journey(id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, vehicle_id BIGINT UNSIGNED NOT NULL DEFAULT 0, distance DECIMAL UNSIGNED NOT NULL DEFAULT 0.0, journey_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, updated_at TIMESTAMP NULL, FOREIGN KEY (vehicle_id) REFERENCES Vehicles(id));

create table Fuel_Purchases(id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, vehicle_id BIGINT(64) UNSIGNED NOT NULL DEFAULT 0, amount DECIMAL(65) UNSIGNED  NOT NULL DEFAULT 0, cost DECIMAL(4) ZEROFILL NOT NULL DEFAULT 0, created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, updated_at TIMESTAMP NULL, FOREIGN KEY (vehicle_id) REFERENCES Vehicles(id));

insert into Vehicles(make, model, release_year, registration, fuel, tank_size, initials) values('Ariel','Atom 4',2019,'1ARI444','Petrol',40,'DC'),('BMW','X5',2006,'1BGZ784','Petrol',93,'GG'),('Holden','Commodore Sportwagon RS-V',2019,'1DWU656','Petrol',80,'HS'),('Holden','Barina',2018,'NULL','NULL',0,'KF'),('Ford','RangerXL',2015,'1GVL526','Diesel',80,'DL'),('Tesla','Roadster',2008,'8HDZ576','Electric',0,'FM'),('Holden','Commodore LT ',2018,'1GXI000','Diesel',61,'MC'),('BMW','Z4',2019,'HMM B33R','Petrol',52,'LW'),('Hyundai','Sonata Premium',2018,'ICTPRG403','Gas',70,'CP'),('Chevrlet','Cadillac',1959,'C4D1LL4C','Petrol',79,'MF'),('Ford','Territory ',2014,'T3RR1TORY','Petrol',80,'MG'),('Mitsubishi','Pajero GLS',2019,'2MCR657','Diesel',90,'MC'),('Mitsubishi','Eclipse Cross ES (2WD)',2018,'1GGG292','Petrol',63,'DS'),('Hyundai','Santa Fe Highlander CRDi Satan Dark',2019,'ICTPRG418','Diesel',71,'CP'),('Bugatti','Veyron 16.4 Super Sport',2011,'1FST319','Petrol',100,'DS'),('Toyota','Yaris',2019,'YGT427','Petrol',42,'HV'),('Land Rover','Defender',2015,'BCZ581','Diesel',60,'DL'),('Ford','escape titanium',2019,'FR2917','Diesel',64,'mp'),('Lamborghini','Urus',2019,'URU2K19','Petrol',85,'AC');

create table Services(id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, vehicle_id BIGINT UNSIGNED NOT NULL DEFAULT 0, odometer DECIMAL(9,1) UNSIGNED NOT NULL DEFAULT 0.0, serviced_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, updated_at TIMESTAMP NULL);

insert into Services(id, vehicle_id, odometer, serviced_at, created_at) values (1,1,55,'2019-02-23','2019-02-26'),(2,3,15000,'2006-06-01','2006-06-04'),(3,4,30,'2019-01-01','2019-01-05'),(4,5,2500,'2018-05-01','2018-05-03'),(5,6,7500,'2015-06-05','2015-06-09'),(6,7,6000,'2008-05-01','2008-05-04'),(7,8,1000,'2018-07-31','2018-08-04'),(8,9,0,'1998-09-13','1998-09-18'),(9,10,50,'2019-03-27','2019-03-29'),(10,10,1250,'2018-09-06','2018-09-10'),(11,11,30000,'2017-11-05','2017-11-09'),(12,12,2500,'2016-05-10','2016-05-11'),(13,13,30,'2019-08-20','2019-08-24'),(14,14,400,'2018-03-29','2018-04-03'),(15,15,35,'2019-07-06','2019-07-09'),(16,16,1750,'2011-11-10','2011-11-14'),(17,17,210,'2019-09-27','2019-10-01'),(18,18,100,'2017-08-29','2017-09-03'),(19,18,55,'2019-07-25','2019-07-28'),(20,20,1600,'2015-10-28','2015-10-28'),(21,22,20,'2019-01-08','2019-01-08');

delete from services where vehicle_id = 20;

delete from services where vehicle_id = 21;

delete from services where vehicle_id = 20;

delete from services where vehicle_id = 22;

Update services set vehicle_id = 2 where odometer = 50.0;

Update services set vehicle_id = 19 where odometer = 55.0;

alter table Services add foreign key(vehicle_id) references Vehicles(id);