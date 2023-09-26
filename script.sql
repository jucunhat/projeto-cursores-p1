-- 2 - Cursor não vinculado
DO $$
DECLARE
	cur_preco_medio_pais REFCURSOR;
	v_preco_medio NUMERIC(5,2);
	v_pais VARCHAR(200);
BEGIN
	OPEN cur_preco_medio_pais FOR SELECT country, AVG(price) FROM tb_vinhos2 GROUP BY country; 
	LOOP 
		FETCH cur_preco_medio_pais INTO v_pais, v_preco_medio;
		EXIT WHEN NOT FOUND;
		RAISE NOTICE 'O país é % e a média é %',v_pais, v_preco_medio;
	END LOOP;
	CLOSE cur_preco_medio_pais;
END; 
$$

-- 1 - Criando a tabela
CREATE TABLE tb_vinhos2 (
	ID SERIAL PRIMARY KEY,
	country VARCHAR(200),
	description VARCHAR(1000),
	points INT,
	price NUMERIC
);