# Chicago Crime Data Warehouse – 8M+ rows cleaned with dbt + BigQuery

**Pipeline completo de limpeza dos dados públicos de crimes de Chicago (2001–2025)**  
De logs brutos da polícia → tabela 100 % limpa e pronta para análise ou ML.

**Live Dashboard (Looker Studio – atualiza automaticamente)**  
https://lookerstudio.google.com/reporting/91ab3ed8-d170-41f4-99b0-87a61688ba65

### O que foi feito (limpeza real de produção)
| Etapa                        | Linhas       | Resultado                                          |
|------------------------------|--------------|----------------------------------------------------|
| `stg_crime__raw`             | ~8.1 M       | Dados brutos do `bigquery-public-data`             |
| `stg_crime__cleaned`         | ~7.9 M       | Duplicatas removidas, coordenadas validadas        |
| `fct_crime_clean` (final)    | ~7.85 M      | Tabela final pronta para dashboard e modelos de ML |

### 5 regras de limpeza aplicadas
1. Remoção de duplicatas (`unique_key`)
2. Conversão e extração de data → `date_ts`, `year`, `month`
3. Tratamento de coordenadas (lat/long fora de Chicago → removidas)
4. Padronização de categorias (`primary_type`, `description`)
5. Testes de qualidade automatizados (dbt tests)

### Tech Stack
![dbt](https://img.shields.io/badge/dbt-%23FF6B6B.svg?style=for-the-badge&logo=dbt&logoColor=white)
![BigQuery](https://img.shields.io/badge/BigQuery-4285F4?style=for-the-badge&logo=google-cloud&logoColor=white)
![Looker Studio](https://img.shields.io/badge/Looker_Studio-F9AB00?style=for-the-badge&logo=google-cloud&logoColor=white)

### Como rodar localmente
```bash
dbt run      # cria as 3 tabelas no seu BigQuery (grátis)
dbt test     # 5 testes de qualidade → tudo PASS