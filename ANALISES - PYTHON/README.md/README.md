Análise de Vendas com Python

Projeto de análise exploratória de dados de vendas utilizando Python, com foco em identificar padrões de comportamento, gerar insights de negócio e praticar habilidades de análise de dados.

---

- autor

Gustavo Sousa Paulo  
Estudante do último ano de Engenharia de Software  
Apaixonado por dados, análise e soluções orientadas por informação

---

 Objetivo

Explorar dados de vendas para responder perguntas como:

- Quais meses têm maior faturamento?
- Quais produtos são mais vendidos?
- Quais cidades mais compram?
- Existe relação entre preço e quantidade vendida?

---

 Tecnologias e Ferramentas

- Python 3.x  
- Jupyter Notebook  
- Pandas  
- Matplotlib  
- Seaborn  

---

Análises Realizadas

1. **Faturamento por Mês**  
   → Identifica a sazonalidade nas vendas (ex: dezembro é o pico)

2. **Vendas por Cidade**  
   → Mostra onde está a maior concentração de receita


3. **Preço vs Quantidade Vendida**  
   → Avalia se há sensibilidade ao preço entre os consumidores

---

 Principais Insights

- Dezembro teve o maior faturamento — evidência de sazonalidade no fim de ano.
- São Francisco e Los Angeles lideram em receita.
- Existe uma tendência de que produtos mais baratos vendem mais.

---

## 📁 Estrutura do Projeto

ANALISE_DE_VENDAS_PYTHON/
│
├── Sales_Data.csv
├── analise_vendas.ipynb
├── README.md
└── graficos/
├── vendas_por_mes.png
├── vendas_por_cidade.png
├── preco_vs_quantidade.png
└── heatmap_cidade_mes.png                


---

 Etapas do Projeto

1️ Carregamento dos Dados
Os dados foram carregados a partir do arquivo `Sales_Data.csv`, garantindo que a codificação fosse compatível (`utf-8` ou `latin1`) e que todos os nomes de colunas fossem padronizados.

---

2 Limpeza e Preparação dos Dados
- Remoção de linhas nulas.
- Conversão de datas para o tipo datetime.
- Padronização das colunas (`lowercase`, sem espaços, underscores).
- Criação de colunas auxiliares (`month_id`, `sales`, `city`).

---
3️ Análise Exploratória e Visualizações


 Faturamento por Mês
![Faturamento por Mês](graficos/vendas_por_mes.png)

Insight: O mês com maior faturamento normalmente é dezembro, indicando sazonalidade de fim de ano.

---

Faturamento por Cidade
![Faturamento por Cidade](graficos/vendas_por_cidade.png)

Insight: Cidades como São Francisco e Los Angeles concentram a maior parte das receitas, sendo os principais mercados.

---

 Relação entre Preço e Quantidade Vendida
![Preço vs Quantidade](graficos/preco_vs_quantidade.png)

Insight: Observa-se que, em geral, quanto maior o preço, menor a quantidade vendida, mostrando sensibilidade ao preço.

---

Heatmap: Faturamento por Cidade e Mês
![Heatmap Cidade x Mês](graficos/heatmap_cidade_mes.png)

Insight:Permite visualizar a distribuição do faturamento ao longo dos meses em cada cidade, identificando sazonalidades regionais.

---

 Conclusões
- Dezembro apresenta o maior volume de vendas, indicando pico sazonal de fim de ano.
- Algumas cidades concentram a maior parte da receita.
- Existe uma relação negativa entre preço e quantidade vendida.
- O heatmap mostra como o faturamento varia por cidade e por mês, permitindo decisões estratégicas para vendas e marketing.

---

 Observações
- Todas as análises foram feitas com Python, usando bibliotecas **Pandas**, **Matplotlib** e **Seaborn**.
- Os gráficos foram exportados para a pasta `graficos/` para fácil inclusão no README e apresentação do projeto.
