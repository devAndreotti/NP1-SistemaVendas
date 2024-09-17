# Sistema de Venda - Banco de Dados SQL Server

Este repositório contém o código SQL para a criação de um banco de dados para um sistema de ponto de venda (PDV). O banco de dados foi projetado para armazenar informações sobre produtos, clientes, funcionários, lojas, vendas e notas fiscais.

## Objetivo

O objetivo deste projeto é criar um banco de dados relacional completo para um sistema de PDV, utilizando a linguagem SQL e o SGBD SQL Server. O banco de dados deve ser capaz de armazenar e gerenciar informações essenciais para o funcionamento de um PDV, como:

* **Produtos:** Informações sobre os produtos vendidos, incluindo nome, modelo, marca, cor e valor.
* **Clientes:** Informações sobre os clientes, incluindo CPF e nome.
* **Funcionários:** Informações sobre os funcionários, incluindo CPF, nome, cargo, salário e loja em que trabalham.
* **Lojas:** Informações sobre as lojas, incluindo CEP, endereço e funcionários.
* **Vendas:** Informações sobre as vendas, incluindo código da venda, produto vendido, cliente, loja e valor total.
* **Notas Fiscais:** Informações sobre as notas fiscais, incluindo código da nota, cliente, produto, loja e valor total.

## Desenvolvimento

O projeto foi desenvolvido em etapas:

1. **Modelagem de Dados:**
    * Criação do MER (Modelo Entidade-Relacionamento).
    * Criação do DER (Diagrama Entidade-Relacionamento).
2. **Implementação em SQL:**
    * Criação das tabelas no SQL Server.
    * Definição das chaves primárias e estrangeiras.
    * Inserção de dados de exemplo nas tabelas.

## Código SQL

O código SQL para a criação do banco de dados está disponível no arquivo `bd.sql`.

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

Os diagramas MER e DER do banco de dados estão disponíveis no arquivo `diagrama.png`.

## Como Usar

Para usar o banco de dados, siga estas etapas:

1. Crie um novo banco de dados no SQL Server.
2. Importe o código SQL do arquivo `bd.sql` para o banco de dados.
3. Execute as instruções SQL para criar as tabelas e inserir os dados de exemplo.
4. Utilize as instruções SQL para consultar, inserir, atualizar e excluir dados no banco de dados.

## Conclusão

Este projeto demonstra a criação de um banco de dados relacional completo para um sistema de PDV, utilizando a linguagem SQL e o SGBD SQL Server. O banco de dados é capaz de armazenar e gerenciar informações essenciais para o funcionamento de um PDV, e pode ser utilizado como base para o desenvolvimento de um sistema de PDV completo.

## Próximos Passos

* Implementar um sistema de PDV completo utilizando o banco de dados criado.
* Adicionar novas funcionalidades ao banco de dados, como:
    * Cadastro de fornecedores.
    * Controle de estoque.
    * Relatórios de vendas.
* Implementar uma interface gráfica para o sistema de PDV.

## Autores

* Guilherme da Costa Baptista
* João Pedro Oliveira da Silva
* Monique Domingues Mendes
* Ricardo Andreotti Gonçalves

## Licença

Este projeto está licenciado sob a licença MIT.
