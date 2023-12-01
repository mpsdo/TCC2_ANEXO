CREATE VIEW "DADOSNASCIDO_OTM_V3" AS
SELECT
  nv.ano_nasc, 
  nv."APGAR1", 
  nv."APGAR5", 
  nv."CODMUNNASC", 
  nv."LOCNASC" as locnasc_nv, 
  nv."CODANOMAL" as codanomal_nv, 
  nv."GESTACAO" as gestacao_nv, 
  nv.contador, 
  nv."GRAVIDEZ", 
  nv."PARTO" as parto_nv, 
  nv."CONSULTAS" as consultas_nv, 
  nv."DTNASC", 
  nv.data_nasc, 
  nv.dia_semana_nasc, 
  nv."HORANASC", 
  nv."SEXO" as sexo_nv, 
  nv."RACACOR" as racacor_nv, 
  nv."PESO", 
  nv."IDANOMAL" as idanomal_nv, 
  nv."CONSPRENAT", 
  nv."MESPRENAT", 
  nv."TPAPRESENT", 
  nv."STTRABPART", 
  nv."STCESPARTO", 
  nv."TPNASCASSI", 
  nv."KOTELCHUCK", 
  nv."PARIDADE", 
  nv."nasc_CODIGO_UF", 
  nv.parto_prematuro, 
  nv."STDNNOVA", 
  nv."SEMAGESTAC", 
  nv.id as id_nv,
  m.id as id_m, 
  m."CODMUNNATU", 
  m."CODMUNRES", 
  m."IDADEMAE", 
  m."ESTCIVMAE" as estcivmae_m, 
  m."ESCMAE" as escmae_m, 
  m."CODOCUPMAE", 
  m."QTDFILVIVO", 
  m."QTDFILMORT", 
  m."NATURALMAE", 
  m."CODUFNATU", 
  m."RACACORMAE" as racacormae_m, 
  m."DTNASCMAE", 
  m."SERIESCMAE", 
  m."ESCMAE2010", 
  m."QTDGESTANT", 
  m."QTDPARTNOR", 
  m."QTDPARTCES", 
  m."DTULTMENST", 
  m."TPMETESTIM", 
  m."ESCMAEAGR1", 
  m."CODPAISRES", 
  m."res_CODIGO_UF",
  r.id as id_r, 
  r."ORIGEM", 
  r."CODESTAB", 
  r."DTCADASTRO", 
  r."NUMEROLOTE", 
  r."VERSAOSIST", 
  r."DTRECEBIM", 
  r."DIFDATA", 
  r."DTRECORIGA", 
  r."TPFUNCRESP", 
  r."TPDOCRESP", 
  r."DTDECLARAC", 
  r."STDNEPIDEM", 
  r."TPROBSON",
  ln.def_loc_nasc,
  e.def_escol_mae,
  c.def_consultas,
  ia.def_anomalia,
  ec.def_est_civil,
  g.def_gestacao,
  p.def_parto,
  rc.def_raca_cor,
  s.def_sexo
FROM 
  "NascidoVivo" nv
JOIN "Mae" m
  ON nv.id = m.id
JOIN "Registro" r
  ON nv.id = r.id
JOIN "LocalNascimento" ln
  ON nv."LOCNASC" = ln."LOCNASC"
JOIN "Escolaridade" e
  ON m."ESCMAE" = e."ESCMAE"
JOIN "Consultas" c
  ON nv."CONSULTAS" = c."CONSULTAS"
JOIN "idAnomalia" ia
  ON nv."IDANOMAL" = ia."IDANOMAL"
JOIN "EstadoCivil" ec
  ON m."ESTCIVMAE" = ec."ESTCIVMAE"
JOIN "Gestacao" g
  ON nv."GESTACAO" = g."GESTACAO"
JOIN "Parto" p
  ON nv."PARTO" = p."PARTO"
JOIN "RacaCor" rc
  ON nv."RACACOR" = rc."RACACOR"
JOIN "Sexo" s
  ON nv."SEXO" = s."SEXO";

 CREATE VIEW "DADOSNASCIDO_NOT_OTM_V3" as 
 SELECT nv.ano_nasc,
    nv."APGAR1",
    nv."APGAR5",
    nv."CODMUNNASC",
    nv."LOCNASC" AS locnasc_nv,
    nv."CODANOMAL" AS codanomal_nv,
    nv."GESTACAO" AS gestacao_nv,
    nv.contador,
    nv."GRAVIDEZ",
    nv."PARTO" AS parto_nv,
    nv."CONSULTAS" AS consultas_nv,
    nv."DTNASC",
    nv.data_nasc,
    nv.dia_semana_nasc,
    nv."HORANASC",
    nv."SEXO" AS sexo_nv,
    nv."RACACOR" AS racacor_nv,
    nv."PESO",
    nv."IDANOMAL" AS idanomal_nv,
    nv."CONSPRENAT",
    nv."MESPRENAT",
    nv."TPAPRESENT",
    nv."STTRABPART",
    nv."STCESPARTO",
    nv."TPNASCASSI",
    nv."KOTELCHUCK",
    nv."PARIDADE",
    nv."nasc_CODIGO_UF",
    nv.parto_prematuro,
    nv."STDNNOVA",
    nv."SEMAGESTAC",
    nv.id AS id_nv,
    m.id AS id_m,
    m."CODMUNNATU",
    m."CODMUNRES",
    m."IDADEMAE",
    m."ESTCIVMAE" AS estcivmae_m,
    m."ESCMAE" AS escmae_m,
    m."CODOCUPMAE",
    m."QTDFILVIVO",
    m."QTDFILMORT",
    m."NATURALMAE",
    m."CODUFNATU",
    m."RACACORMAE" AS racacormae_m,
    m."DTNASCMAE",
    m."SERIESCMAE",
    m."ESCMAE2010",
    m."QTDGESTANT",
    m."QTDPARTNOR",
    m."QTDPARTCES",
    m."DTULTMENST",
    m."TPMETESTIM",
    m."ESCMAEAGR1",
    m."CODPAISRES",
    m."res_CODIGO_UF",
    r.id AS id_r,
    r."ORIGEM",
    r."CODESTAB",
    r."DTCADASTRO",
    r."NUMEROLOTE",
    r."VERSAOSIST",
    r."DTRECEBIM",
    r."DIFDATA",
    r."DTRECORIGA",
    r."TPFUNCRESP",
    r."TPDOCRESP",
    r."DTDECLARAC",
    r."STDNEPIDEM",
    r."TPROBSON",
    ln.def_loc_nasc,
    e.def_escol_mae,
    c.def_consultas,
    ia.def_anomalia,
    ec.def_est_civil,
    g.def_gestacao,
    p.def_parto,
    rc.def_raca_cor,
    s.def_sexo
   FROM "NascidoVivo_not_otm" nv
     JOIN "Mae_not_otm" m ON nv.id = m.id
     JOIN "Registro_not_otm" r ON nv.id = r.id
     JOIN "LocalNascimento_not_otm" ln ON nv."LOCNASC" = ln."LOCNASC"
     JOIN "Escolaridade_not_otm" e ON m."ESCMAE" = e."ESCMAE"
     JOIN "Consultas_not_otm" c ON nv."CONSULTAS" = c."CONSULTAS"
     JOIN "idAnomalia_not_otm" ia ON nv."IDANOMAL" = ia."IDANOMAL"
     JOIN "Estadocivil_not_otm" ec ON m."ESTCIVMAE" = ec."ESTCIVMAE"
     JOIN "Gestacao_not_otm" g ON nv."GESTACAO" = g."GESTACAO"
     JOIN "Parto_not_otm" p ON nv."PARTO" = p."PARTO"
     JOIN "RacaCor_not_otm" rc ON nv."RACACOR" = rc."RACACOR"
     JOIN "Sexo_not_otm" s ON nv."SEXO" = s."SEXO";
