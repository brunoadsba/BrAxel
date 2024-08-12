-- Criando o banco de dados com o nome real (por exemplo, wordpress_db)
CREATE DATABASE IF NOT EXISTS wordpress_db;

-- Usando o banco de dados recém-criado
USE wordpress_db;

-- Criando a tabela de produtos com ID, nome, descrição, estoque e data de criação
CREATE TABLE IF NOT EXISTS Produtos (
    id INT AUTO_INCREMENT PRIMARY KEY, -- ID único para cada produto
    nome VARCHAR(100) NOT NULL, -- Nome do produto
    descricao TEXT, -- Descrição do produto
    estoque INT DEFAULT 0, -- Quantidade em estoque do produto
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Data e hora de criação do registro
);

-- Criando a tabela de preços com ID, referência ao produto, preço e data de validade
CREATE TABLE IF NOT EXISTS Precos (
    id INT AUTO_INCREMENT PRIMARY KEY, -- ID único para cada preço
    produto_id INT, -- Referência ao produto (chave estrangeira)
    preco DECIMAL(10, 2) NOT NULL, -- Preço do produto
    data_validade DATE, -- Data de validade do preço
    FOREIGN KEY (produto_id) REFERENCES Produtos(id) -- Definindo a chave estrangeira que referencia a tabela de Produtos
);

-- Inserindo registros na tabela de produtos
INSERT INTO Produtos (nome, descricao, estoque) VALUES
('Cadeira', 'Cadeira ergonômica para escritório', 20), -- Produto: Cadeira
('Tela Gamer Curva de 48"', 'Tela gamer curva 48 polegadas', 10), -- Produto: Tela Gamer Curva de 48"
('Laptop', 'Laptop com 16GB de RAM e 512GB SSD', 15), -- Produto: Laptop
('Placa de Vídeo', 'Placa de vídeo NVIDIA RTX 3060', 5), -- Produto: Placa de Vídeo
('Playstation 5', 'Console Playstation 5', 8), -- Produto: Playstation 5
('iPhone 15', 'iPhone 15 256GB', 12), -- Produto: iPhone 15
('Pendrive', 'Pendrive 64GB USB 3.0', 30); -- Produto: Pendrive

-- Inserindo registros na tabela de preços
INSERT INTO Precos (produto_id, preco, data_validade) VALUES
(1, 499.99, '2024-12-31'), -- Preço para o produto Cadeira
(2, 1199.99, '2024-12-31'), -- Preço para o produto Tela Gamer Curva de 48"
(3, 2999.99, '2024-12-31'), -- Preço para o produto Laptop
(4, 1999.99, '2024-12-31'), -- Preço para o produto Placa de Vídeo
(5, 3999.99, '2024-12-31'), -- Preço para o produto Playstation 5
(6, 4999.99, '2024-12-31'), -- Preço para o produto iPhone 15
(7, 29.99, '2024-12-31'); -- Preço para o produto Pendrive

-- Criando a tabela de clientes com ID, nome, e-mail, endereço e data de registro
CREATE TABLE IF NOT EXISTS Clientes (
    id INT AUTO_INCREMENT PRIMARY KEY, -- ID único para cada cliente
    nome VARCHAR(100) NOT NULL, -- Nome do cliente
    email VARCHAR(100) NOT NULL UNIQUE, -- E-mail do cliente, deve ser único
    endereco TEXT, -- Endereço do cliente
    data_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Data e hora de registro do cliente
);

-- Criando a tabela de pedidos com ID, referência ao cliente, data do pedido, total e status do pedido
CREATE TABLE IF NOT EXISTS Pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY, -- ID único para cada pedido
    cliente_id INT, -- Referência ao cliente (chave estrangeira)
    data_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Data e hora do pedido
    total DECIMAL(10, 2), -- Valor total do pedido
    status VARCHAR(20) DEFAULT 'Pendente', -- Status do pedido (Pendente por padrão)
    FOREIGN KEY (cliente_id) REFERENCES Clientes(id) -- Definindo a chave estrangeira que referencia a tabela de Clientes
);

-- Criando a tabela de itens do pedido com ID, referência ao pedido, referência ao produto, quantidade e preço unitário
CREATE TABLE IF NOT EXISTS ItensPedido (
    id INT AUTO_INCREMENT PRIMARY KEY, -- ID único para cada item do pedido
    pedido_id INT, -- Referência ao pedido (chave estrangeira)
    produto_id INT, -- Referência ao produto (chave estrangeira)
    quantidade INT NOT NULL, -- Quantidade do produto no pedido
    preco_unitario DECIMAL(10, 2) NOT NULL, -- Preço unitário do produto no momento do pedido
    FOREIGN KEY (pedido_id) REFERENCES Pedidos(id), -- Definindo a chave estrangeira que referencia a tabela de Pedidos
    FOREIGN KEY (produto_id) REFERENCES Produtos(id) -- Definindo a chave estrangeira que referencia a tabela de Produtos
);

-- Criando a tabela de pagamentos com ID, referência ao pedido, valor, método de pagamento e data de pagamento
CREATE TABLE IF NOT EXISTS Pagamentos (
    id INT AUTO_INCREMENT PRIMARY KEY, -- ID único para cada pagamento
    pedido_id INT, -- Referência ao pedido (chave estrangeira)
    valor DECIMAL(10, 2) NOT NULL, -- Valor do pagamento
    metodo_pagamento VARCHAR(50), -- Método de pagamento utilizado
    data_pagamento TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Data e hora do pagamento
    FOREIGN KEY (pedido_id) REFERENCES Pedidos(id) -- Definindo a chave estrangeira que referencia a tabela de Pedidos
);


-- Cria um índice na coluna 'nome' da tabela 'Produtos'
CREATE INDEX idx_nome_produto ON Produtos(nome);

-- Adiciona uma restrição para garantir que o estoque nunca seja negativo
ALTER TABLE Produtos ADD CONSTRAINT chk_estoque_produto CHECK (estoque >= 0);

-- Cria uma tabela de logs para registrar atividades do sistema
CREATE TABLE IF NOT EXISTS Logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    atividade VARCHAR(255),
    usuario VARCHAR(100),
    data_atividade TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);



-- Listar todas as tabelas no banco de dados
SHOW TABLES;

-- Ver a estrutura das tabelas
DESCRIBE Produtos;
DESCRIBE Precos;
DESCRIBE Clientes;
DESCRIBE Pedidos;
DESCRIBE ItensPedido;
DESCRIBE Pagamentos;
DESCRIBE Logs;

-- Ver os índices nas tabelas
SHOW INDEX FROM Produtos;
SHOW INDEX FROM Precos;
SHOW INDEX FROM Clientes;
SHOW INDEX FROM Pedidos;
SHOW INDEX FROM ItensPedido;
SHOW INDEX FROM Pagamentos;
SHOW INDEX FROM Logs;

-- Visualizar todos os dados inseridos nas tabelas
SELECT * FROM Produtos;
SELECT * FROM Precos;
SELECT * FROM Clientes;
SELECT * FROM Pedidos;
SELECT * FROM ItensPedido;
SELECT * FROM Pagamentos;
SELECT * FROM Logs;


