-- Cria um novo banco de dados chamado SistemaVendas
CREATE DATABASE SistemaVendas;
GO

-- Seleciona o banco de dados SistemaVendas para ser usado nas próximas instruções
USE SistemaVendas;
GO



-- Essa parte cria a tabela Empresa com as seguintes colunas:
-- Nome_Empresa: string de até 20 caracteres (obrigatória)
-- Endereco: string de até 100 caracteres
CREATE TABLE Empresa (
Nome_Empresa VARCHAR(20) PRIMARY KEY NOT NULL,
Endereco VARCHAR(100)
)



-- Esse trecho cria a tabela Loja com as seguintes colunas:
-- Cep_Loja: uma string de 8 caracteres como chave primária da tabela (obrigatório)
-- Endereco: uma string de até 100 caracteres
CREATE TABLE Loja (
Cep_Loja VARCHAR(8) PRIMARY KEY NOT NULL,
Endereco VARCHAR(100),
);
GO



-- Esse trecho cria a tabela Produto com as seguintes colunas:
-- Id_Produto: número inteiro que se auto incrementa e é a chave primária
-- Nome_Produto: string de até 50 caracteres
-- Modelo: string de até 50 caracteres (obrigatória)
-- Marca: string de até 50 caracteres
-- Cor: string de até 20 caracteres
-- Valor: número float para o valor do produto (obrigatório)
-- FK_Cep_Loja: string de 8 caracteres que é uma chave estrangeira referenciando a tabela Loja
CREATE TABLE Produto (
Id_Produto INT IDENTITY(1,1) PRIMARY KEY,
Nome_Produto VARCHAR(50),
Modelo VARCHAR(50) NOT NULL,
Marca VARCHAR(50),
Cor VARCHAR(20),
Valor FLOAT NOT NULL,
FK_Cep_Loja varchar(8),
CONSTRAINT FK_Cep_Loja FOREIGN KEY (FK_Cep_Loja) REFERENCES Loja(Cep_Loja)
);
GO



-- Esse trecho cria a tabela Funcionario com as seguintes colunas:
-- Cpf_Funcionario: string de 11 caracteres como chave primária (obrigatória)
-- Nome: string de até 80 caracteres
-- Cargo: string de até 50 caracteres
-- Salario: número float para o salário do funcionário (obrigatório)
-- FK_Cep_Loja: string de 8 caracteres que é uma chave estrangeira referenciando a tabela Loja
CREATE TABLE Funcionario (
Cpf_Funcionario VARCHAR(11) PRIMARY KEY NOT NULL,
Nome VARCHAR(80),
Cargo VARCHAR(50),
Salario FLOAT NOT NULL,
FK_Cep_Loja VARCHAR(8),
CONSTRAINT FK_Cep_Loja FOREIGN KEY (FK_Cep_Loja) REFERENCES Loja(Cep_Loja),
);
GO



-- Essa parte cria a tabela Valor_Venda com as seguintes colunas:
-- Id_Valor: número inteiro que se auto incrementa e é a chave primária da tabela
-- FK_Id_Produto: chave estrangeira referenciando a tabela Produto
-- Quantidade_produtos: número inteiro para a quantidade de produtos vendidos
-- Valor_total: número float para o valor total da venda
CREATE TABLE Valor_Venda (
Id_Valor INT IDENTITY(1,1) PRIMARY KEY,
FK_Id_Produto INT,
Quantidade_Produtos INT,
Valor_Total FLOAT
CONSTRAINT FK_Id_Produto_VV FOREIGN KEY (FK_Id_Produto) REFERENCES Produto(Id_Produto)
);
GO



-- Essa parte cria a tabela Venda com as seguintes colunas:
-- Codigo_Venda: número inteiro que se auto incrementa e é a chave primária da tabela
-- FK_Id_Produto: chave estrangeira referenciando a tabela Produto
-- FK_Cep_Loja: chave estrangeira referenciando a tabela Loja
-- Valor_Total: número float para o valor total da venda
CREATE TABLE Venda (
Codigo_Venda INT IDENTITY(1,1) PRIMARY KEY,
FK_Id_Produto INT,
FK_Cep_Loja VARCHAR(8),
Valor_Total FLOAT,
CONSTRAINT FK_Venda_Produto FOREIGN KEY (FK_Id_Produto) REFERENCES Produto(Id_Produto),
CONSTRAINT FK_Venda_Loja FOREIGN KEY (FK_Cep_Loja) REFERENCES Loja(Cep_Loja)
);
GO



-- Esse trecho cria a tabela Cliente com as seguintes colunas:
-- Cpf_Cliente: string de 11 caracteres como chave primária (obrigatória)
-- Nome_Cliente: string de até 80 caracteres
CREATE TABLE Cliente (
Cpf_Cliente VARCHAR(11) PRIMARY KEY NOT NULL,
Nome_Cliente VARCHAR(80)
);
GO



-- Esse trecho cria a tabela Nota_Fiscal com as seguintes colunas:
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






-- Inserindo dados na tabela Empresa
Insert into Empresa (Nome_Empresa, Endereco) values 
	('Shark Tank', ' Rua Almeida Sergio')
GO

-- Inserindo dados na tabela Loja
insert into Loja (Cep_Loja, Endereco) values
('18114646', 'Rua Gisele Martins'),
('18524646', 'Avenida Antonio Marques')

--Inserindo produtos cadastrados
insert into Produto (Nome_Produto, Modelo, Marca, Cor, Valor) values
('Camisa','M','Nike','Branca', 60.0),
('Camisa','M','Nike','Preta', 50.0)

-- Atulizando a tebela cadastro
update Produto set FK_Cep_Loja = '18114646' where Id_Produto = 1
update Produto set FK_Cep_Loja = '18524646' where Id_Produto = 2


-- Inserindo dados na tabela Funcionario
INSERT INTO Funcionario (Cpf_Funcionario, Nome, Cargo, Salario, FK_Cep_Loja) VALUES
    ('00011122233', 'Ricardo Costa', 'Gerente', 5000.00, '18114646'),
    ('44455566677', 'Laura Silva', 'Vendedora', 2500.00, '18114646'),
    ('88899900011', 'Bruno Ferreira', 'Caixa', 2000.00, '18524646'),
	('88855500011', 'Jorge da Silva', 'Repositor', 1800.00, '18524646');


-- Inserindo dados na tabela Valor_Venda
INSERT INTO Valor_Venda (FK_Id_Produto, Quantidade_Produtos, Valor_Total) VALUES
    (1, 10, 5000.00),
    (2, 15, 2500.00),
    (2, 5, 2000.00);

-- Inserindo dados na tabela Venda
INSERT INTO Venda (FK_Id_Produto, FK_Cep_Loja, Valor_Total) VALUES
    (1, '18114646', 5000.00),
    (2, '18524646', 2500.00),
	(1, '18114646', 2000.00);

-- Inserindo dados na tabela Cliente
INSERT INTO Cliente (Cpf_Cliente, Nome_Cliente) VALUES
    ('12345678901', 'Paulo Abner'),
    ('98765432101', 'Maria Santos'),
    ('11122233344', 'Pedro Almeida'),
    ('55566677788', 'Ana Oliveira'),
    ('99988877766', 'José Pereira');
	  
-- Inserindo dados na tabela Nota_Fiscal
INSERT INTO Nota_Fiscal (FK_Cpf_Cliente, FK_Id_Produto, FK_Cep_Loja) VALUES
    ('12345678901', 1, '18114646'),
    ('98765432101', 2, '18114646'),
    ('98765432101', 2, '18114646');

-- Demitindo funcionario
Delete from Funcionario Where Cpf_Funcionario = '88855500011';

-- Mostrando todos os funcionarios
Select * from Funcionario;

-- Seleciona todas as colunas da tabela Venda onde o FK_Id_Produto é igual a 2
Select * from Venda where FK_Id_Produto = 2;
