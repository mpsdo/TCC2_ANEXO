-- Adicionando a coluna id do tipo UUID
ALTER TABLE public."tabela_ETLSINASC.DNRES_RJ_2018_t"
ADD COLUMN id UUID;

-- Atualizando a coluna id com valores UUID únicos
UPDATE public."tabela_ETLSINASC.DNRES_RJ_2018_t"
SET id = uuid_generate_v4();

-- Definindo a coluna id como chave primária
ALTER TABLE public."tabela_ETLSINASC.DNRES_RJ_2018_t"
ADD PRIMARY KEY (id);