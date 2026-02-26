-- 02_seed.sql
-- Dados de exemplo para testes

insert into empresas (nome, cnpj)
values
  ('Eletrolux', '12.345.678/0001-90'),
  ('Samsung',   '98.765.432/0001-10');

insert into cargas (empresa_id, descricao, previsao_chegada, status)
values
  (1, 'Carreta com geladeira', '2026-02-22', 'PENDENTE'),
  (1, 'Peças de reposição',    '2026-02-23', 'RECEBIDA'),
  (2, 'TVs e monitores',       '2026-02-22', 'PENDENTE');