# Sistema de Venda - Banco de Dados SQL Server
<p align="center">
  <!-- Contador de linguagens do GitHub -->
  <img alt="GitHub language count" src="https://img.shields.io/github/languages/count/devAndreotti/NP1-SistemaVendas?color=FFF&labelColor=4bae4f&style=flat-square">
  <!-- Tamanho do repositório no GitHub -->
  <img alt="GitHub repo size" src="https://img.shields.io/github/repo-size/devAndreotti/NP1-SistemaVendas?color=FFF&labelColor=4bae4f&style=flat-square">
  <!-- Licença do GitHub -->
  <img alt="GitHub License" src="https://img.shields.io/github/license/devAndreotti/devAndreotti?color=FFF&labelColor=4bae4f&style=flat-square">
</p>

<div align="center">
  <img src="./" alt="Imagem de um Banco de Dados">
</div>

Este repositório contém o código SQL para a criação de um banco de dados para um sistema de **ponto de venda (PDV)** feito para a **NP1** do quarto semestre. O banco de dados foi projetado para armazenar informações sobre **produtos**, **clientes**, **funcionários**, **lojas**, **vendas** e **notas fiscais**.

## Objetivo
O objetivo deste projeto é criar um banco de dados relacional para um sistema de **PDV**, utilizando a linguagem SQL e o SGBD **Microsoft SQL Server**. O banco de dados deve ser capaz de armazenar e gerenciar informações essenciais para o funcionamento de um **PDV**, como:
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
O código SQL para a criação do banco de dados está disponível no arquivo `SistemasVendas.sql`.

## Estrutura do Banco de Dados
O banco de dados é composto pelas seguintes tabelas:
* **Produto:** Armazena informações sobre os produtos.
* **Cliente:** Armazena informações sobre os clientes.
* **Funcionario:** Armazena informações sobre os funcionários.
* **Loja:** Armazena informações sobre as lojas.
* **Empresa:** Armazena informações sobre as empresas.
* **Venda:** Armazena informações sobre as vendas.
* **Valor_Venda:** Armazena informações sobre o valor total da venda.
* **Nota_Fiscal:** Armazena informações sobre as notas fiscais.

## Diagramas
Os diagramas **MER** e **DER** do banco de dados estão disponíveis nos arquivos `DER.png` e `MER.png`.

## Como Usar
Para usar o banco de dados, siga estas etapas:
1. Crie um novo banco de dados no **Microsoft SQL Server**.
2. Importe o código SQL do arquivo `SistemaVendas.sql` para o banco de dados.
3. Execute as instruções SQL para criar as tabelas e inserir os dados de exemplo.
4. Utilize as instruções SQL para consultar, inserir, atualizar e excluir dados no banco de dados.

## Possíveis Erros
Estaremos corrigindo quaisquer erros encontrados no banco de dados. 

## Conclusão
Este projeto demonstra a criação de um banco de dados relacional completo para um sistema de **PDV**, utilizando a linguagem SQL e o SGBD **Microsoft SQL Server**. O banco de dados é capaz de armazenar e gerenciar informações essenciais para o funcionamento de um **PDV**, e pode ser utilizado como base para o desenvolvimento de um sistema de **PDV** completo.

## Autores
* Guilherme da Costa Baptista
* João Pedro Oliveira da Silva
* Monique Domingues Mendes
* Ricardo Andreotti Gonçalves

## Licença
Este projeto está licenciado sob a licença MIT.
