1. Utilizando o banco de dados criado na lista 1, faça o seguinte:
a. Adicione, na tabela de produtos, um campo Estoque, com o
valor default de 1. Crie uma nova tabela chamada Log Vendas,
com o id do produto e o valor total, cujo valor default é 0.
b. Crie um procedimento que atualize o estoque de todos os
produtos (para que não fique apenas 1). Se o produto custou
10 reais ou menos por unidade, seu estoque se torna 20. Se
ele custou entre 10 e 20 reais (inclusive), seu estoque se torna
10. Senão, seu estoque se torna 5. Rode esse procedimento.
c. Crie um procedimento que popula a tabela de Log Vendas
com os produtos vendidos e seus respectivos valores totais.
Rode esse procedimento.
d. Crie uma trigger que atualize o valor total vendido do produto
na tabela Log Vendas toda vez que uma nova nota fiscal for
adicionada.
e. Crie uma trigger que toda vez que uma nova nota fiscal é
inserida, cheque se os produtos possuem estoque. Se não
possuírem, a inserção é cancelada.
f. Crie uma trigger que limite a quantidade de desconto
concedido em 30%.
g. Crie uma trigger que limite a quantidade de diferentes
produtos em uma venda em 3 produtos.
h. Crie uma trigger que atualize o estoque de produtos
disponíveis quando uma nota fiscal de venda é inserida.
i. Adicione um campo de valor na tabela de Produtos com valor
default 0. Então, crie uma trigger que atualize esse valor toda
vez que uma nova nota fiscal for inserida com esse produto,
caso o valor do produto na nota seja diferente do valor do
produto.



1-
ALTER TABLE Produtos ADD COLUMN Estoque INT DEFAULT 1;


CREATE TABLE Log_Vendas (
    id SERIAL PRIMARY KEY,
    produto_id INT,
    valor_total DECIMAL(10, 2) DEFAULT 0,
    FOREIGN KEY (produto_id) REFERENCES Produtos(id)
);


2-
DELIMITER //
CREATE PROCEDURE Atualiza_Estoque()
BEGIN
    UPDATE Produtos
    SET Estoque = CASE
        WHEN preco <= 10 THEN 20
        WHEN preco > 10 AND preco <= 20 THEN 10
        ELSE 5
    END;
END //
DELIMITER ;




CALL Atualiza_Estoque();


3-
DELIMITER //
CREATE PROCEDURE Popula_Log_Vendas()
BEGIN
    INSERT INTO Log_Vendas (produto_id, valor_total)
    SELECT id, 0
    FROM Produtos;
END //
DELIMITER ;


CALL Popula_Log_Vendas();


4-
DELIMITER //
CREATE TRIGGER Atualiza_Log_Vendas AFTER INSERT ON Notas_Fiscais
FOR EACH ROW
BEGIN
    UPDATE Log_Vendas
    SET valor_total = valor_total + NEW.quantidade * NEW.preco_unitario
    WHERE produto_id = NEW.produto_id;
END //
DELIMITER ;


5-
DELIMITER //
CREATE TRIGGER Verifica_Estoque BEFORE INSERT ON Notas_Fiscais
FOR EACH ROW
BEGIN
    DECLARE estoque_atual INT;
    SELECT Estoque INTO estoque_atual FROM Produtos WHERE id = NEW.produto_id;


    IF estoque_atual < NEW.quantidade THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Estoque insuficiente';
    END IF;
END //
DELIMITER ;


6-
DELIMITER //
CREATE TRIGGER Limita_Desconto BEFORE INSERT ON Notas_Fiscais
FOR EACH ROW
BEGIN
    IF NEW.desconto > 0.30 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Desconto superior a 30% não permitido';
    END IF;
END //
DELIMITER ;


7-
DELIMITER //
CREATE TRIGGER Limita_Produtos_Venda BEFORE INSERT ON Notas_Fiscais
FOR EACH ROW
BEGIN
    DECLARE contador INT;
    SELECT COUNT(DISTINCT produto_id) INTO contador FROM Notas_Fiscais WHERE venda_id = NEW.venda_id;


    IF contador >= 3 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Não é permitido vender mais de 3 produtos diferentes em uma venda';
    END IF;
END //
DELIMITER ;


8-
DELIMITER //
CREATE TRIGGER Atualiza_Estoque_Venda AFTER INSERT ON Notas_Fiscais
FOR EACH ROW
BEGIN
    UPDATE Produtos
    SET Estoque = Estoque - NEW.quantidade
    WHERE id = NEW.produto_id;
END //
DELIMITER ;




9-
ALTER TABLE Produtos ADD COLUMN valor DECIMAL(10, 2) DEFAULT 0;


DELIMITER //
CREATE TRIGGER Atualiza_Valor_Produto AFTER INSERT ON Notas_Fiscais
FOR EACH ROW
BEGIN
    DECLARE valor_atual DECIMAL(10, 2);
    SELECT valor INTO valor_atual FROM Produtos WHERE id = NEW.produto_id;


    IF valor_atual <> NEW.preco_unitario THEN
        UPDATE Produtos
        SET valor = NEW.preco_unitario
        WHERE id = NEW.produto_id;
    END IF;
END //
DELIMITER ;
