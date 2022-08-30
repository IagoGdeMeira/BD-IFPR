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
    ativa ENUM('S', 'N')
);

CREATE TABLE usuario_campanha(
	usuario_id INT NOT NULL, FOREIGN KEY (usuario_id) REFERENCES usuario (id),
    campanha_id INT NOT NULL, FOREIGN KEY (campanha_id) REFERENCES campanha (id),
    apelido VARCHAR(255) NOT NULL
);