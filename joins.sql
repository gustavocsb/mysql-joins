CREATE SCHEMA joins;
USE joins;

CREATE TABLE marca (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(45) NULL,
  PRIMARY KEY (id)
);

CREATE TABLE modelo (
  id INT NOT NULL AUTO_INCREMENT,
  marca_id INT NOT NULL,
  modelo VARCHAR(45) NULL,
  PRIMARY KEY (id)
  );
  
  CREATE TABLE veiculo (
	id INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR(30) NULL,
    modelo_id INT NOT NULL,
    PRIMARY KEY (id)
  );

show tables;

ALTER TABLE modelo ADD CONSTRAINT fk_modelo_marca FOREIGN KEY (marca_id) REFERENCES marca(id);
ALTER TABLE veiculo ADD CONSTRAINT fk_veiculo_modelo FOREIGN KEY (modelo_id) REFERENCES modelo(id);

INSERT INTO marca (nome) VALUES ('BMW');
INSERT INTO marca (nome) VALUES ('VW');
INSERT INTO marca (nome) VALUES ('FIAT');
INSERT INTO marca (nome) VALUES ('HONDA');

INSERT INTO modelo (marca_id, modelo) VALUES (1, '328i');
INSERT INTO modelo (marca_id, modelo) VALUES (3, 'Mobi');
INSERT INTO modelo (marca_id, modelo) VALUES (2, 'Passat');
INSERT INTO modelo (marca_id, modelo) VALUES (4, 'City');
INSERT INTO modelo (marca_id, modelo) VALUES (4, 'Civic');
INSERT INTO modelo (marca_id, modelo) VALUES (4, 'Accord');

SELECT id, id
FROM modelo
INNER JOIN marca
ON modelo.id = marca.modelo_id;
#resultará nas marcas e modelos q possuem o mesmo id

SELECT id, id
FROM veiculo
LEFT JOIN marca
ON veiculo.id = marca.id;
#resultará nos ids de todos os veiculos e os que são iguais em veiculo e marca

SELECT id, id
FROM marca
RIGHT JOIN modelo
ON marca.id = modelo.id;
#resultará nos ids de todos os modelos e os que são iguais em marca e modelo

SELECT nome, nome
FROM modelo
LEFT JOIN marca
ON modelo.nome = marca.nome
WHERE marca.nome is null;
#resultará nos nomes de todos os modelos, excluindo os que se igualam a nome de marca

SELECT nome, nome
FROM modelo
RIGHT JOIN marca
ON modelo.nome = marca.nome
WHERE modelo.nome is null;
#resultará nos nomes de todas as marcas, excluindo os que se igualam a nome de modelo

SELECT ano, ano, id
FROM veiculo
INNER JOIN modelo
	ON veiculo.ano = modelo.ano
INNER JOIN marca
	ON marca.id = modelo.nome;