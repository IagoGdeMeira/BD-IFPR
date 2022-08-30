DROP DATABASE IF EXISTS projeto_db;
CREATE DATABASE IF NOT EXISTS projeto_db;
USE projeto_db;

CREATE TABLE avicultor(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
,nome VARCHAR(255) NOT NULL
,email VARCHAR(255) NOT NULL
);

INSERT INTO avicultor (nome, email)
VALUES ('Teste Um', 'testeum@gmail.com');

INSERT INTO avicultor
VALUES ('Teste Dois', 'testedois@gmail.com');

INSERT INTO avicultor
VALUES ('Teste Tres', 'testetres@gmail.com');

SELECT * FROM avicultor;

CREATE TABLE aviarios(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
,denominacao VARCHAR(255) NOT NULL
,avicultor_id INT NOT NULL
,max_aves INT NOT NULL UNIQUE 
,FOREIGN KEY (avicultor_id) REFERENCES avicultor (id)
);

INSERT INTO aviarios (denominacao, avicultor_id, max_aves)
VALUES ('Teste 1', '1', '50000');

INSERT INTO aviarios
VALUES ('Teste 2', '1', '25000');

INSERT INTO aviarios
VALUES ('Teste 1', '2', '50000');

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
