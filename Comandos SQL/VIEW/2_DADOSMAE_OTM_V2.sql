/* CRIACAO DA VIEW COM BASE NO SEGUNDO SELECT */


CREATE VIEW DADOSMAE_OTM_V2 AS
SELECT 
    a.ano_nasc, 
    a."APGAR1", 
    a."APGAR5", 
    a."CODMUNNASC", 
    a."LOCNASC", 
    a."CODANOMAL", 
    a."GESTACAO", 
    a.contador, 
    a."GRAVIDEZ", 
    a."PARTO", 
    a."CONSULTAS", 
    a."DTNASC", 
    a.data_nasc, 
    a.dia_semana_nasc, 
    a."HORANASC", 
    a."SEXO", 
    a."RACACOR" as racacor_nascido, 
    a."PESO", 
    a."IDANOMAL", 
    a."CONSPRENAT", 
    a."MESPRENAT", 
    a."TPAPRESENT", 
    a."STTRABPART", 
    a."STCESPARTO", 
    a."TPNASCASSI", 
    a."KOTELCHUCK", 
    a."PARIDADE", 
    a."nasc_CODIGO_UF", 
    a.parto_prematuro, 
    a."STDNNOVA", 
    a."SEMAGESTAC", 
    a.id as id_nascido,
    b.id as id_mae, 
    b."CODMUNNATU", 
    b."CODMUNRES", 
    b."IDADEMAE", 
    b."ESTCIVMAE" as estcivmae_mae, 
    b."ESCMAE" as escmae_mae, 
    b."CODOCUPMAE", 
    b."QTDFILVIVO", 
    b."QTDFILMORT", 
    b."NATURALMAE", 
    b."CODUFNATU", 
    b."RACACORMAE" as racacormae_mae, 
    b."DTNASCMAE", 
    b."SERIESCMAE", 
    b."ESCMAE2010", 
    b."QTDGESTANT", 
    b."QTDPARTNOR", 
    b."QTDPARTCES", 
    b."DTULTMENST", 
    b."TPMETESTIM", 
    b."ESCMAEAGR1", 
    b."CODPAISRES", 
    b."res_CODIGO_UF",
    c.id as id_registro,
    c."ORIGEM", 
    c."CODESTAB", 
    c."DTCADASTRO", 
    c."NUMEROLOTE", 
    c."VERSAOSIST", 
    c."DTRECEBIM", 
    c."DIFDATA", 
    c."DTRECORIGA", 
    c."TPFUNCRESP", 
    c."TPDOCRESP", 
    c."DTDECLARAC", 
    c."STDNEPIDEM", 
    c."TPROBSON",
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
    ON b."RACACORMAE" = f."RACACOR"; 

CREATE VIEW DADOSMAE_NOT_OTM_V2 AS
SELECT 
    a.ano_nasc, 
    a."APGAR1", 
    a."APGAR5", 
    a."CODMUNNASC", 
    a."LOCNASC", 
    a."CODANOMAL", 
    a."GESTACAO", 
    a.contador, 
    a."GRAVIDEZ", 
    a."PARTO", 
    a."CONSULTAS", 
    a."DTNASC", 
    a.data_nasc, 
    a.dia_semana_nasc, 
    a."HORANASC", 
    a."SEXO", 
    a."RACACOR" as racacor_nascido, 
    a."PESO", 
    a."IDANOMAL", 
    a."CONSPRENAT", 
    a."MESPRENAT", 
    a."TPAPRESENT", 
    a."STTRABPART", 
    a."STCESPARTO", 
    a."TPNASCASSI", 
    a."KOTELCHUCK", 
    a."PARIDADE", 
    a."nasc_CODIGO_UF", 
    a.parto_prematuro, 
    a."STDNNOVA", 
    a."SEMAGESTAC", 
    a.id as id_nascido,
    b.id as id_mae, 
    b."CODMUNNATU", 
    b."CODMUNRES", 
    b."IDADEMAE", 
    b."ESTCIVMAE" as estcivmae_mae, 
    b."ESCMAE" as escmae_mae, 
    b."CODOCUPMAE", 
    b."QTDFILVIVO", 
    b."QTDFILMORT", 
    b."NATURALMAE", 
    b."CODUFNATU", 
    b."RACACORMAE" as racacormae_mae, 
    b."DTNASCMAE", 
    b."SERIESCMAE", 
    b."ESCMAE2010", 
    b."QTDGESTANT", 
    b."QTDPARTNOR", 
    b."QTDPARTCES", 
    b."DTULTMENST", 
    b."TPMETESTIM", 
    b."ESCMAEAGR1", 
    b."CODPAISRES", 
    b."res_CODIGO_UF",
    c.id as id_registro,
    c."ORIGEM", 
    c."CODESTAB", 
    c."DTCADASTRO", 
    c."NUMEROLOTE", 
    c."VERSAOSIST", 
    c."DTRECEBIM", 
    c."DIFDATA", 
    c."DTRECORIGA", 
    c."TPFUNCRESP", 
    c."TPDOCRESP", 
    c."DTDECLARAC", 
    c."STDNEPIDEM", 
    c."TPROBSON",
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
    ON b."RACACORMAE" = f."RACACOR";



/* SELECT BASE */

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