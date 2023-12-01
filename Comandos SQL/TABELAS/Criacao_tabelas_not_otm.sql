-- criado
CREATE TABLE "LocalNascimento_not_otm" AS 
SELECT "LOCNASC", def_loc_nasc
FROM public."LocalNascimento";

CREATE TABLE public."Consultas_not_otm" AS 
SELECT "CONSULTAS", def_consultas
FROM public."Consultas";

CREATE TABLE public."idAnomalia_not_otm" AS 
SELECT "IDANOMAL", def_anomalia
FROM public."idAnomalia";

CREATE TABLE public."GESTACAO_not_otm" AS 
SELECT "GESTACAO", def_gestacao
FROM public."Gestacao";

CREATE TABLE public."Parto_not_otm" AS 
SELECT "PARTO", def_parto
FROM public."Parto";

CREATE TABLE public."RacaCor_not_otm" AS 
SELECT "RACACOR", def_raca_cor
FROM public."RacaCor";

CREATE TABLE public."SEXO_not_otm" AS 
SELECT "SEXO", def_sexo
FROM public."Sexo";

