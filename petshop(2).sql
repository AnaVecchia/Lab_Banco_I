CREATE database petshop

CREATE TABLE clientes(
	cpf varchar(11) PRIMARY KEY,
    nome varchar(130) NOT NULL,
    telefone varchar(15) NOT NULL,
    email varchar(50),
    endereco varchar(180) NOT NULL,
    cidade varchar(50) NOT NULL
);
-- Inserindo dados na tabela clientes
INSERT INTO clientes (cpf, nome, telefone, email, endereco, cidade) VALUES
('11122233344', 'João Silva', '(11) 91234-5678', 'joao.silva@email.com', 'Rua A, 123', 'São Paulo'),
('22233344455', 'Maria Oliveira', '(22) 98765-4321', 'maria.oliveira@email.com', 'Avenida B, 456', 'Rio de Janeiro'),
('33344455566', 'José Santos', '(33) 87654-3210', 'jose.santos@email.com', 'Rua C, 789', 'Belo Horizonte'),
('44455566677', 'Ana Souza', '(44) 76543-2109', 'ana.souza@email.com', 'Rua D, 1011', 'Curitiba'),
('55566677788', 'Paulo Pereira', '(55) 65432-1098', 'paulo.pereira@email.com', 'Avenida E, 1213', 'Porto Alegre'),
('66677788899', 'Juliana Lima', '(66) 54321-0987', 'juliana.lima@email.com', 'Rua F, 1415', 'Salvador'),
('77788899900', 'Carlos Mendes', '(77) 43210-9876', 'carlos.mendes@email.com', 'Rua G, 1617', 'Brasília'),
('88899900011', 'Aline Castro', '(88) 32109-8765', 'aline.castro@email.com', 'Avenida H, 1819', 'Recife'),
('99900011122', 'Fernanda Almeida', '(99) 21098-7654', 'fernanda.almeida@email.com', 'Rua I, 2021', 'Fortaleza'),
('12345678901', 'Rafaela Fernandes', '(12) 10987-6543', 'rafaela.fernandes@email.com', 'Avenida J, 2223', 'Manaus'),
('23456789012', 'Lucas Rocha', '(23) 98765-4321', 'lucas.rocha@email.com', 'Rua K, 2425', 'Belém'),
('34567890123', 'Mariana Carvalho', '(34) 87654-3210', 'mariana.carvalho@email.com', 'Avenida L, 2627', 'Vitória'),
('45678901234', 'Pedro Oliveira', '(45) 76543-2109', 'pedro.oliveira@email.com', 'Rua M, 2829', 'Natal'),
('56789012345', 'Isabela Santos', '(56) 65432-1098', 'isabela.santos@email.com', 'Avenida N, 3031', 'Florianópolis'),
('67890123456', 'Gustavo Souza', '(67) 54321-0987', 'gustavo.souza@email.com', 'Rua O, 3233', 'Porto Velho');

CREATE TABLE pet (
  id_pet int  PRIMARY KEY,
  nome VARCHAR(255),
  especie VARCHAR(255) NOT NULL,
  raca VARCHAR(255) NOT NULL,
  sexo VARCHAR(255) NOT NULL,
  data_nascimento DATE NOT NULL,
  cpf varchar(11) NOT NULL,
  FOREIGN KEY (cpf) REFERENCES clientes(cpf)
);
-- Inserindo dados na tabela pet
INSERT INTO pet (id_pet, nome, especie, raca, sexo, data_nascimento, cpf) VALUES
(1, 'Bolinha', 'Cachorro', 'Labrador', 'Macho', '2019-05-10', '11122233344'),
(2, 'Mia', 'Gato', 'Siamês', 'Fêmea', '2020-02-15', '22233344455'),
(3, 'Rex', 'Cachorro', 'Pastor Alemão', 'Macho', '2018-11-20', '33344455566'),
(4, 'Frajola', 'Gato', 'Persa', 'Macho', '2017-07-25', '44455566677'),
(5, 'Mel', 'Cachorro', 'Poodle', 'Fêmea', '2020-09-30', '55566677788'),
(6, 'Luna', 'Gato', 'Maine Coon', 'Fêmea', '2019-04-12', '66677788899'),
(7, 'Bob', 'Cachorro', 'Vira-lata', 'Macho', '2016-12-08', '77788899900'),
(8, 'Nina', 'Cachorro', 'Golden Retriever', 'Fêmea', '2018-03-05', '88899900011'),
(9, 'Simba', 'Cachorro', 'Husky Siberiano', 'Macho', '2017-10-18', '99900011122'),
(10, 'Branca', 'Gato', 'Angorá', 'Fêmea', '2019-08-22', '12345678901'),
(11, 'Toby', 'Cachorro', 'Bulldog Francês', 'Macho', '2018-06-14', '23456789012'),
(12, 'Lola', 'Gato', 'Ragdoll', 'Fêmea', '2020-01-07', '34567890123'),
(13, 'Thor', 'Cachorro', 'Rottweiler', 'Macho', '2017-04-30', '45678901234'),
(14, 'Daisy', 'Cachorro', 'Dachshund', 'Fêmea', '2019-11-03', '56789012345'),
(15, 'Max', 'Cachorro', 'Boxer', 'Macho', '2018-02-28', '67890123456');


CREATE TABLE produtos (
 cod_produto INT PRIMARY KEY,
  nome_produto VARCHAR(255) NOT NULL,
  descricao varchar(255) NOT null,
  marca VARCHAR(255) NOT NULL,
  preco DECIMAL(10,2) NOT NULL
);
-- Inserindo dados na tabela produtos
INSERT INTO produtos (cod_produto, nome_produto, descricao, marca, preco) VALUES
(1, 'Ração para Cães', 'Ração premium para cães adultos de porte médio', 'Pedigree', 79.90),
(2, 'Ração para Gatos', 'Ração especial para gatos castrados de todas as idades', 'Royal Canin', 59.90),
(3, 'Shampoo para Cães', 'Shampoo hipoalergênico para cães de pelagem clara', 'Pet Society', 29.90),
(4, 'Condicionador para Gatos', 'Condicionador suave para gatos de todas as raças', 'Vetnil', 19.90),
(5, 'Coleira Antipulgas', 'Coleira repelente de pulgas e carrapatos para cães de médio porte', 'Bayer', 39.90),
(6, 'Brinquedo de Pelúcia', 'Brinquedo de pelúcia para gatos com catnip', 'Kong', 14.90),
(7, 'Comedouro Automático', 'Comedouro automático para cães e gatos com capacidade para 2 kg de ração', 'PetSafe', 99.90),
(8, 'Caixa de Transporte', 'Caixa de transporte resistente para cães de pequeno porte', 'TruFit', 89.90),
(9, 'Arranhador para Gatos', 'Arranhador vertical com poste de sisal e plataforma superior', 'Ferplast', 69.90),
(10, 'Coleira com Plaquinha de Identificação', 'Coleira com plaquinha de identificação gravada com nome e telefone', 'American Pet', 49.90);


CREATE TABLE servicos (
  cod_servico INT PRIMARY KEY,
  nome_servico VARCHAR(255) NOT NULL,
  tipo VARCHAR(255) NOT NULL,
  preco DECIMAL(10,2) NOT NULL,
  cpf varchar(11) NOT null,
  CONSTRAINT fk_servicos_clientes
  FOREIGN KEY (cpf)
  REFERENCES clientes(cpf)
);
-- Inserindo dados na tabela servicos
INSERT INTO servicos (cod_servico, nome_servico, tipo, preco, cpf) VALUES
(1, 'Banho e Tosa', 'Estética', 50.00, '11122233344'),
(2, 'Consulta Veterinária', 'Saúde', 80.00, '22233344455'),
(3, 'Vacinação', 'Saúde', 120.00, '33344455566'),
(4, 'Hospedagem', 'Hospedagem', 60.00, '44455566677'),
(5, 'Creche para Animais', 'Hospedagem', 40.00, '55566677788'),
(6, 'Adestramento', 'Educação', 100.00, '66677788899'),
(7, 'Passeio', 'Recreação', 30.00, '77788899900'),
(8, 'Microchipagem', 'Identificação', 80.00, '88899900011'),
(9, 'Cirurgia', 'Saúde', 500.00, '99900011122'),
(10, 'Tratamento Dentário', 'Saúde', 150.00, '12345678901'),
(11, 'Pet Sitting', 'Hospedagem', 50.00, '23456789012'),
(12, 'Serviço de Emergência 24 horas', 'Saúde', 200.00, '34567890123'),
(13, 'Exames Laboratoriais', 'Saúde', 80.00, '45678901234'),
(14, 'Banho de Gato', 'Estética', 40.00, '56789012345'),
(15, 'Corte de Unhas', 'Estética', 20.00, '67890123456');

CREATE TABLE vendas (
  id_venda INT PRIMARY KEY,
  cod_produto INT NOT NULL,
  id_pet INT NOT NULL,
  cod_servico INT NOT NULL,
  data_venda DATE NOT NULL,
  valor_venda DECIMAL(10,2) NOT NULL,
  cpf varchar(11) NOT NULL,
  FOREIGN KEY (cod_produto) REFERENCES produtos(cod_produto),
  FOREIGN KEY (id_pet) REFERENCES pet(id_pet),
  FOREIGN KEY (cod_servico) REFERENCES servicos(cod_servico),
  FOREIGN KEY (cpf) REFERENCES clientes(cpf)
);
-- Inserindo dados na tabela vendas
INSERT INTO vendas (id_venda, cod_produto, id_pet, cod_servico, data_venda, valor_venda, cpf) VALUES
(1, 1, 1, 1, '2024-04-01', 129.90, '11122233344'),
(2, 2, 2, 2, '2024-04-02', 139.90, '22233344455'),
(3, 3, 3, 3, '2024-04-03', 149.90, '33344455566'),
(4, 4, 4, 4, '2024-04-04', 99.80, '44455566677'),
(5, 5, 5, 5, '2024-04-05', 99.80, '55566677788'),
(6, 6, 6, 6, '2024-04-06', 114.80, '66677788899'),
(7, 7, 7, 7, '2024-04-07', 179.80, '77788899900'),
(8, 8, 8, 8, '2024-04-08', 189.80, '88899900011'),
(9, 9, 9, 9, '2024-04-09', 569.80, '99900011122'),
(10, 10, 10, 10, '2024-04-10', 129.80, '12345678901'),
(11, 1, 11, 11, '2024-04-11', 129.90, '23456789012'),
(12, 2, 12, 12, '2024-04-12', 139.80, '34567890123'),
(13, 3, 13, 13, '2024-04-13', 109.80, '45678901234'),
(14, 4, 14, 14, '2024-04-14', 99.90, '56789012345'),
(15, 5, 15, 15, '2024-04-15', 79.90, '67890123456'),
(17, 1, 1, 1, '2024-04-01', 500.90, '11122233344'),
(18, 2, 2, 2, '2024-04-02', 120.90, '22233344455'),
(19, 3, 3, 3, '2024-04-03', 130.90, '33344455566'),
(20, 4, 4, 4, '2024-04-04', 99.80, '44455566677'),
(21, 5, 5, 5, '2024-04-05', 99.80, '55566677788'),
(22, 1, 1, 1, '2024-05-01', 500.90, '11122233344'),
(23, 2, 2, 2, '2024-09-02', 120.90, '22233344455'),
(24, 3, 3, 3, '2024-05-03', 130.90, '33344455566'),
(25 4, 4, 4, '2024-07-04', 99.80, '44455566677'),
(26, 5, 5, 5, '2024-07-05', 99.80, '55566677788'),
(27, 1, 1, 1, '2024-07-01', 500.90, '11122233344'),
(28, 2, 2, 2, '2024-09-02', 120.90, '22233344455'),
(29, 3, 3, 3, '2024-02-03', 130.90, '33344455566'),
(30, 4, 4, 4, '2024-02-04', 99.80, '44455566677'),
(31, 5, 5, 5, '2024-03-05', 99.80, '55566677788'),
(32, 6, 6, 6, '2022-12-31', 114.80, '66677788899'),
(33, 7, 7, 7, '2021-11-15', 179.80, '77788899900'),
(34, 8, 8, 8, '2020-10-01', 189.80, '88899900011'),
(35, 9, 9, 9, '2019-01-20', 569.80, '99900011122'),
(36, 10, 10, 10, '2018-02-05', 129.80, '12345678901');


--Criação de views:

--1- Quais são os clientes do petshop e seus respectivos CPFs que possuem algum animal de estimação cadastrado?
CREATE VIEW clientes_com_animais AS
SELECT DISTINCT c.cpf, c.nome
FROM clientes c
JOIN pet p ON c.cpf = p.cpf;

--2 Quandos CPFs fizeram a compra com o valor menor que 100?
CREATE VIEW Compra_Menor_100 AS
SELECT c.cpf, c.nome, v.valor_venda
FROM clientes c
JOIN vendas v ON c.cpf = v.cpf
WHERE v.valor_venda < 100;

--3 Qual é a média dos valores de todas as vendas registradas no petshop?
CREATE VIEW Media_vendas AS
SELECT AVG(valor_venda) AS media_vendas
FROM vendas;

-- 4 Identifique os clientes do petshop que realizaram pelo menos uma venda e quantas vendas cada um fez.CREATE VIEW Vendas_Mais_De_Uma AS
SELECT c.nome, COUNT(v.id_venda) AS total_vendas
FROM clientes c
JOIN vendas v ON c.cpf = v.cpf
GROUP BY c.nome
HAVING COUNT(v.id_venda) > 1;

--5 Quais são os serviços e produtos solicitados por cada cliente?
CREATE VIEW Servicos_Solicitados AS
SELECT c.nome AS nome_cliente, s.nome_servico AS servico_pedido, p.nome_produto AS produto_comprado
FROM vendas v
JOIN servicos s ON v.cod_servico = s.cod_servico
JOIN clientes c ON v.cpf = c.cpf
JOIN produtos p ON v.cod_produto = p.cod_produto;



-- 6 clientes que mais gastaram
CREATE VIEW Clientes_Mais_Gastam AS
SELECT c.nome AS nome_cliente, SUM(v.valor_venda) AS total_gasto
FROM vendas v
JOIN clientes c ON v.cpf = c.cpf
GROUP BY c.nome
ORDER BY total_gasto DESC
LIMIT 5;


-- 7 serviço mais popular por mes
CREATE VIEW Servico_mensal_Recorrido AS
SELECT MONTH(v.data_venda) AS mes, s.nome_servico AS servico_mais_popular, COUNT(*) AS total_vendas
FROM vendas v
JOIN servicos s ON v.cod_servico = s.cod_servico
GROUP BY mes, s.nome_servico
ORDER BY mes, total_vendas DESC;


-- 8 comparação de vendas por ano
CREATE VIEW Comparação_Por_Ano AS
SELECT YEAR(v.data_venda) AS ano, SUM(v.valor_venda) AS total_vendas
FROM vendas v
GROUP BY ano;

--9 serviço de banho e tosa em cada mes
CREATE VIEW Servico_BanhoETosa_mes AS
SELECT YEAR(v.data_venda) AS ano, MONTH(v.data_venda) AS mes, COUNT(*) AS total_vendas_banho_tosa
FROM vendas v
JOIN servicos s ON v.cod_servico = s.cod_servico
WHERE s.nome_servico = 'Banho e Tosa'
GROUP BY ano, mes;

-- 10 média de vendas por cada cliente
CREATE VIEW Clientes_Venda_media
SELECT c.nome AS nome_cliente, AVG(v.valor_venda) AS media_vendas
FROM clientes c
JOIN vendas v ON c.cpf = v.cpf
GROUP BY c.nome
ORDER BY media_vendas DESC;


-- 11 mostre quanto cada serviço rendeu por mes 
CREATE VIEW Rendimento_Mensal_servico
SELECT 
    s.nome_servico AS servico,
    YEAR(v.data_venda) AS ano,
    MONTH(v.data_venda) AS mes,
    SUM(v.valor_venda) AS rendimento_mensal
FROM 
    servicos s
JOIN 
    vendas v ON s.cod_servico = v.cod_servico
GROUP BY 
    s.nome_servico, YEAR(v.data_venda), MONTH(v.data_venda)
ORDER BY 
    s.nome_servico, YEAR(v.data_venda), MONTH(v.data_venda);

-- 12 pets por nome
CREATE VIEW Pet_por_nome AS
SELECT 
    nome, 
    especie, 
    raca,
    data_nascimento
FROM 
    pet 
ORDER BY 
    nome ASC;

-- 13 histórico de compras de cada cliente
CREATE VIEW Clientes_Historico AS
SELECT 
    c.nome AS nome_cliente,
    v.data_venda,
    p.nome_produto AS produto_comprado,
    s.nome_servico AS servico_contratado
FROM 
    clientes c
LEFT JOIN 
    vendas v ON c.cpf = v.cpf
LEFT JOIN 
    produtos p ON v.cod_produto = p.cod_produto
LEFT JOIN 
    servicos s ON v.cod_servico = s.cod_servico
ORDER BY 
    c.nome, v.data_venda;


--14 produto mais vendido
CREATE VIEW ProdutosMaisVendidos AS
SELECT 
    p.nome_produto,
    COUNT(v.id_venda) AS total_vendas
FROM 
    produtos p
LEFT JOIN 
    vendas v ON p.cod_produto = v.cod_produto
GROUP BY 
    p.nome_produto
ORDER BY 
    total_vendas DESC;
 
 --Um LEFT JOIN em SQL retorna todas as linhas da tabela à esquerda da cláusula JOIN e as linhas correspondentes da tabela à direita, se houver, preenchendo com NULLs caso não haja correspondência.