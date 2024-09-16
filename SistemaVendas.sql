-- Esse comando abaixo é usado para excluir o banco de dados SistemaVendas
DROP DATABASE SistemaVendas;

-- Cria um novo banco de dados chamado SistemaVendas
CREATE DATABASE SistemaVendas;
GO

-- Seleciona o banco de dados SistemaVendas para ser usado nas próximas instruções
USE SistemaVendas;
GO

-- Esse trecho cria a tabela Produto com as seguintes colunas:
-- Id_Produto: número inteiro que se auto incrementa e é a chave primária
-- Nome_Produto: string de até 50 caracteres
-- Modelo: string de até 50 caracteres (obrigatório)
-- Marca: string de até 50 caracteres
-- Cor: string de até 20 caracteres
-- Valor: número float para o valor do produto (obrigatório)
CREATE TABLE Produto (
Id_Produto INT IDENTITY(1,1) PRIMARY KEY,
Nome_Produto VARCHAR(50),
Modelo VARCHAR(50) NOT NULL,
Marca VARCHAR(50),
Cor VARCHAR(20),
Valor FLOAT NOT NULL
);
GO

-- Esse trecho cria a tabela Cliente com as seguintes colunas:
-- Cpf_Cliente: string de 11 caracteres como chave primária (obrigatório)
-- Nome_Cliente: string de até 80 caracteres
CREATE TABLE Cliente (
Cpf_Cliente VARCHAR(11) PRIMARY KEY NOT NULL,
Nome_Cliente VARCHAR(80)
);
GO

-- Esse trecho cria a tabela Funcionario com as seguintes colunas:
-- Cpf_Funcionario: string de 11 caracteres como chave primária (obrigatório)
-- Nome: string de até 80 caracteres
-- Cargo: string de até 50 caracteres
-- Salario: número float para o salário do funcionário (obrigatório)
-- FK_Cep_Loja: string de 8 caracteres que é uma chave estrangeira referenciando a tabela Loja
CREATE TABLE Funcionario (
Cpf_Funcionario VARCHAR(11) PRIMARY KEY NOT NULL,
Nome VARCHAR(80),
Cargo VARCHAR(50),
Salario FLOAT NOT NULL,
FK_Cep_Loja VARCHAR(8) NULL -- Por que? Não sei.
);
GO

-- Esse trecho cria a tabela Loja com as seguintes colunas:
-- Cep_Loja: uma string de 8 caracteres como chave primária da tabela (obrigatório)
-- Endereco: uma string de até 100 caracteres
-- FK_Id_Produto: uma chave estrangeira referenciando a tabela Produto
-- FK_Cpf_Funcionario: uma chave estrangeira referenciando a tabela Funcionario
CREATE TABLE Loja (
Cep_Loja VARCHAR(8) PRIMARY KEY NOT NULL,
Endereco VARCHAR(100),
FK_Id_Produto INT,
FK_Cpf_Funcionario VARCHAR(11)
);
GO

-- Esse comando adiciona uma restrição de chave estrangeira à tabela Funcionario, referenciando a coluna Cep_Loja da tabela Loja
ALTER TABLE Funcionario
ADD CONSTRAINT FK_Funcionario_Loja
FOREIGN KEY (FK_Cep_Loja) REFERENCES Loja(Cep_Loja);
GO

-- Essa parte cria a tabela Empresa com as seguintes colunas:
-- Cep_Empresa: string de 8 caracteres como chave primária da tabela (obrigatório)
-- Endereco: string de até 100 caracteres
-- Nome: string de até 80 caracteres
-- FK_Cep_Loja: chave estrangeira referenciando a tabela Loja
CREATE TABLE Empresa (
Cep_Empresa VARCHAR(8) PRIMARY KEY NOT NULL,
Endereco VARCHAR(100),
Nome VARCHAR(80),
FK_Cep_Loja VARCHAR(8),
CONSTRAINT FK_Empresa_Loja FOREIGN KEY (FK_Cep_Loja) REFERENCES Loja(Cep_Loja)
);
GO

-- Essa parte cria a tabela Venda com as seguintes colunas:
-- Codigo_Venda: número inteiro que se auto incrementa e é a chave primária da tabela
-- FK_Id_Produto: chave estrangeira referenciando a tabela Produto
-- FK_Cpf_Cliente: chave estrangeira referenciando a tabela Cliente
-- FK_Cep_Loja: chave estrangeira referenciando a tabela Loja
-- Valor_Total: número float para o valor total da venda
CREATE TABLE Venda (
Codigo_Venda INT IDENTITY(1,1) PRIMARY KEY,
FK_Id_Produto INT,
FK_Cpf_Cliente VARCHAR(11),
FK_Cep_Loja VARCHAR(8),
Valor_Total FLOAT,
CONSTRAINT FK_Venda_Produto FOREIGN KEY (FK_Id_Produto) REFERENCES Produto(Id_Produto),
CONSTRAINT FK_Venda_Cliente FOREIGN KEY (FK_Cpf_Cliente) REFERENCES Cliente(Cpf_Cliente),
CONSTRAINT FK_Venda_Loja FOREIGN KEY (FK_Cep_Loja) REFERENCES Loja(Cep_Loja)
);
GO

-- Essa parte cria a tabela ValorVenda com as seguintes colunas:
-- Id_Valor: número inteiro que se auto incrementa e é a chave primária da tabela
-- FK_Id_Produto: chave estrangeira referenciando a tabela Produto
-- Quantidade_produtos: número inteiro para a quantidade de produtos vendidos
-- Valor_total: número float para o valor total da venda
CREATE TABLE Valor_Venda (
Id_Valor INT IDENTITY(1,1) PRIMARY KEY,
FK_Id_Produto INT,
Quantidade_Produtos INT,
Valor_Total FLOAT
CONSTRAINT FK_ValorVenda_Produto FOREIGN KEY (FK_Id_Produto) REFERENCES Produto(Id_Produto)
);
GO

-- Esse trecho cria a tabela NotaFiscal com as seguintes colunas:
-- Codigo_Nota: número inteiro que se auto incrementa e é a chave primária
-- FK_Cpf_Cliente: chave estrangeira referenciando a tabela Cliente
-- FK_Id_Produto: chave estrangeira referenciando a tabela Produto
-- FK_Cep_Loja: chave estrangeira referenciando a tabela Loja
CREATE TABLE Nota_Fiscal (
Codigo_Nota INT IDENTITY(1,1) PRIMARY KEY,
FK_Cpf_Cliente VARCHAR(11),
FK_Id_Produto INT,
FK_Cep_Loja VARCHAR(8),
CONSTRAINT FK_NotaFiscal_Cliente FOREIGN KEY (FK_Cpf_Cliente) REFERENCES Cliente(Cpf_Cliente),
CONSTRAINT FK_NotaFiscal_Produto FOREIGN KEY (FK_Id_Produto) REFERENCES Produto(Id_Produto),
CONSTRAINT FK_NotaFiscal_Loja FOREIGN KEY (FK_Cep_Loja) REFERENCES Loja(Cep_Loja)
);
GO















-- Inserindo dados na tabela Produto
INSERT INTO Produto (Nome_Produto, Modelo, Marca, Cor, Valor) VALUES
    ('Smartphone', 'Galaxy S23', 'Samsung', 'Preto', 5000.00),
    ('Notebook', 'Inspiron 15', 'Dell', 'Prata', 4000.00),
    ('Tablet', 'iPad Air', 'Apple', 'Cinza espacial', 2500.00),
    ('Fone de ouvido', 'AirPods Pro', 'Apple', 'Branco', 1500.00),
    ('Smartwatch', 'Galaxy Watch 5', 'Samsung', 'Preto', 1000.00);

-- Inserindo dados na tabela Cliente
INSERT INTO Cliente (Cpf_Cliente, Nome_Cliente) VALUES
    ('12345678901', 'Paulo Abner'),
    ('98765432101', 'Maria Santos'),
    ('11122233344', 'Pedro Almeida'),
    ('55566677788', 'Ana Oliveira'),
    ('99988877766', 'José Pereira');

-- Inserindo dados na tabela Loja (primeiro!)
INSERT INTO Loja (Cep_Loja, Endereco, FK_Id_Produto, FK_Cpf_Funcionario) VALUES
    ('01001000', 'Av. Brasil, 1000 - Rio de Janeiro', 1, NULL), -- FK_Cpf_Funcionario pode ser NULL inicialmente
    ('02002000', 'Av. Romário, 470 - São Paulo', 2, NULL),
    ('03003000', 'Rua da Liberdade, 500 - São Paulo', 3, NULL);

-- Inserindo dados na tabela Funcionario
INSERT INTO Funcionario (Cpf_Funcionario, Nome, Cargo, Salario, FK_Cep_Loja) VALUES
    ('00011122233', 'Ricardo Costa', 'Gerente', 5000.00, '01001000'),
    ('44455566677', 'Laura Silva', 'Vendedora', 2500.00, '01001000'),
    ('88899900011', 'Bruno Ferreira', 'Caixa', 2000.00, '01001000');





-- Adicionando FK do Funcionário usando UPDATE

-- Vinculando Ricardo à primeira loja
UPDATE Loja SET FK_Cpf_Funcionario = '00011122233' WHERE Cep_Loja = '01001000';

-- Vinculando Laura à segunda loja
UPDATE Loja SET FK_Cpf_Funcionario = '44455566677' WHERE Cep_Loja = '02002000';

-- Vinculando Bruno à terceira loja
UPDATE Loja SET FK_Cpf_Funcionario = '88899900011' WHERE Cep_Loja = '03003000';






-- Inserindo dados na tabela Empresa
INSERT INTO Empresa (Cep_Empresa, Endereco, Nome, FK_Cep_Loja) VALUES
    ('03003000', 'Av. Paulista, 1500 - São Paulo', 'Empresa A', '02002000');

SELECT * FROM Empresa;

-- Inserindo dados na tabela Venda
INSERT INTO Venda (FK_Id_Produto, FK_Cpf_Cliente, FK_Cep_Loja, Valor_Total) VALUES
    (1, '12345678901', '01001000', 5000.00),
    (2, '98765432101', '02002000', 4000.00);

-- Inserindo dados na tabela Valor_Venda
INSERT INTO Valor_Venda (FK_Id_Produto, Quantidade_produtos, Valor_total) VALUES
    (1, 1, 5000.00),
    (2, 1, 4000.00);

-- Inserindo dados na tabela Nota_Fiscal
INSERT INTO Nota_Fiscal (FK_Cpf_Cliente, FK_Id_Produto, FK_Cep_Loja) VALUES
    ('12345678901', 1, '01001000'),
    ('98765432101', 2, '02002000');
