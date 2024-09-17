## Sistema de Venda - Banco de Dados SQL Server

<p align="center">
  <!-- Contador de linguagens do GitHub -->
  <img alt="GitHub language count" src="https://img.shields.io/github/languages/count/devAndreotti/NP1-SistemaVendas?color=FFF&labelColor=135f8c&style=flat-square">
  <!-- Tamanho do repositório no GitHub -->
  <img alt="GitHub repo size" src="https://img.shields.io/github/repo-size/devAndreotti/NP1-SistemaVendas?color=FFF&labelColor=135f8c&style=flat-square">
  <!-- Licença do GitHub -->
  <img alt="GitHub License" src="https://img.shields.io/github/license/devAndreotti/devAndreotti?color=FFF&labelColor=135f8c&style=flat-square">
</p>

<div align="center">
  <img src="./bd.webp" alt="Imagem de um Banco de Dados">
</div>

## Objetivo
Este repositório contém o código SQL para a criação de um banco de dados relacional para um sistema de **ponto de venda (PDV)**, feito para a **NP1** do quarto semestre, utilizando a linguagem SQL e o SGBD **Microsoft SQL Server**. O banco de dados foi projetado para armazenar informações essenciais para o funcionamento de um **PDV**, como: **empresa**, **lojas**, **produtos**, **vendas** e **notas fiscais**. 
* **Produtos:** Informações sobre os produtos vendidos, incluindo nome, modelo, marca, cor e valor.
* **Clientes:** Informações sobre os clientes, incluindo CPF e nome.
* **Funcionários:** Informações sobre os funcionários, incluindo CPF, nome, cargo, salário e loja em que trabalham.
* **Lojas:** Informações sobre as lojas, incluindo CEP, endereço e funcionários.
* **Vendas:** Informações sobre as vendas, incluindo código da venda, produto vendido, cliente, loja e valor total.
* **Notas Fiscais:** Informações sobre as notas fiscais, incluindo código da nota, cliente, produto, loja e valor total.
  
## Desenvolvimento
O desenvolvimento do banco de dados para o sistema de PDV seguiu as seguintes etapas:

**1. Modelagem de Dados:**
* **Criação do MER (Modelo Entidade-Relacionamento):** Nesta etapa, foi definido o modelo conceitual do banco de dados, representando as entidades (tabelas) e seus relacionamentos.
* **Criação do DER (Diagrama Entidade-Relacionamento):** A partir do MER, foi elaborado o DER, que representa a estrutura física do banco de dados, incluindo as tabelas, atributos e suas relações.

**2. Implementação em SQL:**
* **Criação das tabelas no Microsoft SQL Server:** As tabelas foram criadas no SGBD Microsoft SQL Server, com base no DER, definindo os nomes das tabelas, atributos e seus tipos de dados.
* **Definição das chaves primárias e estrangeiras:** As chaves primárias e estrangeiras foram definidas para garantir a integridade referencial e a consistência dos dados.
* **Inserção de dados de exemplo nas tabelas:** Dados de exemplo foram inseridos nas tabelas para testar a funcionalidade do banco de dados e demonstrar sua estrutura.
Com essas etapas, o banco de dados para o sistema de PDV foi desenvolvido de forma completa e organizada, garantindo a estrutura e a funcionalidade necessárias para o sistema.

## Código SQL
O código SQL para a criação do banco de dados está disponível no arquivo `SistemaVendas.sql`.

## Diagramas
Os diagramas **MER** e **DER** do banco de dados estão disponíveis nos arquivos `DER.png` e `MER.png`.

## Estrutura do Banco de Dados
O banco de dados é composto pelas seguintes tabelas:
* **Empresa:** Armazena informações sobre as empresas.
* **Loja:** Armazena informações sobre as lojas.
* **Produto:** Armazena informações sobre os produtos.
* **Funcionario:** Armazena informações sobre os funcionários.
* **Valor_Venda:** Armazena informações sobre o valor total da venda.
* **Venda:** Armazena informações sobre as vendas.
* **Cliente:** Armazena informações sobre os clientes.
* **Nota_Fiscal:** Armazena informações sobre as notas fiscais.

## Como Usar
Para usar o banco de dados, siga estas etapas:
1. Crie um novo banco de dados no **Microsoft SQL Server**.
2. Importe o código SQL do arquivo `SistemaVendas.sql` para o banco de dados.
3. Execute as instruções SQL para criar as tabelas e inserir os dados de exemplo.
4. Utilize as instruções SQL para consultar, inserir, atualizar e excluir dados no banco de dados.

## Detalhes do Banco de Dados

**Tabelas:**

* **Empresa:**
    * **Nome_Empresa:** Nome da empresa (VARCHAR(20), chave primária, obrigatório)
    * **Endereco:** Endereço da empresa (VARCHAR(100))
* **Loja:**
    * **Cep_Loja:** CEP da loja (VARCHAR(8), chave primária, obrigatório)
    * **Endereco:** Endereço da loja (VARCHAR(100))
* **Produto:**
    * **Id_Produto:** ID do produto (INT, chave primária, auto-incremento)
    * **Nome_Produto:** Nome do produto (VARCHAR(50))
    * **Modelo:** Modelo do produto (VARCHAR(50), obrigatório)
    * **Marca:** Marca do produto (VARCHAR(50))
    * **Cor:** Cor do produto (VARCHAR(20))
    * **Valor:** Valor do produto (FLOAT, obrigatório)
    * **FK_Cep_Loja:** CEP da loja onde o produto está cadastrado (VARCHAR(8), chave estrangeira referenciando a tabela Loja)
* **Funcionario:**
    * **Cpf_Funcionario:** CPF do funcionário (VARCHAR(11), chave primária, obrigatório)
    * **Nome:** Nome do funcionário (VARCHAR(80))
    * **Cargo:** Cargo do funcionário (VARCHAR(50))
    * **Salario:** Salário do funcionário (FLOAT, obrigatório)
    * **FK_Cep_Loja:** CEP da loja onde o funcionário trabalha (VARCHAR(8), chave estrangeira referenciando a tabela Loja)
* **Valor_Venda:**
    * **Id_Valor:** ID do valor da venda (INT, chave primária, auto-incremento)
    * **FK_Id_Produto:** ID do produto vendido (INT, chave estrangeira referenciando a tabela Produto)
    * **Quantidade_Produtos:** Quantidade de produtos vendidos (INT)
    * **Valor_Total:** Valor total da venda (FLOAT)
* **Venda:**
    * **Codigo_Venda:** Código da venda (INT, chave primária, auto-incremento)
    * **FK_Id_Produto:** ID do produto vendido (INT, chave estrangeira referenciando a tabela Produto)
    * **FK_Cep_Loja:** CEP da loja onde a venda ocorreu (VARCHAR(8), chave estrangeira referenciando a tabela Loja)
    * **Valor_Total:** Valor total da venda (FLOAT)
* **Cliente:**
    * **Cpf_Cliente:** CPF do cliente (VARCHAR(11), chave primária, obrigatório)
    * **Nome_Cliente:** Nome do cliente (VARCHAR(80))
* **Nota_Fiscal:**
    * **Codigo_Nota:** Código da nota fiscal (INT, chave primária, auto-incremento)
    * **FK_Cpf_Cliente:** CPF do cliente que comprou (VARCHAR(11), chave estrangeira referenciando a tabela Cliente)
    * **FK_Id_Produto:** ID do produto vendido (INT, chave estrangeira referenciando a tabela Produto)
    * **FK_Cep_Loja:** CEP da loja onde a venda ocorreu (VARCHAR(8), chave estrangeira referenciando a tabela Loja)

**Relações:**

* **Produto** e **Loja:** Um produto pode estar cadastrado em apenas uma loja (relacionamento 1:N).
* **Funcionario** e **Loja:** Um funcionário pode trabalhar em apenas uma loja (relacionamento 1:N).
* **Valor_Venda** e **Produto:** Uma venda pode ter vários produtos (relacionamento 1:N).
* **Venda** e **Produto:** Uma venda pode ter vários produtos (relacionamento 1:N).
* **Venda** e **Loja:** Uma venda pode ocorrer em apenas uma loja (relacionamento 1:N).
* **Nota_Fiscal** e **Cliente:** Uma nota fiscal pode ser emitida para apenas um cliente (relacionamento 1:N).
* **Nota_Fiscal** e **Produto:** Uma nota fiscal pode ser emitida para apenas um produto (relacionamento 1:N).
* **Nota_Fiscal** e **Loja:** Uma nota fiscal pode ser emitida em apenas uma loja (relacionamento 1:N).

**Observações:**

* As chaves primárias são definidas como `NOT NULL`.
* As chaves estrangeiras são definidas com a restrição `FOREIGN KEY`.
* Os dados de exemplo foram inseridos nas tabelas para demonstração.

## Possíveis Erros
Estaremos corrigindo quaisquer erros encontrados no banco de dados. 

## Conclusão
Este projeto demonstra a criação de um banco de dados relacional para um sistema de **PDV**, utilizando a linguagem SQL e o SGBD **Microsoft SQL Server**. O banco de dados é capaz de armazenar e gerenciar informações essenciais para o funcionamento de um **PDV**, e pode ser utilizado como base para o desenvolvimento de um sistema de **PDV** completo.

## Autores
* Monique Domingues Mendes
* Ricardo Andreotti Gonçalves
* Guilherme da Costa Baptista
* João Pedro Oliveira da Silva

## Licença
Este projeto está licenciado sob a licença MIT.
