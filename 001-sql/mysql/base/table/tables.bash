
mysql>
mysql>
mysql>
mysql>
mysql>
mysql> use db_sqlserver_sintax;
Database changed
mysql>
mysql>
mysql>
mysql>
mysql>
mysql> show tables;
Empty set (0.01 sec)

mysql>
mysql>
mysql>
mysql>
mysql>
mysql> create table tb_template(
    ->     id int primary key auto_increment, -- Llave primaria, auto incrementable 1 a 1, inicia en 1
    ->     vrc_varchar varchar(100) not null, -- Puede guardar hasta 8000 caracteres
    ->     vrc_varchar_2 varchar(100),        --
    ->     vrc_varchar_3 varchar(100) null,   --
    ->     int_int int not null,              -- Valores numéricos enteros, de -2000000000 a 2000000000 aprox
    ->     int_int_2 int,                     --
    ->     int_int_3 int null default 1,      --
    ->     flt_real float not null,           --
    ->     flt_real_2 float,                  --
    ->     flt_real_3 float null,             --
    ->     dtt_datetime datetime not null,    --
    ->     dtt_datetime_2 datetime            --
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql>
mysql>
mysql>
mysql>
mysql>
mysql> show tables;
+-------------------------------+
| Tables_in_db_sqlserver_sintax |
+-------------------------------+
| tb_template                   |
+-------------------------------+
1 row in set (0.00 sec)

mysql>
mysql>
mysql>
mysql>
mysql>
mysql> INSERT INTO tb_template VALUES (NULL, 'aa aa', NULL, 'text aaa', 180, NULL, 0, 91.02366667, 91.02366667, 0.0001, '1960-03-14', '1960-03-14');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'aa ab', 'aa ab', 'text aab', 170, NULL, 0, 85.96766667, NULL, 0.0002, '1960-03-15', NULL);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'aa ac', NULL, 'text aac', 160, NULL, 0, 80.91166667, NULL, 0.0003, '1965-12-23', NULL);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'aa ad', NULL, 'text aad', 150, NULL, 0, 75.85566667, NULL, 0.0004, '1970-07-24', NULL);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'aa ba', NULL, 'text aae', 140, 140, 0, 70.79966667, NULL, 0.0005, '1965-12-24', NULL);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'aa bb', NULL, 'text bba', 130, 130, 0, 65.74366667, 65.74366667, 1.000001, '1970-07-25', NULL);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'aa bc', NULL, 'text bbb', 120, NULL, 0, 60.68766667, 60.68766667, 1.000001, '1975-08-24', NULL);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'aa bd', NULL, 'text bbc', 110, NULL, 0, 55.63166667, 55.63166667, 1.000001, '1960-03-16', NULL);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'ab aa', NULL, 'text bbd', 100, 100, 0, 50.57566667, 50.57566667, 1.000001, '1960-03-17', NULL);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'ab ab', 'ab ab', 'text bbe', 90, 90, 0, 45.51966667, 45.51966667, 1.000001, '1980-02-13', '1980-02-13');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'ab ac', 'ab ac', 'text cca', 80, 80, 0, 40.46366667, 40.46366667, 2.000001, '1980-02-14', '1980-02-14');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'ab ad', 'ab ad', 'text ccb', 70, 70, 0, 35.40766667, 35.40766667, 2.000001, '1980-02-15', '1980-02-15');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'ab ba', NULL, 'text ccc', 60, NULL, 0, 30.35166667, 30.35166667, 2.000001, '1985-01-03', '1985-01-03');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'ab bb', NULL, 'text ccd', 50, 50, NULL, 25.29566667, 25.29566667, 2.000001, '1985-01-04', NULL);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'ab bc', 'ab bc', 'text cce', 40, 40, NULL, 20.23966667, 20.23966667, 2.000001, '1985-01-05', NULL);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'ab bd', 'ab bd', 'text dda', 30, 30, NULL, 15.18366667, 15.18366667, 3.000001, '1985-01-06', NULL);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'ba ba', NULL, 'text ddb', 20, 20, NULL, 10.12766667, 10.12766667, 3.000001, '1990-04-18', NULL);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'ba bb', NULL, 'text ddc', 10, NULL, NULL, 5.071666667, 5.071666667, 3.000001, '1990-04-19', NULL);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'ba ac', NULL, 'text ddd', 0, 0, NULL, 0.001, NULL, 3.000001, '1990-04-20', NULL);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'ba ad', 'ba ad', 'text dde', -10, NULL, NULL, -5.011, NULL, 3.000001, '1995-09-21', NULL);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'ba ba', NULL, 'text eea', -20, NULL, NULL, -10.111, NULL, 4.000001, '1995-09-22', NULL);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'ba bb', 'ba bb', 'text eeb', -30, -30, NULL, -15.15233333, NULL, 4.000001, '1995-09-23', NULL);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'ba bc', 'ba bc', 'text eec', -40, -40, NULL, -20.20833333, NULL, 4.000001, '2000-08-17', NULL);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'ba bd', NULL, 'text eed', -50, -50, 0, -25.26433333, NULL, 4.000001, '2000-08-18', NULL);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'bb ba', NULL, 'text eee', -60, -60, 0, -30.32033333, NULL, 4.000001, '2000-08-19', '2000-08-19');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'bb bb', NULL, 'text ffa', -70, -70, 0, -35.37633333, -35.37633333, 5.000001, '2005-09-12', '2005-09-12');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'bb ac', 'bb ac', 'text ffb', -80, -80, 0, -40.43233333, -40.43233333, 5.000001, '2005-09-13', '2005-09-13');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'bb ad', 'bb ad', 'text ffc', -90, -90, 0, -45.48833333, -45.48833333, 5.000001, '2005-09-14', '2005-09-14');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'bb ba', 'bb ba', 'text ffd', -100, -100, 0, -50.54433333, -50.54433333, 5.000001, '2010-11-01', '2010-11-01');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'bb bb', NULL, 'text ffe', -110, NULL, 0, -55.60033333, -55.60033333, 5.000001, '2010-11-02', NULL);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'bb bc', 'bb bc', 'text gga', -120, NULL, NULL, -60.65633333, -60.65633333, 6.000001, '2010-11-03', NULL);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'bb bd', 'bb bd', 'text ggb', -130, NULL, NULL, -65.71233333, -65.71233333, 6.000001, '2015-02-07', NULL);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'ca aa', 'ca aa', 'text ggc', -140, -140, NULL, -70.76833333, -70.76833333, 6.000001, '2015-02-08', NULL);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'ca ab', 'ca ab', 'text ggd', -150, -150, NULL, -75.82433333, -75.82433333, 6.000001, '2015-02-09', NULL);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'ca ac', NULL, 'text gge', -160, -160, NULL, -80.88033333, NULL, 6.000001, '2020-11-19', NULL);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'aa aa', NULL, 'text hha', -170, -170, 0, -85.93633333, NULL, 7.000001, '1960-03-16', NULL);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'aa ab', NULL, 'text hhb', -180, -180, 0, -90.99233333, NULL, 7.000001, '1960-03-17', NULL);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'aa ac', 'aa ac', 'text hhc', -190, -190, 0, -96.04833333, NULL, 7.000001, '1965-12-24', NULL);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'aa ad', 'aa ad', 'text hhd', -200, -200, 0, -101.1043333, NULL, 7.000001, '1970-07-25', NULL);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'aa ba', 'aa ba', 'text hhe', -210, -210, 0, -106.1603333, NULL, 7.000001, '1965-12-25', NULL);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'aa bb', NULL, 'text iia', -220, -220, 0, -111.2163333, -111.2163333, 8.000001, '1970-07-26', NULL);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'aa bc', NULL, 'text iib', -230, -230, NULL, -116.2723333, -116.2723333, 8.000001, '1975-08-25', NULL);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'aa bd', NULL, 'text iic', -240, -240, NULL, -121.3283333, -121.3283333, 8.000001, '1960-03-18', NULL);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'ab aa', 'ab aa', 'text iid', -250, NULL, NULL, -126.3843333, -126.3843333, 8.000001, '1960-03-19', NULL);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'ab ab', 'ab ab', 'text iie', -260, NULL, NULL, -131.4403333, -131.4403333, 8.000001, '1980-02-16', NULL);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'ab ac', NULL, 'text jja', -270, -270, NULL, -136.4963333, -136.4963333, 9.000001, '1980-02-17', NULL);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'ab ad', NULL, 'text jjb', -280, -280, NULL, -141.5523333, -141.5523333, 9.000001, '1980-02-18', NULL);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'ab ba', 'ab ba', 'text jjc', -290, -290, 0, -146.6083333, -146.6083333, 9.000001, '1985-01-07', NULL);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'ab bb', 'ab bb', 'text jjd', -300, NULL, 0, -151.6643333, -151.6643333, 9.000001, '1985-01-08', '1985-01-08');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'ab bc', 'ab bc', 'text jje', -310, NULL, 0, -156.7203333, -156.7203333, 9.000001, '1985-01-09', '1985-01-09');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'ab bd', NULL, 'text aaa', -320, NULL, 0, -161.7763333, -161.7763333, 0.0006, '1985-01-10', '1985-01-10');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'ba ba', NULL, 'text aab', -330, NULL, 0, -166.8323333, -166.8323333, 0.0007, '1990-04-21', '1990-04-21');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'ba bb', 'ba bb', 'text aac', -340, -340, 0, -171.8883333, -171.8883333, 0.0008, '1990-04-22', '1990-04-22');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'ba ac', 'ba ac', 'text aad', -350, -350, 0, -176.9443333, -176.9443333, 0.0009, '1990-04-23', '1990-04-23');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'ba ad', 'ba ad', 'text aae', -360, -360, NULL, -182.0003333, -182.0003333, 0.0010, '1995-09-24', '1995-09-24');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'ba ba', NULL, 'text bba', -370, -370, NULL, -187.0563333, -187.0563333, 1.000001, '1995-09-25', '1995-09-25');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'ba bb', NULL, 'text bbb', -380, -380, NULL, -192.1123333, -192.1123333, 1.000001, '1995-09-26', '1995-09-26');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'ba bc', NULL, 'text bbc', -390, -390, NULL, -197.1683333, -197.1683333, 1.000001, '2000-08-20', '2000-08-20');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'ba bd', 'ba bd', 'text bbd', -400, NULL, NULL, -202.2243333, NULL, 1.000001, '2000-08-21', '2000-08-21');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'bb ba', NULL, 'text bbe', -410, NULL, NULL, -207.2803333, NULL, 1.000001, '2000-08-22', NULL);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'bb bb', 'bb bb', 'text cca', -420, NULL, NULL, -212.3363333, NULL, 2.000001, '2005-09-15', NULL);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'bb ac', 'bb ac', 'text ccb', -430, -430, NULL, -217.3923333, NULL, 2.000001, '2005-09-16', NULL);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'bb ad', 'bb ad', 'text ccc', -440, -440, NULL, -222.4483333, NULL, 2.000001, '2005-09-17', NULL);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'bb ba', NULL, 'text ccd', -450, -450, 0, -227.5043333, NULL, 2.000001, '2010-11-04', NULL);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'bb bb', 'bb bb', 'text cce', -460, -460, 0, -232.5603333, -232.5603333, 2.000001, '2010-11-05', NULL);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'bb bc', NULL, 'text dda', -470, -470, 0, -237.6163333, -237.6163333, 5.192308692, '2010-11-06', NULL);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'bb bd', NULL, 'text ddb', -480, -480, 0, -242.6723333, -242.6723333, 5.384616385, '2015-02-10', NULL);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'ca aa', 'ca aa', 'text ddc', -490, -490, 0, -247.7283333, -247.7283333, 5.576924077, '2015-02-11', NULL);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'ca ab', 'ca ab', 'text ddd', -500, -500, 0, -252.7843333, -252.7843333, 5.769231769, '2015-02-12', NULL);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'ca ac', NULL, 'text dde', -510, -510, 0, -257.8403333, -257.8403333, 5.961539462, '2020-11-20', NULL);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'aa aa', 'aa aa', 'text eea', -520, NULL, NULL, -262.8963333, -262.8963333, 6.153847154, '1960-03-18', NULL);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'aa ab', 'aa ab', 'text eeb', -530, -530, NULL, -267.9523333, -267.9523333, 6.346154846, '1960-03-19', NULL);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'aa ac', 'aa ac', 'text eec', -540, NULL, NULL, -273.0083333, -273.0083333, 6.538462538, '1965-12-25', NULL);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'aa ad', NULL, 'text eed', -550, NULL, NULL, -278.0643333, -278.0643333, 6.730770231, '1970-07-26', NULL);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'aa ba', 'aa ba', 'text eee', -560, -560, NULL, -283.1203333, NULL, 6.923077923, '1965-12-26', NULL);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'aa bb', NULL, 'text ffa', -570, -570, NULL, -288.1763333, NULL, 7.115385615, '1970-07-27', NULL);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'aa bc', 'aa bc', 'text ffb', -580, -580, NULL, -293.2323333, NULL, 7.307693308, '1975-08-26', NULL);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'aa bd', 'aa bd', 'text ffc', -590, -590, NULL, -298.2883333, NULL, 7.500001, '1960-03-20', NULL);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'ab aa', 'ab aa', 'text ffd', -600, -600, NULL, -303.3443333, NULL, 5.000001, '1960-03-21', NULL);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'ab ab', 'ab ab', 'text ffe', -610, NULL, NULL, -308.4003333, NULL, 5.000001, '1980-02-19', NULL);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'ab ac', 'ab ac', 'text gga', -620, NULL, NULL, -313.4563333, NULL, 6.000001, '1980-02-20', NULL);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'ab ad', NULL, 'text ggb', -630, NULL, NULL, -318.5123333, NULL, 6.000001, '1980-02-21', NULL);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'ab ba', 'ab ba', 'text ggc', -640, NULL, 0, -323.5683333, -323.5683333, 6.000001, '1985-01-11', '1985-01-11');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'ab bb', NULL, 'text ggd', -650, -650, 0, -328.6243333, -328.6243333, 6.000001, '1985-01-12', '1985-01-12');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'ab bc', 'ab bc', 'text gge', -660, -660, 0, -333.6803333, -333.6803333, 6.000001, '1985-01-13', '1985-01-13');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'ab bd', 'ab bd', 'text hha', -670, -670, 0, -338.7363333, -338.7363333, 7.000001, '1985-01-14', '1985-01-14');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'ba ba', 'ba ba', 'text hhb', -680, -680, 0, -343.7923333, -343.7923333, 7.000001, '1990-04-24', '1990-04-24');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'ba bb', 'ba bb', 'text hhc', -690, -690, 0, -348.8483333, -348.8483333, 9.500001, '1990-04-25', '1990-04-25');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'ba ac', NULL, 'text hhd', -700, -700, 0, -353.9043333, -353.9043333, 9.692308692, '1990-04-26', '1990-04-26');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'ba ad', 'ba ad', 'text hhe', -710, -710, NULL, -358.9603333, -358.9603333, 9.884616385, '1995-09-27', '1995-09-27');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'ba ba', 'ba ba', 'text iia', -720, -720, NULL, -364.0163333, -364.0163333, 10.07692408, '1995-09-28', '1995-09-28');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'ba bb', NULL, 'text iib', -730, -730, NULL, -369.0723333, -369.0723333, 10.26923177, '1995-09-29', '1995-09-29');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'ba bc', 'ba bc', 'text iic', -740, -740, NULL, -374.1283333, -374.1283333, 10.46153946, '2000-08-23', '2000-08-23');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'ba bd', 'ba bd', 'text iid', -750, -750, NULL, -379.1843333, -379.1843333, 10.65384715, '2000-08-24', '2000-08-24');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'bb ba', 'bb ba', 'text iie', -760, NULL, 0, -384.2403333, NULL, 10.84615485, '2000-08-25', '2000-08-25');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'bb bb', NULL, 'text jja', -770, NULL, 0, -389.2963333, NULL, 11.03846254, '2005-09-18', '2005-09-18');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'bb ac', 'bb ac', 'text jjb', -780, NULL, 0, -394.3523333, NULL, 11.23077023, '2005-09-19', '2005-09-19');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'bb ad', NULL, 'text jjc', -790, NULL, 0, -399.4083333, NULL, 11.42307792, '2005-09-20', '2005-09-20');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'bb ba', 'bb ba', 'text jjd', -800, NULL, 0, -404.4643333, NULL, 11.61538562, '2010-11-07', '2010-11-07');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tb_template VALUES (NULL, 'ca ac', NULL, 'text jje', -810, NULL, 0, -409.5203333, NULL, 11.80769331, '2020-11-21', '2020-11-21');
Query OK, 1 row affected (0.00 sec)

mysql>
mysql>
mysql>
mysql>
mysql>
mysql>