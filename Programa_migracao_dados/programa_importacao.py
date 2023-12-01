import os
import pandas as pd
from sqlalchemy import create_engine

# Correção da string de conexão
username = ''  # Substitua 'postgres' pelo seu nome de usuário real, se for diferente
password = ''
host = ''
port = 
database = ''

db_url = f'postgresql://{username}:{password}@{host}:{port}/{database}'
engine = create_engine(db_url)

# Leitura do arquivo XLS com o dicionário de colunas
xls_file = 'dicionario_de_variaveis.xlsx'
df_dicionario = pd.read_excel(xls_file)

# Criação da tabela no PostgreSQL com base no dicionário de colunas
df_dicionario.to_sql('tabela_final', engine, if_exists='replace', index=False)

# Pasta onde estão os arquivos CSV
pasta_csv = './'

# Percorre os arquivos CSV na pasta
for arquivo_csv in os.listdir(pasta_csv):
    if arquivo_csv.endswith('.csv'):
        caminho_csv = os.path.join(pasta_csv, arquivo_csv)

        # Leitura do arquivo CSV
        df_csv = pd.read_csv(caminho_csv)

        # Verificação da estrutura da tabela
        if not df_csv.columns.equals(df_dicionario.columns):
            # Se a estrutura for diferente, cria uma nova tabela no PostgreSQL
            df_csv.to_sql(f'tabela_{arquivo_csv[:-4]}', engine, if_exists='replace', index=False)
        else:
            # Se a estrutura for igual, importa os dados para a tabela existente
            df_csv.to_sql('tabela_final', engine, if_exists='append', index=False)

print("Processo de importação concluído.")
