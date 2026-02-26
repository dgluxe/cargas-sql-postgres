-- 01_schema.sql

create table if not exists empresas (
  id bigserial primary key,
  nome text not null,
  cnpj text unique,
  criado_em timestamp not null default now()
);

create table if not exists cargas (
  id bigserial primary key,
  empresa_id bigint not null references empresas(id),
  descricao text not null,
  previsao_chegada date,
  status text not null default 'PENDENTE',
  criado_em timestamp not null default now()
);

create index if not exists idx_cargas_previsao
  on cargas(previsao_chegada);