# Projeto SQL: Controle de Cargas (PostgreSQL + Docker)

Projeto simples para praticar modelagem relacional e consultas SQL (JOIN, WHERE, GROUP BY, CASE), simulando controle de cargas por empresa.

## Tecnologias
PostgreSQL 16
Docker + Docker Compose
DBeaver (cliente SQL)

## Estrutura
sql/01_schema.sql cria tabelas e índice
sql/02_seed.sql insere dados de exemplo
sql/03_queries.sql consultas prontas (relatórios)

## Como rodar (Docker Compose)
Subir o banco
docker compose up -d

Ver se está rodando
docker compose ps

Parar
docker compose stop

## Conectar no DBeaver
Host localhost
Porta 5432
Database cargasdb
User postgres
Password 1234

## Como aplicar os scripts
No DBeaver, execute na ordem
1 sql/01_schema.sql
2 sql/02_seed.sql
3 sql/03_queries.sql

## Exemplos de relatórios
Cargas com empresa (JOIN)
Pendentes por empresa (GROUP BY + WHERE)
Pendentes com situação (CASE: ATRASADA / NO PRAZO)
