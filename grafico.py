import matplotlib.pyplot as plt
import seaborn as sns
import pandas as pd

# Dados para os modelos
data = {
    'Modelo': ['XGB', 'Random Forest', 'SVM'],
    'Preditos catalogados no PDB': [22, 22, 22],
    'Preditos não encontrados no PDB': [6, 6, 13]
}

df = pd.DataFrame(data)

# Configuração do gráfico
plt.figure(figsize=(10, 6))

colors = ['#1f77b4', '#ff7f0e']  # Azul para 'Preditos no PDB', Laranja para 'Não Encontrados no PDB'

# Criar o gráfico de barras
barplot = sns.barplot(
    x='Modelo', y='value', hue='variable', 
    data=pd.melt(df, id_vars='Modelo', var_name='variable', value_name='value'),
    palette=colors
)

# Ajuste do eixo y
plt.yticks(range(0, 30, 5))  

for p in barplot.patches:
    height = p.get_height()
    if height > 0:  
        barplot.annotate(
            f'{int(height)}', 
            (p.get_x() + p.get_width() / 2., height), 
            ha='center', va='bottom', 
            xytext=(0, 3),  
            textcoords='offset points'
        )

# Adiciona título e labels
plt.title('Comparação dos Resíduos Preditos como Sítios de Ligação')
plt.xlabel('Modelo')
plt.ylabel('Número de Resíduos')
plt.legend(title='Categoria')

# Exibição do gráfico
plt.tight_layout()
plt.show()
