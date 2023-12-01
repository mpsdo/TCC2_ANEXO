CREATE OR REPLACE FUNCTION DADOSNASCIDO_V3()
RETURNS void AS $$
DECLARE
    fim_otimizado TIMESTAMP;
    fim_nao_otimizado TIMESTAMP;
BEGIN
    -- Executa a primeira view e armazena o horário de término
    PERFORM * FROM public."DADOSNASCIDO_OTM_V3";
    fim_otimizado := clock_timestamp();

    -- Executa a segunda view e armazena o horário de término
    PERFORM * FROM public."DADOSNASCIDO_NOT_OTM_V3";
    fim_nao_otimizado := clock_timestamp();

    -- Insere os dados na tabela
    INSERT INTO public.tempo (tempo_otimizado, tempo_nao_otimizado, nome_view, nome_view_not_otm)
    VALUES (fim_otimizado, fim_nao_otimizado, 'DADOSNASCIDO_OTM_V3', 'DADOSNASCIDO_NOT_OTM_V3');
END;
$$ LANGUAGE plpgsql;
