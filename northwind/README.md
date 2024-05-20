# Desafio Analista de Dados/Engenheiro de Analytics


## Introdução
Este projeto foi desenvolvido como parte do desafio Analista de Dados/Engenheiro de Analytics pela Indicium. O objetivo é avaliar competências práticas em Engenharia de Analytics, seguindo a metodologia do Modern Analytics Stack. Este projeto abrange a construção de uma plataforma de analytics moderna, modelagem dimensional em data warehouses, transformações de dados com SQL e dbt, e a criação de visualizações de dados em uma ferramenta de Self-Service BI.

## Contexto
A empresa fictícia Northwind Traders, uma loja que gerencia pedidos, produtos, clientes, fornecedores, e outros aspectos de uma pequena empresa, contratou você para utilizar seus dados estrategicamente. A Northwind Traders possui cerca de 30 funcionários e um faturamento mensal de 1 milhão e meio de reais, com clientes e fornecedores distribuídos em diversos países. Para enfrentar desafios crescentes devido à expansão, a empresa busca integrar seus dados e utilizá-los de forma estratégica para se tornar uma empresa data driven.

## Descrição dos Dados
A Northwind Traders utiliza um banco de dados transacional PostgreSQL, com dados distribuídos em 14 tabelas disponíveis no arquivo northwind.zip. Essas tabelas abrangem diferentes áreas, como pedidos, produtos, clientes, fornecedores, entre outros.

## Entrega

### 1. Diagrama Conceitual do Data Warehouse
![diagrama_northwind](https://github.com/italobatistos/Desafio-Analista-de-Dados-Engenheiro-de-Analytics/assets/135757227/141b1e23-8255-43ef-be97-9518bf2834f1)

Descrição: Criação do modelo conceitual com tabelas de fatos e dimensões necessárias para responder às perguntas de negócio.

Ferramenta Utilizada: draw.io

### 2. Configuração do Data Warehouse e dbt
Data Warehouse: Google BigQuery

Ferramenta de Transformação: dbt

Descrição: Configuração de um data warehouse na nuvem e do dbt para transformação de dados.

### 3. Transformação de Dados
Ferramenta: dbt

Tarefas:
- Documentação das tabelas e colunas nos marts.
- Testes de sources.
- Testes nas primary keys das tabelas de dimensão e fatos.
- Código armazenado em um repositório no GitHub.

### 4. Painéis de BI
Ferramenta: PowerBI

Perguntas de Negócio:
- Quais os produtos com maior ticket médio por mês, e país?
- Quais os 5 melhores países em valor total negociado por produto, data de venda, funcionario?
- Qual o número de pedidos, quantidade comprada, valor total negociado por mês e ano?
Formato de Entrega:
- Relatório: PDF
- PowerBI: Arquivo do dashboard.

## Ferramentas Utilizadas
- DBT: Ferramenta de transformação de dados.
- PowerBI: Ferramenta de BI.
- Draw.IO: Ferramenta de desenho e criação de diagramas.

## Considerações Finais
Este projeto tem como objetivo demonstrar a capacidade de criar uma plataforma de analytics moderna, realizar modelagem dimensional, transformar dados e criar visualizações de dados interativas. A entrega deste projeto inclui um diagrama conceitual, configurações técnicas, transformações de dados, dashboards de BI.
