-- Criar banco de dados para mecanica
CREATE DATABASE IF NOT EXISTS MecanicaAutomotiva;

-- Eliminar tabelas existentes (caso houver)
DROP TABLE IF EXISTS Cliente, Veiculo, Servico, Peca, Funcionario, Servico_Peca, Servico_Funcionario;

-- Criação das tabelas

CREATE TABLE Cliente (
    ID_cliente INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255),
    Endereco VARCHAR(255),
    Telefone VARCHAR(15),
    Email VARCHAR(255) 
);

CREATE TABLE Veiculo (
    ID_veiculo INT AUTO_INCREMENT PRIMARY KEY,
    ID_cliente INT,
    Modelo VARCHAR(255),
    Placa VARCHAR(10),
    Ano INT,
    FOREIGN KEY (ID_cliente) REFERENCES Cliente(ID_cliente)
);

CREATE TABLE Servico (
    ID_servico INT AUTO_INCREMENT PRIMARY KEY,
    ID_veiculo INT, 
    Descricao VARCHAR(255),
    Custo DECIMAL(10, 2),
    Data DATE,
    FOREIGN KEY (ID_veiculo) REFERENCES Veiculo(ID_veiculo) 
);

CREATE TABLE Peca (
    ID_peca INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255),
    Estoque INT,
    Preco DECIMAL(10, 2)
);

CREATE TABLE Funcionario (
    ID_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255),
    Cargo VARCHAR(50),
    Salario DECIMAL(10, 2)
);

CREATE TABLE Servico_Peca (
    ID_servico_peca INT AUTO_INCREMENT PRIMARY KEY,
    ID_servico INT,
    ID_peca INT,
    UNIQUE KEY (ID_servico, ID_peca),
    FOREIGN KEY (ID_servico) REFERENCES Servico(ID_servico),
    FOREIGN KEY (ID_peca) REFERENCES Peca(ID_peca)
);

CREATE TABLE Servico_Funcionario (
    ID_servico_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    ID_servico INT,
    ID_funcionario INT,
    UNIQUE KEY (ID_servico, ID_funcionario),
    FOREIGN KEY (ID_servico) REFERENCES Servico(ID_servico),
    FOREIGN KEY (ID_funcionario) REFERENCES Funcionario(ID_funcionario)
);

CREATE INDEX idx_cliente_veiculo ON Veiculo(ID_cliente);

-- Fim da criação das tabelas

-- Inserção de dados na tabela Cliente

INSERT INTO Cliente (Nome, Endereco, Telefone, Email)
VALUES
    ('Cliente1', 'Endereco1', '123-456-7890', 'cliente1@email.com'),
    ('Cliente2', 'Endereco2', '987-654-3210', 'cliente2@email.com');

-- Inserção de dados na tabela Peca

INSERT INTO Peca (ID_peca, Nome, Estoque, Preco)
VALUES
    (1, 'Peca1', 50, 10.00),
    (2, 'Peca2', 30, 20.00);

-- Inserção de dados na tabela Funcionario

INSERT INTO Funcionario (ID_funcionario, Nome, Cargo, Salario)
VALUES
    (1, 'Func1', 'Mecânico', 2000.00),
    (2, 'Func2', 'Atendente', 1500.00);

-- Inserção de dados nas tabelas de junção

-- Inserção de dados na tabela Servico
INSERT INTO Servico (ID_servico, Descricao, Custo, Data)
VALUES
    (1, 'Troca de óleo', 50.00, '2023-01-01'),
    (2, 'Troca de pneus', 100.00, '2023-01-05');

-- Inserção de dados na tabela Servico_Peca
INSERT INTO Servico_Peca (ID_servico, ID_peca)
VALUES
    (1, 1),
    (1, 2),
    (2, 2);
    

-- Recuperar todos os clientes e seus veículos:
SELECT Cliente.Nome, Veiculo.Modelo, Veiculo.Placa
FROM Cliente
JOIN Veiculo ON Cliente.ID_cliente = Veiculo.ID_cliente;


-- Recuperar serviços realizados em veículos de um cliente específico:
SELECT Servico.Descricao, Servico.Custo
FROM Servico
JOIN Veiculo ON Servico.ID_veiculo = Veiculo.ID_veiculo
WHERE Veiculo.ID_cliente = 1;


-- Calcular a idade média dos clientes:
SELECT AVG(YEAR(CURRENT_DATE) - YEAR(Servico.Data)) AS IdadeMedia
FROM Cliente
JOIN Veiculo ON Cliente.ID_cliente = Veiculo.ID_cliente
JOIN Servico ON Veiculo.ID_veiculo = Servico.ID_veiculo;


-- Recuperar peças ordenadas por preço em ordem decrescente:
SELECT Nome, Preco
FROM Peca
ORDER BY Preco DESC;

-- Encontrar clientes que têm mais de um veículo:
SELECT ID_cliente, COUNT(ID_veiculo) AS QuantidadeVeiculos
FROM Veiculo
GROUP BY ID_cliente
HAVING QuantidadeVeiculos > 1;


-- Recuperar detalhes de serviços, incluindo peças utilizadas e funcionários envolvidos:
SELECT Servico.ID_servico, Servico.Descricao, Peca.Nome AS NomePeca, Funcionario.Nome AS NomeFuncionario
FROM Servico
LEFT JOIN Servico_Peca ON Servico.ID_servico = Servico_Peca.ID_servico
LEFT JOIN Peca ON Servico_Peca.ID_peca = Peca.ID_peca
LEFT JOIN Servico_Funcionario ON Servico.ID_servico = Servico_Funcionario.ID_servico
LEFT JOIN Funcionario ON Servico_Funcionario.ID_funcionario = Funcionario.ID_funcionario;

