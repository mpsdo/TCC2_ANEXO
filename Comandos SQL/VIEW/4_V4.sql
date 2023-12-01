CREATE VIEW "COMPLEXIDADE_OTM_V4" AS  
SELECT nv.ano_nasc,
    nv."APGAR1",
    nv."APGAR5",
    nv."CODMUNNASC",
    nv."LOCNASC",
    nv."CODANOMAL",
    nv."GESTACAO",
    nv.contador,
    nv."GRAVIDEZ",
    nv."PARTO",
    nv."CONSULTAS",
    nv."DTNASC",
    nv.data_nasc,
    nv.dia_semana_nasc,
    nv."HORANASC",
    nv."SEXO",
    nv."RACACOR",
    nv."PESO",
    nv."IDANOMAL",
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
    nv.id,
    m.id AS m_id,
    m."CODMUNNATU",
    m."CODMUNRES",
    m."IDADEMAE",
    m."ESTCIVMAE",
    m."ESCMAE",
    m."CODOCUPMAE",
    m."QTDFILVIVO",
    m."QTDFILMORT",
    m."NATURALMAE",
    m."CODUFNATU",
    m."RACACORMAE",
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
    r.id AS r_id,
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
    ln."LOCNASC" AS ln_locnasc,
    ln.def_loc_nasc,
    e."ESCMAE" AS e_escmae,
    e.def_escol_mae,
    c."CONSULTAS" AS c_consultas,
    c.def_consultas,
    ia."IDANOMAL" AS ia_idanomal,
    ia.def_anomalia,
    ec."ESTCIVMAE" AS ec_estcivmae,
    ec.def_est_civil,
    g."GESTACAO" AS g_gestacao,
    g.def_gestacao,
    p."PARTO" AS p_parto,
    p.def_parto,
    rc."RACACOR" AS rc_racacor,
    rc.def_raca_cor,
    s."SEXO" AS s_sexo,
    s.def_sexo,
    ( SELECT count(*) AS count
           FROM "Gestacao"
          WHERE "Gestacao"."GESTACAO" = nv."GESTACAO") AS "TotalGestacoes",
    ( SELECT avg(m2."IDADEMAE") AS avg
           FROM "Mae" m2
          WHERE m2."ESCMAE" = m."ESCMAE") AS "MediaIdadeMaePorEscolaridade",
    ( SELECT max("Consultas"."CONSULTAS") AS max
           FROM "Consultas") AS "MaximoConsultasPreNatal"
   FROM "NascidoVivo" nv
     JOIN "Mae" m ON nv.id = m.id
     JOIN "Registro" r ON nv.id = r.id
     JOIN "LocalNascimento" ln ON nv."LOCNASC" = ln."LOCNASC"
     JOIN "Escolaridade" e ON m."ESCMAE" = e."ESCMAE"
     JOIN "Consultas" c ON nv."CONSULTAS" = c."CONSULTAS"
     JOIN "idAnomalia" ia ON nv."IDANOMAL" = ia."IDANOMAL"
     JOIN "EstadoCivil" ec ON m."ESTCIVMAE" = ec."ESTCIVMAE"
     JOIN "Gestacao" g ON nv."GESTACAO" = g."GESTACAO"
     JOIN "Parto" p ON nv."PARTO" = p."PARTO"
     JOIN "RacaCor" rc ON nv."RACACOR" = rc."RACACOR"
     JOIN "Sexo" s ON nv."SEXO" = s."SEXO"
  WHERE nv."GRAVIDEZ" > 1 AND m."IDADEMAE"::numeric >= (( SELECT avg("Mae"."IDADEMAE") AS avg
           FROM "Mae"))
  ORDER BY nv.ano_nasc, nv."PESO" DESC;


CREATE VIEW "COMPLEXIDADE_NOT_OTM_V4" as 
 SELECT nv.ano_nasc,
    nv."APGAR1",
    nv."APGAR5",
    nv."CODMUNNASC",
    nv."LOCNASC",
    nv."CODANOMAL",
    nv."GESTACAO",
    nv.contador,
    nv."GRAVIDEZ",
    nv."PARTO",
    nv."CONSULTAS",
    nv."DTNASC",
    nv.data_nasc,
    nv.dia_semana_nasc,
    nv."HORANASC",
    nv."SEXO",
    nv."RACACOR",
    nv."PESO",
    nv."IDANOMAL",
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
    nv.id,
    m.id AS m_id,
    m."CODMUNNATU",
    m."CODMUNRES",
    m."IDADEMAE",
    m."ESTCIVMAE",
    m."ESCMAE",
    m."CODOCUPMAE",
    m."QTDFILVIVO",
    m."QTDFILMORT",
    m."NATURALMAE",
    m."CODUFNATU",
    m."RACACORMAE",
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
    r.id AS r_id,
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
    ln."LOCNASC" AS ln_locnasc,
    ln.def_loc_nasc,
    e."ESCMAE" AS e_escmae,
    e.def_escol_mae,
    c."CONSULTAS" AS c_consultas,
    c.def_consultas,
    ia."IDANOMAL" AS ia_idanomal,
    ia.def_anomalia,
    ec."ESTCIVMAE" AS ec_estcivmae,
    ec.def_est_civil,
    g."GESTACAO" AS g_gestacao,
    g.def_gestacao,
    p."PARTO" AS p_parto,
    p.def_parto,
    rc."RACACOR" AS rc_racacor,
    rc.def_raca_cor,
    s."SEXO" AS s_sexo,
    s.def_sexo,
    ( SELECT count(*) AS count
           FROM "Gestacao"
          WHERE "Gestacao"."GESTACAO" = nv."GESTACAO") AS "TotalGestacoes",
    ( SELECT avg(m2."IDADEMAE") AS avg
           FROM "Mae" m2
          WHERE m2."ESCMAE" = m."ESCMAE") AS "MediaIdadeMaePorEscolaridade",
    ( SELECT max("Consultas"."CONSULTAS") AS max
           FROM "Consultas") AS "MaximoConsultasPreNatal"
   FROM "NascidoVivo" nv
     JOIN "Mae_not_otm" m ON nv.id = m.id
     JOIN "Registro_not_otm" r ON nv.id = r.id
     JOIN "LocalNascimento_not_otm" ln ON nv."LOCNASC" = ln."LOCNASC"
     JOIN "Escolaridade_not_otm" e ON m."ESCMAE" = e."ESCMAE"
     JOIN "Consultas_not_otm" c ON nv."CONSULTAS" = c."CONSULTAS"
     JOIN "idAnomalia_not_otm" ia ON nv."IDANOMAL" = ia."IDANOMAL"
     JOIN "EstadoCivil_not_otm" ec ON m."ESTCIVMAE" = ec."ESTCIVMAE"
     JOIN "Gestacao_not_otm" g ON nv."GESTACAO" = g."GESTACAO"
     JOIN "Parto_not_otm" p ON nv."PARTO" = p."PARTO"
     JOIN "RacaCor_not_otm" rc ON nv."RACACOR" = rc."RACACOR"
     JOIN "Sexo_not_otm" s ON nv."SEXO" = s."SEXO"
  WHERE nv."GRAVIDEZ" > 1 AND m."IDADEMAE"::numeric >= (( SELECT avg("Mae"."IDADEMAE") AS avg
           FROM "Mae"))
  ORDER BY nv.ano_nasc, nv."PESO" DESC;





