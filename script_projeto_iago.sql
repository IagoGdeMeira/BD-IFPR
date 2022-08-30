DROP DATABASE IF EXISTS banco_iago;
CREATE DATABASE IF NOT EXISTS banco_iago;
USE banco_iago;

CREATE TABLE usuario(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    senha VARCHAR(30) NOT NULL,
    biografia VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    telefone BIGINT NOT NULL UNIQUE,
    ativo ENUM('S', 'N') NOT NULL
);

CREATE TABLE mestre(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ativo ENUM('S', 'N'),
    usuario_id INT NOT NULL, FOREIGN KEY (usuario_id) REFERENCES usuario (id)
);

CREATE TABLE campanha(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL,
    ativa ENUM('S', 'N'),
    mestre_id INT NOT NULL, FOREIGN KEY (mestre_id) REFERENCES mestre (id)
);

CREATE TABLE usuario_campanha(
	usuario_id INT NOT NULL, FOREIGN KEY (usuario_id) REFERENCES usuario (id),
    campanha_id INT NOT NULL, FOREIGN KEY (campanha_id) REFERENCES campanha (id),
    apelido VARCHAR(255) NOT NULL
);

INSERT INTO usuario (nome, senha, biografia, email, telefone) VALUES ('JorginzKilo', 'kneilo7852', 'rpgzin do bão é vida', 'jorginnupik@gmail.com', 5544989652018);
INSERT INTO usuario (nome, senha, biografia, email, telefone) VALUES ('lolazeira', 'brilhabrilha', 'Gosto de Fofura!', 'larissagemaplayer@hotmail.com', 5541923967189);
INSERT INTO usuario (nome, senha, biografia, email, telefone) VALUES ('bob', 'meunomeehbob', 'bob', 'bobbobbobobo@gmail.com', 5547963874121);

INSERT INTO mestre (usuario_id) VALUES (1);
INSERT INTO mestre (usuario_id) VALUES (2);
INSERT INTO mestre (usuario_id) VALUES (3);

INSERT INTO campanha (nome, mestre_id) VALUES ('RP do Jorgeta!!!', 1);
INSERT INTO campanha (nome, mestre_id) VALUES ('Meu rpg <3<3', 2);
INSERT INTO campanha (nome, mestre_id) VALUES ('B O B', 3);