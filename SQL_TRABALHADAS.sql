--1 Consulta:
--Join com duas tabelas:
		SELECT *
		FROM   "nascidovivo" a
			join "mae" b
				ON a.id = b.id
			join "registro" c
				ON b.id = c.id; 
				
				
--2 - Relaciona mais tabelas:

SELECT 
    a.*, 
    b.*, 
    c.*,
    d.def_escol_mae,
    e.def_est_civil,
    f.def_raca_cor
FROM 
    "NascidoVivo" a
JOIN 
    "Mae" b 
	ON a.id = b.id
JOIN 
    "Registro" c 
	ON b.id = c.id
JOIN 
    public."Escolaridade" d 
	ON d."ESCMAE" = b."ESCMAE"
JOIN 
    public."EstadoCivil" e 
	ON b."ESTCIVMAE" = e."ESTCIVMAE"
JOIN 
    public."RacaCor" f 
	ON b."RACACORMAE" = f."RACACOR"
	

--3 -
 SELECT
  *
FROM 
  "NascidoVivo"
JOIN "Mae"
  ON "NascidoVivo"."id" = "Mae"."id"
JOIN "Registro"
  ON "NascidoVivo"."id" = "Registro"."id"
JOIN "LocalNascimento"
  ON "NascidoVivo"."LOCNASC" = "LocalNascimento"."LOCNASC"
JOIN "Escolaridade"
  ON "Mae"."ESCMAE" = "Escolaridade"."ESCMAE"
JOIN "Consultas" --ok
  ON "NascidoVivo"."CONSULTAS" = "Consultas"."CONSULTAS"
JOIN "idAnomalia" 
  ON "NascidoVivo"."IDANOMAL" = "idAnomalia"."IDANOMAL"
JOIN "EstadoCivil"
  ON "Mae"."ESTCIVMAE" = "EstadoCivil"."ESTCIVMAE"
JOIN "Gestacao"
  ON "NascidoVivo"."GESTACAO" = "Gestacao"."GESTACAO"
JOIN "Parto"
  ON "NascidoVivo"."PARTO" = "Parto"."PARTO"
JOIN "RacaCor"
  ON "NascidoVivo"."RACACOR" = "RacaCor"."RACACOR"
JOIN "Sexo"
  ON "NascidoVivo"."SEXO" = "Sexo"."SEXO";
	
	
	
	
--4 - COnsulta 4:

SELECT
  NV.*,
  M.*,
  R.*,
  LN.*,
  E.*,
  C.*,
  IA.*,
  EC.*,
  G.*,
  P.*,
  RC.*,
  S.*,
  (SELECT COUNT(*) FROM "Gestacao" WHERE "GESTACAO" = NV."GESTACAO") AS "TotalGestacoes",
  (SELECT AVG(M2."IDADEMAE") FROM "Mae" M2 WHERE M2."ESCMAE" = M."ESCMAE") AS "MediaIdadeMaePorEscolaridade",
  (SELECT MAX("CONSULTAS") FROM "Consultas") AS "MaximoConsultasPreNatal"
FROM 
  "NascidoVivo" NV
JOIN "Mae" M ON NV."id" = M."id"
JOIN "Registro" R ON NV."id" = R."id"
JOIN "LocalNascimento" LN ON NV."LOCNASC" = LN."LOCNASC"
JOIN "Escolaridade" E ON M."ESCMAE" = E."ESCMAE"
JOIN "Consultas" C ON NV."CONSULTAS" = C."CONSULTAS"
JOIN "idAnomalia" IA ON NV."IDANOMAL" = IA."IDANOMAL"
JOIN "EstadoCivil" EC ON M."ESTCIVMAE" = EC."ESTCIVMAE"
JOIN "Gestacao" G ON NV."GESTACAO" = G."GESTACAO"
JOIN "Parto" P ON NV."PARTO" = P."PARTO"
JOIN "RacaCor" RC ON NV."RACACOR" = RC."RACACOR"
JOIN "Sexo" S ON NV."SEXO" = S."SEXO"
WHERE
  NV."GRAVIDEZ" > 1 AND
  M."IDADEMAE" >= (SELECT AVG("IDADEMAE") FROM "Mae")
ORDER BY
  NV."ano_nasc",
  NV."PESO" DESC;


4- 

SELECT
  NV.ano_nasc, NV."APGAR1", NV."APGAR5", NV."CODMUNNASC", NV."LOCNASC", NV."CODANOMAL", NV."GESTACAO", NV.contador, NV."GRAVIDEZ", NV."PARTO", NV."CONSULTAS", NV."DTNASC", NV.data_nasc, NV.dia_semana_nasc, NV."HORANASC", NV."SEXO", NV."RACACOR", NV."PESO", NV."IDANOMAL", NV."CONSPRENAT", NV."MESPRENAT", NV."TPAPRESENT", NV."STTRABPART", NV."STCESPARTO", NV."TPNASCASSI", NV."KOTELCHUCK", NV."PARIDADE", NV."nasc_CODIGO_UF", NV.parto_prematuro, NV."STDNNOVA", NV."SEMAGESTAC", NV.id as id_nv,
  M.id as id_m, M."CODMUNNATU", M."CODMUNRES", M."IDADEMAE", M."ESTCIVMAE", M."ESCMAE", M."CODOCUPMAE", M."QTDFILVIVO", M."QTDFILMORT", M."NATURALMAE", M."CODUFNATU", M."RACACORMAE", M."DTNASCMAE", M."SERIESCMAE", M."ESCMAE2010", M."QTDGESTANT", M."QTDPARTNOR", M."QTDPARTCES", M."DTULTMENST", M."TPMETESTIM", M."ESCMAEAGR1", M."CODPAISRES", M."res_CODIGO_UF",
  R.id as id_r, R."ORIGEM", R."CODESTAB", R."DTCADASTRO", R."NUMEROLOTE", R."VERSAOSIST", R."DTRECEBIM", R."DIFDATA", R."DTRECORIGA", R."TPFUNCRESP", R."TPDOCRESP", R."DTDECLARAC", R."STDNEPIDEM", R."TPROBSON",
  LN."LOCNASC", LN.def_loc_nasc,
  E."ESCMAE", E.def_escol_mae,
  C."CONSULTAS", C.def_consultas,
  IA."IDANOMAL", IA.def_anomalia,
  EC."ESTCIVMAE", EC.def_est_civil,
  G."GESTACAO", G.def_gestacao,
  P."PARTO", P.def_parto,
  RC."RACACOR", RC.def_raca_cor,
  S."SEXO", S.def_sexo,
  (SELECT COUNT(*) FROM "Gestacao" WHERE "GESTACAO" = NV."GESTACAO") AS "TotalGestacoes",
  (SELECT AVG(M2."IDADEMAE") FROM "Mae" M2 WHERE M2."ESCMAE" = M."ESCMAE") AS "MediaIdadeMaePorEscolaridade",
  (SELECT MAX("CONSULTAS") FROM "Consultas") AS "MaximoConsultasPreNatal"
FROM 
  "NascidoVivo" NV
JOIN "Mae" M ON NV.id = M.id
JOIN "Registro" R ON NV.id = R.id
JOIN "LocalNascimento" LN ON NV."LOCNASC" = LN."LOCNASC"
JOIN "Escolaridade" E ON M."ESCMAE" = E."ESCMAE"
JOIN "Consultas" C ON NV."CONSULTAS" = C."CONSULTAS"
JOIN "idAnomalia" IA ON NV."IDANOMAL" = IA."IDANOMAL"
JOIN "EstadoCivil" EC ON M."ESTCIVMAE" = EC."ESTCIVMAE"
JOIN "Gestacao" G ON NV."GESTACAO" = G."GESTACAO"
JOIN "Parto" P ON NV."PARTO" = P."PARTO"
JOIN "RacaCor" RC ON NV."RACACOR" = RC."RACACOR"
JOIN "Sexo" S ON NV."SEXO" = S."SEXO"
WHERE
  NV."GRAVIDEZ" > 1 AND
  M."IDADEMAE" >= (SELECT AVG("IDADEMAE") FROM "Mae")
ORDER BY
  NV."ano_nasc",
  NV."PESO" DESC;



