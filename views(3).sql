--Crie no seu banco de dados 2 tabelas: produtos e nota fiscal (com os campos da imagem abaixo). Insira, pelo menos, 5 produtos na tabela de produtos. Então, insira esses valores na tabela de nota fiscal:


CREATE TABLE produtos (
  cod_prod int PRIMARY KEY,
  descricao varchar(255) NOT NULL,
  valor_unit decimal(10,2) NOT NULL
);

INSERT INTO produtos (cod_prod, descricao, valor_unit) VALUES
  (1, 'Produto_1', 25.00),
  (2, 'Produto_2', 13.50),
  (3, 'Produto_3', 15.00),
  (4, 'Produto_4', 10.00),
  (5, 'Produto_5', 30.00);


CREATE TABLE nota_fiscal (
  id_nf int NOT NULL,
  cod_prod int NOT NULL,
  valor_unit decimal(10,2) NOT NULL,
  quantidade int NOT NULL,
  desconto decimal(5,2),
  FOREIGN KEY (cod_prod) REFERENCES produtos(cod_prod),
  PRIMARY KEY(id_nf, cod_prod)
);



INSERT INTO nota_fiscal (id_nf, cod_prod, valor_unit, quantidade, desconto) VALUES
(1, 1, 25.00, 10, 5),
(1, 2, 13.50, 3, ),
(1, 3, 15.00, 2, ),
(1, 4, 10.00, 1, ),
(1, 5, 30.00, 1, ),
(2, 3, 15.00, 4, ),
(2, 4, 10.00, 5, ),
(2, 5, 30.00, 7, ),
(3, 1, 25.00, 5, ),
(3, 4, 10.00, 4, ),
(3, 5, 30.00, 5, ),
(3, 2, 13.00, 7, ),
(4, 5, 30.00, 10, 15),
(4, 4, 10.00, 12, 5),
(4, 1, 25.00, 13, 5),
(4, 2, 13.00, 15, 5),
(5, 3, 15.00, 3, ),
(5, 5, 30.00, 6, ),
(6, 1, 25.00, 22, 15),
(6, 3, 15.00, 25, 20),
(7, 1, 25.00, 10, 3),
(7, 2, 13.00, 10, 4),
(7, 3, 15.00, 10, 4),
(7, 5, 30.00, 10, 1);



--1. Descubra qual produto mais vendeu no geral e mostre seu nome e o valor total


CREATE VIEW vw_vendas_totais AS
SELECT p.descricao, SUM(nf.quantidade) AS total_vendido
FROM produtos p
INNER JOIN nota_fiscal nf ON p.cod_prod = nf.cod_prod
GROUP BY p.cod_prod, p.descricao
ORDER BY total_vendido DESC
LIMIT 1;

 --2-Encontre as notas fiscais que venderam mais de 10 unidades
--de pelo menos um produto. Mostre o valor do produto e a
--quantidade vendida. Agrupe o resultado pelos códigos da
--nota e do produto.



CREATE VIEW vw_vendas_por_item AS
SELECT nf.id_nf, nf.cod_prod, nf.valor_unit, nf.quantidade
FROM nota_fiscal nf
INNER JOIN produtos p ON nf.cod_prod = p.cod_prod
WHERE nf.quantidade > 10
GROUP BY nf.id_nf, nf.cod_prod;

--3.esquise o valor total das notas fiscais onde esse valor seja maior que 500. Ordene o resultado do maior para o menor valor. Mostre apenas o id da nota e o valor total

CREATE VIEW vw_notas_acima_500 AS
SELECT nf.id_nf,
       SUM(nf.quantidade * p.valor_unit) AS valor_total
FROM nota_fiscal AS nf
INNER JOIN produtos AS p ON p.cod_prod = nf.cod_prod
GROUP BY nf.id_nf
HAVING valor_total > 500
ORDER BY valor_total DESC;

--4. Qual o valor médio dos descontos dados por produto? Mostre apenas o código do produto e o valor médio. Agrupe o resultado pelo código do produto

CREATE VIEW vw_desconto_medio_produto AS
SELECT cod_prod, AVG(desconto) AS desconto_medio
FROM nota_fiscal
WHERE desconto IS NOT NULL
GROUP BY cod_prod
ORDER BY desconto_medio DESC;



--5. Semelhante ao anterior, mas mostre também o menor e o maior valor dos descontos

SELECT cod_prod, AVG(desconto) AS desconto_medio, MIN(desconto) AS desconto_minimo, MAX(desconto) AS desconto_maximo
FROM nota_fiscal
WHERE desconto IS NOT NULL
GROUP BY cod_prod
ORDER BY desconto_medio DESC;


--6. Quais as notas fiscais que possuem mais de 3 itens vendidos (itens, não quantidades)? Mostre apenas o id da nota e a quantidade de itens. Agrupe pelo id da nota

CREATE VIEW vw_notas_fiscais_itens AS
SELECT
  nf.id_nf,
  COUNT(DISTINCT nf.cod_prod) AS quantidade
FROM nota_fiscal AS nf
INNER JOIN produtos AS p ON p.cod_prod = nf.cod_prod
GROUP BY nf.id_nf
HAVING COUNT(DISTINCT nf.cod_prod) > 3;

SELECT
  nf.id_nf,
  COUNT(DISTINCT nf.cod_prod) AS quantidade
FROM nota_fiscal AS nf
INNER JOIN produtos AS p ON p.cod_prod = nf.cod_prod
GROUP BY nf.id_nf
HAVING COUNT(DISTINCT nf.cod_prod) > 3
LIMIT 25;

