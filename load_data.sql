set global local_infile=1;

LOAD DATA INFILE 'C:/xampp/htdocs/VoterList.csv'
INTO TABLE voterList
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
