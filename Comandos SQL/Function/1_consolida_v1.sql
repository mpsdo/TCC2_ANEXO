
DECLARE
    fim_otimizado TIMESTAMP;
    fim_nao_otimizado TIMESTAMP;
BEGIN
    -- Executa a primeira view e armazena o horário de término
    PERFORM * FROM public."CONSOLIDA_OTM_V1";
    fim_otimizado := clock_timestamp();

    -- Executa a segunda view e armazena o horário de término
    PERFORM * FROM public."CONSOLIDA_NOT_OTM_V1";
    fim_nao_otimizado := clock_timestamp();

    -- Insere os dados na tabela
    INSERT INTO public.tempo (tempo_otimizado, tempo_nao_otimizado, nome_view, nome_view_not_otm)
    VALUES (fim_otimizado, fim_nao_otimizado, 'CONSOLIDA_OTM_V1', 'CONSOLIDA_NOT_OTM_V1');
END;
