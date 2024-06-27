-- Active: 1705524060714@@127.0.0.1@3306@db_lanchonete
USE db_lanchonete;

CREATE TABLE Cliente(
    id_Cliente INT PRIMARY KEY NOT NULL AUTO_INCREMENT
    nome_Cliente VARCHAR(120) NOT NULL,
    email_Cliente VARCHAR(120) UNIQUE,
    telefone_Cliente VARCHAR(20)
);

CREATE TABLE Pedido(
    id_Pedido INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    dt_PEDIDO DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    valorTotal_Pedido DECIMAL(10,2) NOT NULL, 
    fk_Cliente_id_Cliente INT NOT NULL, CONSTRAINT FK_Cliente FOREIGN KEY (fk_Cliente_id_Cliente) REFERENCES Cliente (id_Cliente) ON DELETE CASCADE
);

CREATE TABLE Produto(
    id_Produto INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome_Produto VARCHAR(120) NOT NULL,
    preco_Produto DECIMAL(10,2));

CREATE TABLE ItensPedido(
    id_ItensPedido INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    quantidade_ItensPedido INT NOT NULL, 
    fk_Produto_id_Produto INT NOT NULL, 
    fk_Pedido_id_Pedido INT NOT NULL,
    CONSTRAINT FK_Produto FOREIGN KEY (fk_Produto_id_Produto) REFERENCES Produto (id_Produto) ON DELETE CASCADE,
    CONSTRAINT FK_Pedido FOREIGN KEY (fk_Pedido_id_Pedido) REFERENCES Pedido (id_Pedido) ON DELETE CASCADE);

CREATE TABLE Contato(
    id_ItensPedido INT PRIMARY KEY NOT NULL,
    numero_Contato VARCHAR(15) NOT NULL UNIQUE,
    tipo_Contato VARCHAR(15) NOT NULL
);

-- INSERT

INSERT INTO Cliente(`nome_Cliente`, `email_Cliente`, `telefone_Cliente`) VALUES
("Nycolas Ramos", "nycsenju@gmail.com", "61 998085330"),
("Atylas Ramos", "atylassenju@gmail.com", "61 998085354"),
("Eryck", "erycksenju@gmail.com", "61 998085776"),
("Davi Ramos", "davisenju@gmail.com", "61 998085764"),
("Rafael Ramos", "rafaelsenju@gmail.com", "61 976563409");
SELECT * FROM cliente;


INSERT INTO Produto(`nome_Produto`, `preco_Produto`) VALUES ("coxinha", 12.50), ("kibe", 7.50), ("pastel", 8.00), ("x-burger", 15.50), ("x-salada", 20.00), ("coca-cola 200ml", 4.00);
SELECT * FROM produto;

INSERT INTO Pedido(`valorTotal_Pedido`, `fk_Cliente_id_Cliente`) VALUES (12.40, 1), (17.40, 4), (34.40, 3), (25.90, 1), (54.50, 2), (35.40, 1), (15.40, 2),(67.10, 5);
SELECT * FROM pedido;
DESC Pedido;

INSERT INTO ItensPedido(`quantidade_ItensPedido`, `fk_Produto_id_Produto`, `fk_Pedido_id_Pedido`) VALUES (2, 6, 7), (1, 3, 5), (3, 5, 8), (2, 2, 5), (4, 1, 3), (3, 5, 1), (2, 4, 2);
SELECT * FROM itenspedido;

-- Condicoes
SELECT * FROM produto WHERE `preco_Produto` > 10;
SELECT * FROM pedido WHERE `valorTotal_Pedido` > 40;
