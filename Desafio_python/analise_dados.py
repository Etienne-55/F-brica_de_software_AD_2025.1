import pandas as pd
import matplotlib.pyplot as plt

caminho_do_arquivo = "C:/Users/etien/Downloads/dados_rh.csv"
df = pd.read_csv(caminho_do_arquivo)

print("Quantidade de linhas e colunas:")
print(df.shape)

print("\nDados nulos por coluna:")
print(df.isnull().sum())

print("\nTipos de dados por coluna:")
print(df.dtypes)

funcionarios_por_setor = df['Department'].value_counts()
funcionarios_por_setor.plot(kind='bar', color='skyblue')
plt.title('Quantidade de Funcionários por Setor')
plt.xlabel('Setor')
plt.ylabel('Quantidade de Funcionários')
plt.show()

funcionarios_por_escolaridade = df['Education'].value_counts().sort_index()
funcionarios_por_escolaridade.plot(kind='line', marker='o', color='green')
plt.title('Quantidade de Funcionários por Nível de Escolaridade')
plt.xlabel('Nível de Escolaridade')
plt.ylabel('Quantidade de Funcionários')
plt.show()

funcionarios_com_atrito = df['Attrition'].value_counts()
funcionarios_com_atrito.plot(kind='pie', autopct='%1.1f%%', colors=['lightcoral', 'lightskyblue'])
plt.title('Proporção de Funcionários com e sem Atrito na Empresa')
plt.ylabel('')
plt.show()