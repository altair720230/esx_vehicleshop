USE `essentialmode`;

INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_cardealer','Concessionnaire',1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_cardealer','Concesionnaire',1)
;

INSERT INTO `jobs` (name, label) VALUES
	('cardealer','Concessionnaire')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('cardealer',0,'recruit','Recrue',10,'{}','{}'),
	('cardealer',1,'novice','Novice',25,'{}','{}'),
	('cardealer',2,'experienced','Experimente',40,'{}','{}'),
	('cardealer',3,'boss','Patron',0,'{}','{}')
;

CREATE TABLE `cardealer_vehicles` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`vehicle` varchar(255) NOT NULL,
	`price` int(11) NOT NULL,

	PRIMARY KEY (`id`)
);

CREATE TABLE `vehicle_sold` (
	`client` VARCHAR(50) NOT NULL,
	`model` VARCHAR(50) NOT NULL,
	`plate` VARCHAR(50) NOT NULL,
	`soldby` VARCHAR(50) NOT NULL,
	`date` VARCHAR(50) NOT NULL,

	PRIMARY KEY (`plate`)
);

CREATE TABLE `owned_vehicles` (
	`owner` varchar(22) NOT NULL,
	`plate` varchar(12) NOT NULL,
	`vehicle` longtext,
	`type` VARCHAR(20) NOT NULL DEFAULT 'car',
	`job` VARCHAR(20) NULL DEFAULT NULL,
	`stored` TINYINT(1) NOT NULL DEFAULT '0',

	PRIMARY KEY (`plate`)
);

CREATE TABLE `rented_vehicles` (
	`vehicle` varchar(60) NOT NULL,
	`plate` varchar(12) NOT NULL,
	`player_name` varchar(255) NOT NULL,
	`base_price` int(11) NOT NULL,
	`rent_price` int(11) NOT NULL,
	`owner` varchar(22) NOT NULL,

	PRIMARY KEY (`plate`)
);

CREATE TABLE `vehicle_categories` (
	`name` varchar(60) NOT NULL,
	`label` varchar(60) NOT NULL,

	PRIMARY KEY (`name`)
);

INSERT INTO `vehicle_categories` (name, label) VALUES
	('compacts','Compacts'),
	('coupes','Coupés'),
	('sedans','Sedans'),
	('sports','Sports'),
	('sportsclassics','Sports Classics'),
	('super','Super'),
	('muscle','Muscle'),
	('offroad','Off Road'),
	('suvs','SUVs'),
	('vans','Vans'),
	('motorcycles','Motos')
;

CREATE TABLE `vehicles` (
	`name` varchar(60) NOT NULL,
	`model` varchar(60) NOT NULL,
	`price` int(11) NOT NULL,
	`category` varchar(60) DEFAULT NULL,

	PRIMARY KEY (`model`)
);

INSERT INTO `vehicles` (name, model, price, category) VALUES
	('Buccaneer Rider','buccaneer2',60000,'muscle'),
	('Dominator','dominator3',155000,'muscle'),
	('Chino Luxe','chino2',19000,'muscle'),
	('Dukes','dukes',50000,'muscle'),
    ('Ellie','ellie',70000,'muscle'),
	('Faction Rider','faction2',80000,'muscle'),
    ('Impaler','impaler',50000,'muscle'),
	('Moonbeam','moonbeam2',65000,'muscle'),
	('SabreGt2','sabregt2',70000,'muscle'),
	('Slam Van','slamvan3',47000,'muscle'),
	('Sabre Turbo','sabregt',20000,'muscle'),
	('Vamos','vamos',90000,'muscle'),
    ('Tampa','tampa',80000,'muscle'),
	('Yosemite','yosemite',100000,'muscle'),
	('Blista','blista',33000,'compacts'),
	('Brioso R/A','brioso',42000,'compacts'),
	('Issi','issi2',40000,'compacts'),
	('Issic','issi3',37000,'compacts'),
	('Panto','panto',52000,'compacts'),
	('Prairie','prairie',41000,'compacts'),
	('Rhapsody','rhapsody',47000,'compacts'),
	('Bison','bison',90000,'vans'),
	('Bobcat XL','bobcatxl',70000,'vans'),
	('Burrito','burrito3',70000,'vans'),
    ('Journey','journey',27000,'vans'),
	('Rumpo','rumpo3',110000,'vans'),
	('Surfer','surfer',50000,'vans'),
	('Youga','youga2',85000,'vans'),
	('Asea','asea',15000,'sedans'),
	('Cognoscenti','cog55',80000,'sedans'),
	('Fugitive','fugitive',50000,'sedans'),
	('Intruder','intruder',32000,'sedans'),
	('Premier','premier',20000,'sedans'),
	('Primo Custom','primo2',90000,'sedans'),
	('Regina','regina',12000,'sedans'),
	('Stainer','stainer',29000,'sedans'),
	('Tailgater','tailgater',69000,'sedans'),
	('Washington','washington',25000,'sedans'),
	('Bodhi','bodhi2',40000,'suvs'),
	('Kalahari','kalahari',29000,'suvs'),
	('Kamacho','kamacho',120000,'suvs'),
	('Dubsta Luxuary','dubsta2',60000,'suvs'),
	('Mesa Trail','mesa3',90000,'suvs'),
	('Rancherxl','rancherxl',49000,'suvs'),
	('Rebel','rebel2',42000,'suvs'),
	('SandKing','sandking',80000,'suvs'),
	('Chevurek','chevurek',25000,'sportsclassics'),
	('Cheetah','cheetah2',200000,'sportsclassics'),
	('Jester','jester3',160000,'sportsclassics'),
	('Torero','torero',180000,'sportsclassics'),
	('Retinue','retinue',40000,'sportsclassics'),
	('Z-Type','ztype',210000,'sportsclassics'),
	('Toros','toros',215000,'offroad'),
	('Baller','Baller3',110000,'offroad'),
	('Cavalcade','cavalcade2',120000,'offroad'),
	('Contender','contender',140000,'offroad'),
    ('Bubsta 6x6','dubsta2',200000,'offroad'),
	('Granger','granger',100000,'offroad'),
	('Mesa','mesa',86000,'offroad'),
	('Huntley','huntley',93000,'offroad'),
	('Patriot','patriot',100000,'offroad'),
	('Rocoto','rocoto',90000,'offroad'),
    ('Cognoscenti Cabrio','cogcabrio',90000,'coupes'),
	('F620','f620',110000,'coupes'),
	('Oracle XS','oraclexs',80000,'coupes'),
	('Zion Cabrio','zion2',79000,'coupes'),
	('BesiaGts','bestiagts',120000,'sports'),
	('Buffalo S','buffalo2',100000,'sports'),
	('Carbonizzare','carbonizzare',115000,'sports'),
	('Comet','comet2',180000,'sports'),
	('Coquette','coquette',140000,'sports'),
	('Elegy','elegy',120000,'sports'),
	('Schafter','schafter3',80000,'sports'),
	('Flash GT','flashgt',90000,'sports'),
	('Massacro','massacro',110000,'sports'),
	('Jester','jester',150000,'sports'),
    ('Kuruma','kuruma',105000,'sports'),
	('Pariah','pariah',200000,'sports'),
	('Lynx','lynx',40000,'sports'),
	('Centinel','centinel3',113000,'sports'),
	('Adder','adder',1000000,'super'),
	('Banshee 900R','banshee2',500000,'super'),
	('Entity XF','entityxf',700000,'super'),
	('Osiris','osiris',900000,'super'),
	('Reaper','reaper',800000,'super'),
	('Sultan RS','sultanrs',400000,'super'),
	('T20','t20',1400000,'super'),
	('Turismo R','turismor',1100000,'super'),
	('Zentorno','zentorno',1500000,'super'),
	('XA21','xa21',900000,'super'),
	('Tezeract','tezeract',2500000,'super'),
	('Akuma','AKUMA',800000,'motorcycles'),
	('Bagger','bagger',27000,'motorcycles'),
	('Bati 801','bati',85000,'motorcycles'),
	('Diablous2','diablous2',1000000,'motorcycles'),
	('BF400','bf400',70000,'motorcycles'),
	('Vespa','faggio3',8000,'motorcycles'),
	('Hakuchou','hakuchou',87000,'motorcycles'),
	('Manchez','manchez',60000,'motorcycles'),
	('Nightblade','nightblade',50000,'motorcycles'),
	('Ruffian','ruffian',37000,'motorcycles'),
	('Sanchez','sanchez2',30000,'motorcycles'),
	('Enduro','enduro',20000,'motorcycles'),
	('Zombie Luxuary','zombieb',400000,'motorcycles'),
	('Sanctus','sanctus',1900000,'motorcycles')
;
