# Controle de Cargas com PostgreSQL e Docker

Projeto prático de modelagem relacional e consultas SQL simulando um sistema simples de controle de cargas por empresa.

O objetivo é demonstrar domínio de:

- Modelagem relacional
- Chaves primárias e estrangeiras
- JOIN
- WHERE
- GROUP BY
- CASE
- CHECK constraint
- Docker + PostgreSQL

---

## Tecnologias

- PostgreSQL 16
- Docker
- Docker Compose
- DBeaver (cliente SQL)

---

## Modelagem

### Tabela empresas
- id (PK)
- nome
- cnpj

### Tabela cargas
- id (PK)
- empresa_id (FK → empresas.id)
- descricao
- previsao_chegada
- status (CHECK: PENDENTE ou RECEBIDA)
- criado_em

Relacionamento:  
Uma empresa pode possuir várias cargas (1:N).

---

## Como executar o projeto

### 1 Subir o banco

```
docker compose up -d
```
2 Verificar se está rodando
docker compose ps
3 Conectar no banco (DBeaver)

Host: localhost
Porta: 5432
Database: cargasdb
User: postgres
Password: 1234

Scripts

Ordem de execução manual (caso deseje rodar no DBeaver):

sql/01_schema.sql

sql/02_seed.sql

sql/03_queries.sql

Exemplos de consultas implementadas
Cargas com empresa (JOIN)

Relacionamento entre cargas e empresas.

Total de cargas por empresa

Uso de GROUP BY e COUNT.

Total de pendentes e recebidas por empresa

Uso de COUNT com filtro condicional.

Classificação de atraso

Uso de CASE para identificar cargas ATRASADAS ou NO PRAZO.

Objetivo educacional

Este projeto foi desenvolvido para consolidar fundamentos de SQL e boas práticas utilizando Docker para ambiente isolado e reproduzível.E: ATRASADA / NO PRAZO)
