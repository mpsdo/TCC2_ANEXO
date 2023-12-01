CREATE OR REPLACE PROCEDURE EXECUTA_V1()
LANGUAGE plpgsql
AS $$
DECLARE
    inicio TIMESTAMP;
    fim TIMESTAMP;
    tempo_exec1 NUMERIC(10, 3);
    tempo_exec2 NUMERIC(10, 3);
BEGIN
    -- Executa a primeira view e calcula o tempo em segundos com milissegundos
    inicio := clock_timestamp();
    PERFORM * FROM "CONSOLIDA_OTM_V1";  -- Substitua 'view1' pelo nome real da sua view
    fim := clock_timestamp();
    tempo_exec1 := EXTRACT(EPOCH FROM (fim - inicio)) * 1000;

    -- Executa a segunda view e calcula o tempo em segundos com milissegundos
    inicio := clock_timestamp();
    PERFORM * FROM "CONSOLIDA_NOT_OTM_V1";  -- Substitua 'view2' pelo nome real da sua view
    fim := clock_timestamp();
    tempo_exec2 := EXTRACT(EPOCH FROM (fim - inicio)) * 1000;

    -- Insere os dados na tabela tempo2
    INSERT INTO tempo2 (data_execucao, tempo_otimizado, tempo_nao_otimizado, nome_view, nome_view_not_otm)
    VALUES (NOW(), tempo_exec1, tempo_exec2, 'CONSOLIDA_OTM_V1', 'CONSOLIDA_NOT_OTM_V1');
END;
$$;