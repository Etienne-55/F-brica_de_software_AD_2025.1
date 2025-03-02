DROP DATABASE IF EXISTS LojaDepartamentos;
CREATE DATABASE LojaDepartamentos;
USE LojaDepartamentos;

CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    telefone VARCHAR(15),
    data_cadastro DATE NOT NULL,
    endereco VARCHAR(200)
);

CREATE TABLE Categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    descricao TEXT,
    departamento VARCHAR(50)
);

CREATE TABLE Produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    estoque INT NOT NULL,
    id_categoria INT,
    data_cadastro DATE,
    marca VARCHAR(50),
    FOREIGN KEY (id_categoria) REFERENCES Categorias(id_categoria)
);

CREATE TABLE Funcionarios (
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50),
    salario DECIMAL(10, 2),
    data_contratacao DATE
);

CREATE TABLE Pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_funcionario INT,
    data_pedido DATE NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    status VARCHAR(20) DEFAULT 'Pendente',
    forma_pagamento VARCHAR(50),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_funcionario) REFERENCES Funcionarios(id_funcionario)
);

CREATE TABLE ItensPedido (
    id_item INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT,
    id_produto INT,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10, 2) NOT NULL,
    subtotal DECIMAL(10, 2) GENERATED ALWAYS AS (quantidade * preco_unitario) STORED,
    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido),
    FOREIGN KEY (id_produto) REFERENCES Produtos(id_produto)
);

CREATE TABLE Fornecedores (
    id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    contato VARCHAR(100),
    telefone VARCHAR(15),
    endereco VARCHAR(200)
);

CREATE TABLE ProdutosFornecedores (
    id_produto INT,
    id_fornecedor INT,
    preco_compra DECIMAL(10, 2) NOT NULL,
    data_ultima_compra DATE,
    PRIMARY KEY (id_produto, id_fornecedor),
    FOREIGN KEY (id_produto) REFERENCES Produtos(id_produto),
    FOREIGN KEY (id_fornecedor) REFERENCES Fornecedores(id_fornecedor)
);


INSERT INTO Clientes (nome, email, telefone, data_cadastro, endereco) VALUES
('João Silva', 'joao.silva@email.com', '11987654321', '2022-01-15', 'Rua das Flores, 123'),
('Maria Oliveira', 'maria.oliveira@email.com', '21987654321', '2022-02-20', 'Av. Central, 456'),
('Carlos Santos', 'carlos.santos@email.com', '31987654321', '2022-03-05', 'Praça da Liberdade, 789'),
('Ana Pereira', 'ana.pereira@email.com', '41987654321', '2022-04-10', 'Rua dos Pinheiros, 1011'),
('Pedro Souza', 'pedro.souza@email.com', '51987654321', '2022-05-15', 'Av. Paulista, 1213'),
('Julia Lima', 'julia.lima@email.com', '61987654321', '2022-06-20', 'Rua Augusta, 1415'),
('Marcos Rocha', 'marcos.rocha@email.com', '71987654321', '2022-07-25', 'Av. Brasil, 1617'),
('Fernanda Costa', 'fernanda.costa@email.com', '81987654321', '2022-08-30', 'Rua das Palmeiras, 1819'),
('Ricardo Alves', 'ricardo.alves@email.com', '91987654321', '2022-09-05', 'Praça da Sé, 2021'),
('Camila Dias', 'camila.dias@email.com', '12987654321', '2022-10-10', 'Av. Rebouças, 2223');

INSERT INTO Categorias (nome, descricao, departamento) VALUES
('Eletrônicos', 'Produtos eletrônicos em geral', 'Tecnologia'),
('Roupas Masculinas', 'Roupas para homens', 'Moda'),
('Roupas Femininas', 'Roupas para mulheres', 'Moda'),
('Calçados', 'Sapatos, tênis e sandálias', 'Moda'),
('Móveis', 'Móveis para casa e escritório', 'Casa'),
('Eletrodomésticos', 'Aparelhos para uso doméstico', 'Casa'),
('Livros', 'Livros de todos os gêneros', 'Cultura'),
('Brinquedos', 'Brinquedos para todas as idades', 'Infantil'),
('Esportes', 'Artigos esportivos', 'Lazer'),
('Perfumaria', 'Perfumes e cosméticos', 'Beleza');

INSERT INTO Produtos (nome, preco, estoque, id_categoria, data_cadastro, marca) VALUES
('Smartphone Galaxy S23', 4999.00, 50, 1, '2023-01-15', 'Samsung'),
('Notebook Pro 16"', 8500.00, 30, 1, '2023-02-10', 'Apple'),
('Camiseta Básica', 89.90, 200, 2, '2023-01-20', 'Hering'),
('Calça Jeans', 199.90, 150, 2, '2023-01-25', 'Levis'),
('Vestido Longo', 259.90, 100, 3, '2023-02-05', 'Zara'),
('Blusa de Seda', 199.90, 80, 3, '2023-02-15', 'Renner'),
('Tênis Esportivo', 399.90, 120, 4, '2023-03-01', 'Nike'),
('Sandália de Couro', 159.90, 90, 4, '2023-03-10', 'Arezzo'),
('Sofá 3 Lugares', 2499.00, 15, 5, '2023-04-05', 'Tok&Stok'),
('Mesa de Jantar', 1899.00, 10, 5, '2023-04-15', 'MadeiraMadeira');

INSERT INTO Funcionarios (nome, cargo, salario, data_contratacao) VALUES
('Roberto Almeida', 'Gerente', 5000.00, '2020-01-10'),
('Sandra Ferreira', 'Vendedor', 2500.00, '2021-03-15'),
('Lucas Mendes', 'Vendedor', 2500.00, '2021-06-20'),
('Patricia Gomes', 'Caixa', 2200.00, '2022-01-05'),
('Eduardo Martins', 'Estoquista', 2000.00, '2022-02-10'),
('Vanessa Oliveira', 'Atendente', 1800.00, '2022-03-15'),
('Rodrigo Santos', 'Segurança', 2100.00, '2022-04-20'),
('Luciana Costa', 'RH', 3500.00, '2021-02-25'),
('Felipe Dias', 'Marketing', 3800.00, '2021-05-15'),
('Mariana Silva', 'Auxiliar Administrativo', 2300.00, '2022-07-10');

INSERT INTO Fornecedores (nome, contato, telefone, endereco) VALUES
('TechSupply', 'Carlos Maia', '11988776655', 'Rua da Tecnologia, 100'),
('ModaTotal', 'Silvia Prado', '21988776655', 'Av. da Moda, 200'),
('MoveisElegantes', 'Roberto Torres', '31988776655', 'Rua dos Móveis, 300'),
('EletroMax', 'Amanda Reis', '41988776655', 'Av. dos Eletrodomésticos, 400'),
('LivrariaUniversal', 'José Campos', '51988776655', 'Praça dos Livros, 500'),
('BrinquedosFelizes', 'Lúcia Melo', '61988776655', 'Rua da Diversão, 600'),
('EsporteTotal', 'Ricardo Gomes', '71988776655', 'Av. dos Esportes, 700'),
('BelezaPlena', 'Carolina Lima', '81988776655', 'Praça da Beleza, 800'),
('InforStore', 'Daniel Rocha', '91988776655', 'Rua da Informática, 900'),
('ModaImport', 'Fernanda Torres', '12988776655', 'Av. das Importações, 1000');

INSERT INTO ProdutosFornecedores (id_produto, id_fornecedor, preco_compra, data_ultima_compra) VALUES
(1, 1, 3500.00, '2023-01-05'),
(2, 1, 6000.00, '2023-01-25'),
(3, 2, 45.00, '2023-01-10'),
(4, 2, 100.00, '2023-01-15'),
(5, 2, 130.00, '2023-01-25'),
(6, 2, 100.00, '2023-02-05'),
(7, 7, 250.00, '2023-02-15'),
(8, 2, 80.00, '2023-02-25'),
(9, 3, 1800.00, '2023-03-05'),
(10, 3, 1200.00, '2023-03-15');

INSERT INTO Pedidos (id_cliente, id_funcionario, data_pedido, total, status, forma_pagamento) VALUES
(1, 2, '2023-05-10', 4999.00, 'Concluído', 'Cartão de Crédito'),
(2, 3, '2023-05-15', 289.80, 'Concluído', 'Pix'),
(3, 2, '2023-05-20', 8500.00, 'Concluído', 'Cartão de Crédito'),
(4, 3, '2023-05-25', 459.80, 'Concluído', 'Boleto'),
(5, 2, '2023-06-01', 4158.90, 'Processando', 'Cartão de Crédito'),
(6, 3, '2023-06-05', 199.90, 'Processando', 'Pix'),
(7, 2, '2023-06-10', 2499.00, 'Pendente', 'Boleto'),
(8, 3, '2023-06-15', 559.80, 'Pendente', 'Cartão de Débito'),
(9, 2, '2023-06-20', 8500.00, 'Cancelado', 'Cartão de Crédito'),
(10, 3, '2023-06-25', 399.90, 'Concluído', 'Pix');

INSERT INTO ItensPedido (id_pedido, id_produto, quantidade, preco_unitario) VALUES
(1, 1, 1, 4999.00),
(2, 3, 2, 89.90),
(2, 4, 1, 109.90),
(3, 2, 1, 8500.00),
(4, 3, 1, 89.90),
(4, 6, 1, 199.90),
(4, 8, 1, 159.90),
(5, 1, 1, 4999.00),
(5, 7, 1, 399.90),
(5, 8, 1, 159.90),
(6, 6, 1, 199.90),
(7, 9, 1, 2499.00),
(8, 7, 1, 399.90),
(8, 8, 1, 159.90),
(9, 2, 1, 8500.00),
(10, 7, 1, 399.90);

SELECT c.nome AS Cliente, COUNT(p.id_pedido) AS Total_Pedidos, 
       SUM(p.total) AS Valor_Total_Gasto,
       MAX(p.data_pedido) AS Data_Ultimo_Pedido
FROM Clientes c
LEFT JOIN Pedidos p ON c.id_cliente = p.id_cliente
GROUP BY c.nome
ORDER BY Valor_Total_Gasto DESC;

SELECT p.nome AS Produto, c.nome AS Categoria,
       SUM(ip.quantidade) AS Quantidade_Vendida,
       SUM(ip.subtotal) AS Faturamento_Total
FROM Produtos p
JOIN Categorias c ON p.id_categoria = c.id_categoria
LEFT JOIN ItensPedido ip ON p.id_produto = ip.id_produto
GROUP BY p.nome, c.nome
ORDER BY Faturamento_Total DESC;

SELECT c.nome AS Categoria, c.departamento,
       AVG(p.preco) AS Preco_Medio,
       SUM(p.estoque) AS Estoque_Total,
       COUNT(p.id_produto) AS Quantidade_Produtos
FROM Categorias c
LEFT JOIN Produtos p ON c.id_categoria = p.id_categoria
GROUP BY c.nome, c.departamento
ORDER BY Estoque_Total DESC;

SELECT status, COUNT(id_pedido) AS Quantidade_Pedidos,
       SUM(total) AS Valor_Total,
       MIN(data_pedido) AS Data_Primeiro_Pedido,
       MAX(data_pedido) AS Data_Ultimo_Pedido
FROM Pedidos
GROUP BY status
ORDER BY Quantidade_Pedidos DESC;

SELECT f.nome AS Funcionario, f.cargo,
       COUNT(p.id_pedido) AS Total_Pedidos,
       SUM(p.total) AS Total_Vendas
FROM Funcionarios f
LEFT JOIN Pedidos p ON f.id_funcionario = p.id_funcionario
GROUP BY f.nome, f.cargo
ORDER BY Total_Vendas DESC;

SELECT p.id_pedido, p.data_pedido, p.status, p.forma_pagamento,
       c.nome AS Cliente, c.email,
       f.nome AS Funcionario, f.cargo,
       pr.nome AS Produto, pr.marca,
       cat.nome AS Categoria, cat.departamento,
       ip.quantidade, ip.preco_unitario, ip.subtotal
FROM Pedidos p
JOIN Clientes c ON p.id_cliente = c.id_cliente
JOIN Funcionarios f ON p.id_funcionario = f.id_funcionario
JOIN ItensPedido ip ON p.id_pedido = ip.id_pedido
JOIN Produtos pr ON ip.id_produto = pr.id_produto
JOIN Categorias cat ON pr.id_categoria = cat.id_categoria
ORDER BY p.data_pedido DESC;

SELECT p.nome AS Produto, p.marca, p.preco AS Preco_Venda,
       c.nome AS Categoria, c.departamento,
       f.nome AS Fornecedor, f.contato AS Contato_Fornecedor,
       pf.preco_compra,
       (p.preco - pf.preco_compra) AS Lucro_Unitario,
       ROUND(((p.preco - pf.preco_compra) / pf.preco_compra * 100), 2) AS Margem_Lucro_Percentual,
       p.estoque, (p.estoque * (p.preco - pf.preco_compra)) AS Lucro_Potencial_Estoque
FROM Produtos p
JOIN Categorias c ON p.id_categoria = c.id_categoria
JOIN ProdutosFornecedores pf ON p.id_produto = pf.id_produto
JOIN Fornecedores f ON pf.id_fornecedor = f.id_fornecedor
ORDER BY Margem_Lucro_Percentual DESC;

SELECT c.departamento, 
       SUM(p.estoque * p.preco) AS Valor_Total_Estoque,
       COUNT(DISTINCT p.id_produto) AS Quantidade_Produtos,
       MIN(p.preco) AS Preco_Minimo,
       MAX(p.preco) AS Preco_Maximo,
       AVG(p.preco) AS Preco_Medio
FROM Produtos p
JOIN Categorias c ON p.id_categoria = c.id_categoria
GROUP BY c.departamento
ORDER BY Valor_Total_Estoque DESC;