Análise de vendas do Walmart

Este projeto tem como objetivo analisar os dados de vendas semanais do Walmart, utilizando SQL para a análise exploratória e Power BI para a visualização dos dados.
O foco é responder perguntas estratégicas de negócio com base nas informações disponíveis no dataset.


Objetivos do Projeto

Analisar o comportamento das vendas ao longo do tempo (anos e meses)
Avaliar a influência da temperatura nas vendas
Identificar quais lojas possuem maior volume de vendas



 - Fonte dos Dados

[Walmart Sales – Kaggle](https://www.kaggle.com/datasets/mikhail1681/walmart-sales)

> Os nomes das colunas foram traduzidos para o português durante o processo de análise.

 Dashboard no Power BI

 Imagem do dashboard:

[Dashboard Walmart](dashboard.png.png)

> O dashboard foi desenvolvido no Power BI Desktop com base nas consultas SQL elaboradas neste projeto.


 - Análises e Consultas SQL

 - Como estão as vendas ao longo dos anos?

SELECT
    EXTRACT(YEAR FROM data_venda) AS ano,
    SUM(vendas_semanais) AS total_vendas,
    AVG(vendas_semanais) AS media_vendas
FROM walmart_sales
GROUP BY EXTRACT(YEAR FROM data_venda)
ORDER BY ano;

resultado: (vendas_ao_longo_dos_anos.png)

- Insight:
O volume total de vendas aumentou em 2011 em comparação com 2010, sugerindo um crescimento no desempenho da rede Walmart durante o período analisado.

- Como estão as vendas ao longo dos meses?

SELECT
    EXTRACT(YEAR FROM data_venda) AS ano,
    EXTRACT(MONTH FROM data_venda) AS mes,
    SUM(vendas_semanais) AS total_vendas
FROM walmart_sales
GROUP BY ano, mes
ORDER BY ano, mes;

resultado:(‎vendas_ao_longo_dos_meses.png)

-Insight:
Meses como março, julho e dezembro apresentam picos de vendas, o que pode indicar sazonalidade influenciada por feriados ou eventos específicos. 


- Como a temperatura influencia nas vendas?

SELECT
    CASE
        WHEN temperatura < 0 THEN '<0°C'
        WHEN temperatura BETWEEN 0 AND 10 THEN '0-10°C'
        WHEN temperatura BETWEEN 10 AND 20 THEN '10-20°C'
        WHEN temperatura BETWEEN 20 AND 30 THEN '20-30°C'
        ELSE '>30°C'
    END AS faixa_temperatura,
    AVG(vendas_semanais) AS media_vendas
FROM walmart_sales
GROUP BY faixa_temperatura
ORDER BY faixa_temperatura;

resultado:(temperatura_influencia_nas_vendas.png)
 
 Insight:
A faixa de temperatura entre 10°C e 30°C está associada a uma média maior de vendas semanais, indicando que o clima mais ameno pode incentivar o consumo. 


- Quais lojas mais vendem?

SELECT
    loja,
    SUM(vendas_semanais) AS total_vendas
FROM walmart_sales
GROUP BY loja
ORDER BY total_vendas DESC;

Resultado:(Quais_lojas_mais_vendem.png)

Insight:
As lojas 2, 4 e 17 apresentam os maiores volumes de vendas, sendo pontos estratégicos para campanhas e estoques.


- Tecnologias 

PostgreSQL - consultas e análise exploratória

Power BI Desktop - visualização e construção do dashboard

Data Storytelling 

GitHub - versionamento e portfólio do projeto


- Conclusão

O projeto permitiu identificar padrões sazonais, crescimento de vendas e a relação entre clima e desempenho das lojas.

Os resultados podem apoiar decisões estratégicas sobre estoque, marketing e previsão de demanda.
