-- =========================================================
-- Consultas úteis do projeto "cargas"
-- =========================================================

-- 1) Conferir em qual banco você está conectado
select current_database();

-- 2) Contagem rápida de registros
select count(*) as total_empresas from empresas;
select count(*) as total_cargas from cargas;

-- 3) Listar tabelas (modo básico)
select * from empresas order by id;
select * from cargas order by id;

-- 4) Listar empresas (campos principais)
select id, nome, cnpj
from empresas
order by id;

-- 5) Listar cargas (campos principais)
select id, empresa_id, descricao, previsao_chegada, status, criado_em
from cargas
order by id;

-- 6) Relatório principal (JOIN): cargas + nome da empresa
select
  c.id,
  e.nome as empresa,
  c.descricao,
  c.previsao_chegada,
  c.status
from cargas c
join empresas e on e.id = c.empresa_id
order by c.previsao_chegada, e.nome;

-- 7) Pendentes por empresa (GROUP BY + WHERE)
select
  e.nome as empresa,
  count(*) as total_pendentes
from cargas c
join empresas e on e.id = c.empresa_id
where c.status = 'PENDENTE'
group by e.nome
order by total_pendentes desc, e.nome;

-- 8) Totais por empresa (total / pendentes / recebidas)
-- FILTER é um jeito "limpo" de contar por condição
select
  e.nome as empresa,
  count(*) as total_cargas,
  count(*) filter (where c.status = 'PENDENTE') as total_pendentes,
  count(*) filter (where c.status = 'RECEBIDA') as total_recebidas
from cargas c
join empresas e on e.id = c.empresa_id
group by e.nome
order by total_cargas desc, e.nome;

-- 9) Lista de pendentes com prioridade (atrasada primeiro)
select
  c.id,
  e.nome as empresa,
  c.descricao,
  c.previsao_chegada,
  c.status,
  case
    when c.previsao_chegada < current_date then 'ATRASADA'
    else 'NO PRAZO'
  end as situacao
from cargas c
join empresas e on e.id = c.empresa_id
where c.status = 'PENDENTE'
order by
  (c.previsao_chegada < current_date) desc,
  c.previsao_chegada asc,
  e.nome asc;