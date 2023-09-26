-- Criando uma tabela
CREATE TABLE tb_vinhos (
	ID SERIAL PRIMARY KEY,
	country VARCHAR(200),
	description VARCHAR(500),
	points INT,
	price NUMERIC
);
