 Análise de Vendas - Northwind Traders (SQL )

Este projeto foi desenvolvido com base no banco de dados Northwind, amplamente utilizado para estudos de análise de dados.  
O objetivo foi responder perguntas de negócio reais utilizando consultas SQL e gerar insights, simulando o dia a dia de um analista de dados.

---

  Objetivos do Projeto

- Quantificar os produtos disponíveis e distribuí-los por categoria.  
- Identificar o país que mais gera receita.  
- Descobrir a categoria de produtos mais vendida.  
- Analisar o crescimento das vendas ao longo do tempo (ano a ano).  
- Calcular o lucro estimado por pedido (considerando descontos).  
- Encontrar clientes que compraram acima da média geral de gastos.

---

 Ferramentas Utilizadas

- SQL- PostgreSQL → para consultas e análise de dados.  
 
- GitHub → para versionamento e portfólio.  


Consultas SQL e Insights

Abaixo estão as principais consultas utilizadas, com suas explicações e insights de negócio.


1. Quantos produtos estão disponíveis e quantos por categoria 


SELECT COUNT(*) AS total_produtos
FROM products;

SELECT c.category_name, COUNT(p.product_id) AS total_produtos
FROM products p
JOIN categories c ON p.category_id = c.category_id
GROUP BY c.Category_name
ORDER BY total_produtos DESC; 



Insight:
Essa consulta revelou a distribuição de produtos por categoria.
As categorias “Bebidas” e “Confeitaria” apresentaram maior número de produtos, indicando que a empresa concentra seu portfólio nesses segmentos.
Isso pode refletir o foco estratégico da empresa ou oportunidades de expansão para categorias menores. 

2. País que mais gera receita


SELECT c.country, SUM(od.unit_price * od.quantity * (1 - od.discount)) AS receita_total
FROM orders o
JOIN order_details od ON o.order_id = od.order_id
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.country
ORDER BY receita_total DESC
limit 1 


Insight:
O país com maior receita é o Estados Unidos, o que indica que a maior parte da base de clientes rentáveis está localizada lá.
Esse dado é essencial para direcionar estratégias de marketing, logística e relacionamento com clientes. 


3. Categoria de produtos mais vendida 


SELECT cat.category_name, SUM(od.unit_price * od.quantity * (1 - od.discount)) AS total_vendas
FROM order_details od
JOIN products p ON od.product_id = p.product_id
JOIN categories cat ON p.category_id = cat.category_id
GROUP BY cat.category_name
ORDER BY total_vendas DESC
LIMIT 1;


Insight:
A categoria “Confeitaria” foi a mais vendida, tanto em volume quanto em valor de vendas.
Essa informação é útil para manter um bom nível de estoque e investir em promoções relacionadas a produtos desse grupo. 


4. Crescimento das vendas ao longo do tempo (ano a ano) 


SELECT EXTRACT(YEAR FROM o.order_date) AS ano,
       SUM(od.unit_price * od.quantity * (1 - od.discount)) AS receita_ano
FROM orders o
JOIN order_details od ON o.order_id = od.order_id
GROUP BY ano
ORDER BY ano;


Insight:
Ao analisar as vendas ano a ano, observamos crescimento consistente até 1997, com leve estabilização depois.
Isso indica que a empresa manteve um bom desempenho, podendo explorar novas estratégias de expansão ou produtos sazonais. 


5. Lucro estimado por pedido 


SELECT o.order_id,
       SUM(od.unit_price * od.quantity * (1 - od.discount)) AS lucro_estimado
FROM orders o
JOIN order_details od ON o.order_id = od.order_id
GROUP BY o.order_id
ORDER BY lucro_estimado DESC;


Insight:
Essa consulta permite visualizar os pedidos mais lucrativos.
Foi possível perceber que alguns pedidos de grande volume geram lucros bem superiores, enquanto pedidos com alto desconto reduzem a margem.
Isso ajuda a ajustar políticas de precificação e promoções. 


6. Clientes que compraram acima da média geral de gastos 

WITH gastos_clientes AS (
    SELECT o.customer_id, SUM(od.unit_price * od.quantity * (1 - od.discount)) AS total_gasto
    FROM orders o
    JOIN order_details od ON o.order_id = od.order_id
    GROUP BY o.Customer_id
)
SELECT c.customer_id, c.company_name, g.total_gasto
FROM gastos_clientes g
JOIN customers c ON g.customer_id = c.customer_id
WHERE g.total_gasto > (SELECT AVG(total_gasto) FROM gastos_clientes)
ORDER BY g.total_gasto DESC; 


Insight:
Essa análise identificou os clientes VIPs, que gastam acima da média geral.
Reconhecer esses clientes é essencial para estratégias de fidelização e atendimento personalizado, garantindo aumento na retenção e no ticket médio. 


- Resumo Geral dos Principais Insights

Pergunta de Negócio	Insight Principal
Produtos por categoria	“Bebidas” e “Confeitaria” dominam o catálogo
País mais lucrativo	Estados Unidos geram a maior receita
Categoria mais vendida	“Confeitaria” é a categoria mais rentável
Crescimento anual	Crescimento constante até 1997
Lucro por pedido	Pedidos grandes concentram maior lucro
Clientes acima da média	Pequeno grupo de clientes gera alta receita


- Conclusão

A análise do banco de dados Northwind forneceu uma visão completa sobre o desempenho de vendas, categorias, clientes e tendências ao longo do tempo.
Esses resultados ajudam a empresa a tomar decisões mais estratégicas, como otimizar o portfólio de produtos, fortalecer mercados rentáveis e fidelizar os melhores clientes.

Sobre o Analista

Gustavo Sousa Paulo
🎓 Estudante de Engenharia de Software | Apaixonado por Dados
Busco minha primeira oportunidade na área de analise de dados, com foco em transformar dados em decisões que gerem impacto real.




