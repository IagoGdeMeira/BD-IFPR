DROP DATABASE IF EXISTS projeto_db;
CREATE DATABASE IF NOT EXISTS projeto_db;
USE projeto_db;

CREATE TABLE avicultor(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
,nome VARCHAR(255) NOT NULL
,email VARCHAR(255) NOT NULL
,propriedade VARCHAR(255) NOT NULL
);

INSERT INTO avicultor (nome, email, propriedade)
VALUES ('Teste Um', 'testeum@gmail.com', 'Faenda 1');

INSERT INTO avicultor (nome, email, propriedade)
VALUES ('Teste Dois', 'testedois@gmail.com', 'Fazenda Dois');

INSERT INTO avicultor (nome, email, propriedade)
VALUES ('Teste Tres', 'testetres@gmail.com', 'Fazenda Tres');

SELECT * FROM avicultor;

CREATE TABLE aviarios(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
,denominacao VARCHAR(255) NOT NULL
,avicultor_id INT NOT NULL
,max_aves INT NOT NULL  
,FOREIGN KEY (avicultor_id) REFERENCES avicultor (id)
);

INSERT INTO aviarios (denominacao, avicultor_id, max_aves)
VALUES ('Teste Um 1', '1', '50000');

INSERT INTO aviarios (denominacao, avicultor_id, max_aves)
VALUES ('Teste Um 2', '1', '25000');

INSERT INTO aviarios (denominacao, avicultor_id, max_aves)
VALUES ('Teste Dois 1', '2', '50000');

SELECT * FROM aviarios;

CREATE TABLE lote(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
,data_hora VARCHAR(255) NOT NULL 
,qtd_racao VARCHAR(255) NOT NULL
,peso_aves VARCHAR(255) NOT NULL
,aves VARCHAR(255) NOT NULL
,aviarios_id INT NOT NULL
,FOREIGN KEY (aviarios_id) REFERENCES aviarios (id)
);

INSERT INTO lote (data_hora, qtd_racao, peso_aves, aves, aviarios_id)
VALUES ('28/08 12:30', '5000kg', '0,44kg', '47000', '1');

INSERT INTO lote (data_hora, qtd_racao, peso_aves, aves, aviarios_id)
VALUES ('28/08 14:00', '2750kg', '0,50kg', '24500', '2');

INSERT INTO lote (data_hora, qtd_racao, peso_aves, aves, aviarios_id)
VALUES ('25/08 16:25', '5000kg', '0,48kg', '48000', '3');

SELECT * FROM lote;

CREATE TABLE data_hora_tbl(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
,data_inicio VARCHAR(255) NOT NULL
,data_final VARCHAR(255) NOT NULL
,qtd_dias INT NOT NULL
,lote_id INT NOT NULL
,FOREIGN KEY (lote_id) REFERENCES lote (id)
);

INSERT INTO data_hora_tbl (data_inicio, data_final, qtd_dias, lote_id) 
VALUES ('28/08 12:30', 'A definir', '8', '1');

INSERT INTO data_hora_tbl (data_inicio, data_final, qtd_dias, lote_id) 
VALUES ('28/08 14:00', 'A definir', '8', '2');

INSERT INTO data_hora_tbl (data_inicio, data_final, qtd_dias, lote_id)
VALUES ('25/08 16:25', 'A definir', '11', '3');

SELECT * FROM data_hora_tbl;

CREATE TABLE qtd_racao_tbl(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT	
,qtd_inicio VARCHAR(255) NOT NULL
,qtd_recebida VARCHAR(255) NOT NULL
,qtd_devolvida VARCHAR(255) NOT NULL
,lote_id INT NOT NULL
,FOREIGN KEY (lote_id) REFERENCES lote (id)
);

INSERT INTO qtd_racao_tbl (qtd_inicio, qtd_recebida, qtd_devolvida, lote_id)
VALUES ('5000kg', '5000kg', 'A definir', '1');

INSERT INTO qtd_racao_tbl (qtd_inicio, qtd_recebida, qtd_devolvida, lote_id)
VALUES ('2750kg', '3000kg', 'A definir', '2');

INSERT INTO qtd_racao_tbl (qtd_inicio, qtd_recebida, qtd_devolvida, lote_id)
VALUES ('5000kg', '4700kg', 'A definir', '3');

SELECT * FROM qtd_racao_tbl;

CREATE TABLE peso_aves_tbl(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
,peso_inicial VARCHAR(255) NOT NULL
,peso_medio VARCHAR(255) NOT NULL
,peso_final VARCHAR(255) NOT NULL
,lote_id INT NOT NULL
,FOREIGN KEY (lote_id) REFERENCES lote (id)
);


INSERT INTO peso_aves_tbl (peso_inicial, peso_medio, peso_final, lote_id)
VALUES ('0,44kg', '0,120kg', 'A definir', '1');

INSERT INTO peso_aves_tbl (peso_inicial, peso_medio, peso_final, lote_id)
VALUES ('0,50kg', '0,127kg', 'A definir', '2');

INSERT INTO peso_aves_tbl (peso_inicial, peso_medio, peso_final, lote_id)
VALUES ('0,48kg', '0,125kg', 'A definir', '3');

SELECT * FROM peso_aves_tbl;

CREATE TABLE qtd_aves(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
,qtd_inicio VARCHAR(255) NOT NULL
,qtd_mortas VARCHAR(255) NOT NULL
,qtd_final VARCHAR(255) NOT NULL
,lote_id INT NOT NULL
,FOREIGN KEY (lote_id) REFERENCES lote (id)
);

INSERT INTO qtd_aves (qtd_inicio, qtd_mortas, qtd_final, lote_id)
VALUES ('47000', '45', 'A definir', '1');

INSERT INTO qtd_aves (qtd_inicio, qtd_mortas, qtd_final, lote_id)
VALUES ('24500', '37', 'A definir', '2');

INSERT INTO qtd_aves (qtd_inicio, qtd_mortas, qtd_final, lote_id)
VALUES ('48000', '52', 'A definir', '3');

SELECT * FROM qtd_aves;






