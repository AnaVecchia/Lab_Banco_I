CREATE DATABASE Pelos_e_Patas;

-- Criação da tabela clientes
CREATE TABLE clientes(
    cpf VARCHAR(11) PRIMARY KEY,
    nome VARCHAR(130) NOT NULL,
    telefone VARCHAR(15) NOT NULL,
    email VARCHAR(50),
    endereco VARCHAR(180) NOT NULL,
    cidade VARCHAR(50) NOT NULL
);

-- Inserção de dados na tabela clientes
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

-- Criação da tabela pet
CREATE TABLE pet (
    id_pet INT PRIMARY KEY,
    nome VARCHAR(255),
    especie VARCHAR(255) NOT NULL,
    raca VARCHAR(255) NOT NULL,
    sexo VARCHAR(255) NOT NULL,
    data_nascimento DATE NOT NULL,
    cpf VARCHAR(11) NOT NULL,
    FOREIGN KEY (cpf) REFERENCES clientes(cpf)
);

-- Inserção de dados na tabela pet
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

-- Criação da tabela produtos
CREATE TABLE produtos (
    cod_produto INT PRIMARY KEY,
    nome_produto VARCHAR(255) NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    marca VARCHAR(255) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    quantidade_em_estoque INT NOT NULL DEFAULT 0
);

-- Inserção de dados na tabela produtos
INSERT INTO produtos (cod_produto, nome_produto, descricao, marca, preco, quantidade_em_estoque) VALUES
(1, 'Ração para Cães', 'Ração premium para cães adultos de porte médio', 'Pedigree', 79.90, 100),
(2, 'Ração para Gatos', 'Ração especial para gatos castrados de todas as idades', 'Royal Canin', 59.90, 150),
(3, 'Shampoo para Cães', 'Shampoo hipoalergênico para cães de pelagem clara', 'Pet Society', 29.90, 200),
(4, 'Condicionador para Gatos', 'Condicionador suave para gatos de todas as raças', 'Vetnil', 19.90, 250),
(5, 'Coleira Antipulgas', 'Coleira repelente de pulgas e carrapatos para cães de médio porte', 'Bayer', 39.90, 300),
(6, 'Brinquedo de Pelúcia', 'Brinquedo de pelúcia para gatos com catnip', 'Kong', 14.90, 350),
(7, 'Comedouro Automático', 'Comedouro automático para cães e gatos com capacidade para 2 kg de ração', 'PetSafe', 99.90, 400),
(8, 'Caixa de Transporte', 'Caixa de transporte resistente para cães de pequeno porte', 'TruFit', 89.90, 450),
(9, 'Arranhador para Gatos', 'Arranhador vertical com poste de sisal e plataforma superior', 'Ferplast', 69.90, 500),
(10, 'Coleira com Plaquinha de Identificação', 'Coleira com plaquinha de identificação gravada com nome e telefone', 'American Pet', 49.90, 550);

-- Criação da tabela servicos
CREATE TABLE servicos (
    cod_servico INT PRIMARY KEY,
    nome_servico VARCHAR(255) NOT NULL,
    tipo VARCHAR(255) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    cpf VARCHAR(11) NOT NULL,
    FOREIGN KEY (cpf) REFERENCES clientes(cpf)
);

-- Inserção de dados na tabela servicos
INSERT INTO servicos (cod_servico, nome_servico, tipo, preco, cpf) VALUES
(1, 'Banho', 'Higiene', 50.00, '11122233344'),
(2, 'Tosa', 'Higiene', 40.00, '22233344455'),
(3, 'Consulta Veterinária', 'Saúde', 100.00, '33344455566'),
(4, 'Vacinação', 'Saúde', 80.00, '44455566677'),
(5, 'Adestramento', 'Comportamento', 150.00, '55566677788'),
(6, 'Hospedagem', 'Hospedagem', 200.00, '66677788899'),
(7, 'Corte de Unhas', 'Higiene', 20.00, '77788899900'),
(8, 'Limpeza de Ouvidos', 'Higiene', 30.00, '88899900011'),
(9, 'Hidratação de Pelagem', 'Estética', 70.00, '99900011122'),
(10, 'Massagem Relaxante', 'Bem-Estar', 60.00, '12345678901');

-- Criação da tabela vendas
CREATE TABLE vendas (
    id_venda INT PRIMARY KEY,
    data_venda DATE NOT NULL,
    cod_produto INT,
    cod_servico INT,
    cpf VARCHAR(11) NOT NULL,
    quantidade INT NOT NULL DEFAULT 1,
    FOREIGN KEY (cod_produto) REFERENCES produtos(cod_produto),
    FOREIGN KEY (cod_servico) REFERENCES servicos(cod_servico),
    FOREIGN KEY (cpf) REFERENCES clientes(cpf)
);

-- Inserção de dados na tabela vendas
INSERT INTO vendas (id_venda, data_venda, cod_produto, cod_servico, cpf, quantidade) VALUES
(1, '2023-01-01', 1, NULL, '11122233344', 1),
(2, '2023-01-02', 2, NULL, '22233344455', 2),
(3, '2023-01-03', 3, NULL, '33344455566', 1),
(4, '2023-01-04', 4, NULL, '44455566677', 1),
(5, '2023-01-05', 5, NULL, '55566677788', 1),
(6, '2023-01-06', 6, NULL, '66677788899', 1),
(7, '2023-01-07', 7, NULL, '77788899900', 1),
(8, '2023-01-08', 8, NULL, '88899900011', 3),
(9, '2023-01-09', 9, NULL, '99900011122', 1),
(10, '2023-01-10', 10, NULL, '12345678901', 2),
(11, '2023-01-11', 1, NULL, '23456789012', 1),
(12, '2023-01-12', 2, NULL, '34567890123', 1),
(13, '2023-01-13', 3, NULL, '45678901234', 1),
(14, '2023-01-14', 4, NULL, '56789012345', 1),
(15, '2023-01-15', 5, NULL, '67890123456', 1);

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


--Functions

--1
DELIMITER //

-- Função: Calcula o total das vendas para um mês e ano específicos.
CREATE FUNCTION calcular_total_vendas_mes(ano_mes VARCHAR(7))
RETURNS DECIMAL(10,2)
BEGIN
    DECLARE total DECIMAL(10,2);
    
    -- Calcula a soma dos valores das vendas no mês e ano especificados
    SELECT COALESCE(SUM(valor_total), 0)
    INTO total
    FROM vendas
    WHERE DATE_FORMAT(data_venda, '%Y-%m') = ano_mes;
    
    RETURN total;
END //

DELIMITER ;

SELECT calcular_total_vendas_mes('2024-07') AS total_vendas;


--2
DELIMITER //

-- Função: Retorna uma lista de serviços disponíveis concatenada em uma string.
CREATE FUNCTION listar_servicos_disponiveis()
RETURNS TEXT
BEGIN
    DECLARE lista_servicos TEXT DEFAULT '';
    
    -- Concatena todos os nomes de serviços em uma única string
    SELECT GROUP_CONCAT(nome_servico SEPARATOR ', ')
    INTO lista_servicos
    FROM servicos;
    
    RETURN lista_servicos;
END //

DELIMITER ;
SELECT listar_servicos_disponiveis() AS lista_servicos;


--3
DELIMITER //

-- Função: Retorna o cliente que mais gastou em agosto de 2023.
CREATE FUNCTION cliente_mais_gastou_agosto()
RETURNS VARCHAR(255)
BEGIN
    DECLARE cliente_info VARCHAR(255);
    
    -- Seleciona o cliente com maior gasto em agosto de 2023
    SELECT CONCAT(c.nome, ' - CPF: ', c.cpf) INTO cliente_info
    FROM (
        SELECT cpf, SUM(valor_total) AS total_gasto
        FROM vendas
        WHERE MONTH(data_venda) = 8 AND YEAR(data_venda) = 2023
        GROUP BY cpf
        ORDER BY total_gasto DESC
        LIMIT 1
    ) AS max_gasto
    JOIN clientes c ON max_gasto.cpf = c.cpf;
    
    RETURN cliente_info;
END //

DELIMITER ;
SELECT cliente_mais_gastou_agosto() AS cliente_mais_gastou;



--4
DELIMITER //

-- Função: Retorna o total de vendas por ano em uma string formatada.
CREATE FUNCTION vendas_por_ano()
RETURNS VARCHAR(255)
BEGIN
    DECLARE resultado VARCHAR(255);
    
    -- Concatena o total de vendas por ano em uma string
    SELECT GROUP_CONCAT(concat(ano, ': ', total_vendas) SEPARATOR '; ') INTO resultado
    FROM (
        SELECT YEAR(data_venda) AS ano, SUM(valor_total) AS total_vendas
        FROM vendas
        GROUP BY YEAR(data_venda)
        ORDER BY ano
    ) AS vendas_por_ano;
    
    RETURN resultado;
END //

DELIMITER ;
SELECT vendas_por_ano() AS total_vendas_por_ano;


--6
DELIMITER //

-- Função: Verifica a quantidade em estoque de um produto específico.
CREATE FUNCTION verificar_estoque(cod_prod INT) 
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE quantidade INT;

    -- Seleciona a quantidade do produto da tabela produtos
    SELECT quantidade
    INTO quantidade
    FROM produtos
    WHERE cod_produto = cod_prod;

    -- Se a quantidade for nula (produto não encontrado), retorna 0
    IF quantidade IS NULL THEN
        SET quantidade = 0;
    END IF;

    RETURN quantidade;
END //

DELIMITER ;
SELECT verificar_estoque(123) AS quantidade_em_estoque;



--Procedures

--1
DELIMITER //

-- Procedimento: Lista todos os gatos e seus respectivos donos.
CREATE PROCEDURE ListarGatosComClientes()
BEGIN
    SELECT p.nome AS nome_pet, p.especie, p.raca, p.sexo, p.data_nascimento, c.nome AS nome_cliente
    FROM pet p
    JOIN clientes c ON p.cpf = c.cpf
    WHERE p.especie = 'Gato';
END //

DELIMITER ;

CALL ListarGatosComClientes();


--2
DELIMITER //

-- Procedimento: Lista todos os cachorros e seus respectivos donos.
CREATE PROCEDURE ListarCachorrosComClientes()
BEGIN
    SELECT p.nome AS nome_pet, p.especie, p.raca, p.sexo, p.data_nascimento, c.nome AS nome_cliente
    FROM pet p
    JOIN clientes c ON p.cpf = c.cpf
    WHERE p.especie = 'Cachorro';
END //

DELIMITER ;
CALL ListarCachorrosComClientes();


--3
DELIMITER //

-- Procedimento: Lista todos os produtos com suas descrições, marcas, preços e quantidades em estoque.
CREATE PROCEDURE QuantidadeProdutos()
BEGIN
    SELECT 
        nome_produto AS 'Nome do Produto',
        descricao AS 'Descrição',
        marca AS 'Marca',
        preco AS 'Preço',
        quantidade_em_estoque AS 'Quantidade em Estoque'
    FROM produtos
    ORDER BY quantidade_em_estoque DESC;
END //

DELIMITER ;
CALL QuantidadeProdutos();


--4
DELIMITER //

-- Procedimento: Fornece um resumo das vendas por produto e por serviço.
CREATE PROCEDURE ResumoVendas()
BEGIN
    -- Resumo das vendas por produto
    SELECT 
        p.nome_produto AS 'Nome do Produto',
        SUM(v.quantidade) AS 'Quantidade Total Vendida',
        SUM(v.quantidade * p.preco) AS 'Total de Vendas (R$)',
        MAX(v.data_venda) AS 'Data da Última Venda'
    FROM vendas v
    JOIN produtos p ON v.cod_produto = p.cod_produto
    GROUP BY p.nome_produto
    ORDER BY SUM(v.quantidade) DESC;
END //
DELIMITER ;

CALL ResumoVendas();


--5
DELIMITER //

-- Procedimento: Gera um relatório do estoque de produtos, com classificação de estoque.
CREATE PROCEDURE RelatorioEstoqueProdutos()
BEGIN
    -- Relatório de produtos com base no estoque
    SELECT 
        nome_produto AS 'Nome do Produto',
        quantidade_em_estoque AS 'Quantidade em Estoque',
        preco AS 'Preço Unitário (R$)',
        quantidade_em_estoque * preco AS 'Valor Total em Estoque (R$)',
        CASE
            WHEN quantidade_em_estoque <= 10 THEN 'Baixo'
            WHEN quantidade_em_estoque BETWEEN 11 AND 50 THEN 'Médio'
            ELSE 'Alto'
        END AS 'Classificação de Estoque'
    FROM produtos
    ORDER BY 
        CASE
            WHEN quantidade_em_estoque <= 10 THEN 1
            WHEN quantidade_em_estoque BETWEEN 11 AND 50 THEN 2
            ELSE 3
        END, 
        quantidade_em_estoque DESC;
END //

DELIMITER ;
CALL RelatorioEstoqueProdutos();


