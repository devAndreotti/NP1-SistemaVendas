-- Criação do banco de dados
CREATE DATABASE SistemaVendas;
GO

-- Usa o banco de dados recém criado
USE SistemaVendas;
GO

-- Tabela Produto com UNIQUE em Nome_Produto
CREATE TABLE Produto (
    ID_Produto INT IDENTITY(1,1) PRIMARY KEY,
    Nome_Produto VARCHAR(100) UNIQUE,
    Modelo VARCHAR(50),
    Marca VARCHAR(50),
    Valor FLOAT
);
GO

-- Tabela Cliente
CREATE TABLE Cliente (
    Cpf_Cliente VARCHAR(11) PRIMARY KEY,
    Nome_Cliente VARCHAR(100) UNIQUE
);
GO

-- Tabela Funcionario
CREATE TABLE Funcionario (
    Cpf_Funcionario VARCHAR(11) PRIMARY KEY,  
    Nome VARCHAR(100) UNIQUE,
    Cargo VARCHAR(50),
    Salario FLOAT,
    FK_Cep_Loja VARCHAR(8) NULL
);
GO

-- Tabela Loja
CREATE TABLE Loja (
    Cep_Loja VARCHAR(8) PRIMARY KEY,
    Endereco VARCHAR(255) UNIQUE,
    FK_Nome_Produto VARCHAR(100),
    FK_Nome_Funcionario VARCHAR(100),
	CONSTRAINT FK_Loja_Produto FOREIGN KEY (FK_Nome_Produto) REFERENCES Produto(Nome_Produto),
	CONSTRAINT FK_Loja_Funcionario FOREIGN KEY (FK_Nome_Funcionario) REFERENCES Funcionario(Nome)
);
GO

-- Atualizando a tabela Funcionario para referenciar Loja
ALTER TABLE Funcionario
ADD CONSTRAINT FK_Funcionario_Loja
FOREIGN KEY (FK_Cep_Loja) REFERENCES Loja(Cep_Loja);
GO

-- Adiciona NOT NULL para FK_Cep_Loja
ALTER TABLE Funcionario
ALTER COLUMN FK_Cep_Loja VARCHAR(8) NOT NULL;
GO

-- Tabela Empresa
CREATE TABLE Empresa (
    Cep_Empresa VARCHAR(8) PRIMARY KEY,
    Endereco VARCHAR(255),
    FK_Cep_Loja VARCHAR(8),
	CONSTRAINT FK_Empresa_Loja FOREIGN KEY (FK_Cep_Loja) REFERENCES Loja(Cep_Loja)
);
GO

-- Tabela Venda
CREATE TABLE Venda (
    Codigo_Venda INT IDENTITY(1,1) PRIMARY KEY,
    FK_Nome_Produto VARCHAR(100),
    FK_Cpf_Cliente VARCHAR(11),
    FK_Endereco_Loja VARCHAR(255),
    Valor_Total FLOAT UNIQUE,
	CONSTRAINT FK_Venda_Produto FOREIGN KEY (FK_Nome_Produto) REFERENCES Produto(Nome_Produto),
    CONSTRAINT FK_Venda_Cliente FOREIGN KEY (FK_Cpf_Cliente) REFERENCES Cliente(Cpf_Cliente),
    CONSTRAINT FK_Venda_Loja FOREIGN KEY (FK_Endereco_Loja) REFERENCES Loja(Endereco)
);
GO

-- Tabela NotaFiscal
CREATE TABLE NotaFiscal (
    Codigo_Nota INT IDENTITY(1,1) PRIMARY KEY,
    FK_Nome_Cliente VARCHAR(100),
    FK_Nome_Produto VARCHAR(100),
    FK_Cpf_Cliente VARCHAR(11),
    FK_Endereco_Loja VARCHAR(255),
    FK_Valor_Total FLOAT,
	CONSTRAINT FK_NotaFiscal_Cliente_Nome FOREIGN KEY (FK_Nome_Cliente) REFERENCES Cliente(Nome_Cliente),
    CONSTRAINT FK_NotaFiscal_Produto_Nome FOREIGN KEY (FK_Nome_Produto) REFERENCES Produto(Nome_Produto),
    CONSTRAINT FK_NotaFiscal_Cliente_Cpf FOREIGN KEY (FK_Cpf_Cliente) REFERENCES Cliente(Cpf_Cliente),
    CONSTRAINT FK_NotaFiscal_Loja_Endereco FOREIGN KEY (FK_Endereco_Loja) REFERENCES Loja(Endereco),
    CONSTRAINT FK_NotaFiscal_Venda_Valor FOREIGN KEY (FK_Valor_Total) REFERENCES Venda(Valor_Total)
);
GO