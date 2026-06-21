[🇺🇸 English](readme.en.md) | [🇧🇷 Português](readme.md)

# Análise Exploratória: Emissões e Consumo de Combustíveis (PBEV 2026)

Este repositório contém uma Análise Exploratória de Dados (EDA) focada nas consequências ambientais das emissões de automóveis a combustão no Brasil, comparando a eficiência e o impacto do etanol frente aos combustíveis fósseis.

## Sobre o Projeto

A emissão de poluentes advinda de veículos a combustão é um dos maiores desafios urbanos modernos, contribuindo para a poluição do ar e o efeito estufa. No Brasil, o **Proconve** atua há 40 anos na regulamentação dessas emissões, alcançando uma redução de até 98% na emissão de monóxido de carbono por veículo desde a sua criação.

O objetivo principal desta análise é investigar o impacto do biocombustível **etanol** na diminuição da poluição em comparação à **gasolina e ao óleo diesel**, quantificando o CO2 evitado anualmente por categoria veicular e analisando a relação de consumo (km/l).

---

## Base de Dados

Os dados utilizados são do **Programa Brasileiro de Etiquetagem Veicular (PBEV 2026)**, mantido pelo **INMETRO** em parceria com o Programa CONPET (Petrobras), Ministério de Minas e Energia, Ministério do Meio Ambiente e Ibama. 

**Variáveis analisadas:**
* Categoria do veículo
* Emissão de CO2 total e CO2 fóssil (g/km)
* Consumo combinado (km/l)

---

## Principais Resultados

* **Emissão de CO2:** A distribuição dos dados mostra que os veículos movidos a gasolina/diesel operam em patamares de emissão de CO2 significativamente mais altos por quilômetro rodado quando comparados aos movidos a etanol.
* **Consumo e Rendimento:** O rendimento do etanol (variando entre 5,7 e 11,9 km/l) é inferior ao da gasolina/diesel (entre 4,7 e 17,2 km/l). A vantagem ambiental exige uma avaliação conjunta com o maior volume de combustível consumido.
* **Impacto Anual Positivo:** Em todas as categorias com dados disponíveis, o etanol apresenta uma redução média de CO2. Considerando 13.000 km rodados anualmente, as maiores reduções de impacto ocorrem nas categorias **Comercial** (evitando cerca de 770 kg de CO2/ano), **Fora de Estrada Grande** (≈ 529 kg/ano) e **Picape** (≈ 517 kg/ano).
* **Ciclo do Carbono:** Por ser de origem vegetal, o etanol possui um ciclo fechado (fotossíntese/respiração), não introduzindo carbono "novo" na atmosfera, o que amplia substancialmente sua vantagem ecológica sobre os fósseis.

---

## Desafios e Próximos Passos

A base de dados apresentou alguns desafios que moldaram as limitações do estudo, abrindo espaço para melhorias futuras:

**Limitações:**
* Alta presença de valores ausentes (NAs) referentes à emissão de etanol em versões de veículos que não são flex.
* Amostragem baixa em certas categorias de veículos, limitando comparações estatísticas mais profundas.

**Trabalhos Futuros:**
* Incorporação dos preços atuais dos combustíveis para calcular a viabilidade e o custo financeiro por quilômetro rodado de cada categoria.
* Análise temporal comparando a eficiência energética e a evolução das emissões ano a ano.

---

## Tecnologias Utilizadas

A análise foi desenvolvida na linguagem **R**, utilizando o formato Quarto/R Markdown, com suporte dos seguintes pacotes:

* `tidyverse` (Manipulação de dados)
* `ggridges` e `patchwork` (Visualização de distribuições e layout de gráficos)
* `ggiraph` (Gráficos interativos)
* `gt` e `gtExtras` (Estruturação e estilização de tabelas de alta qualidade)
* `formattable` e `wesanderson` (Estética e paletas de cores)

> **Nota sobre o uso de IA:** O modelo Claude (Opus 4.8) foi utilizado como ferramenta de suporte para revisão de sintaxe, alinhamento visual de componentes interativos (`geom_density_ridges` e `geom_boxplot` com `ggiraph`) e elaboração da animação vetorial (SVG) ilustrando o ciclo do carbono presente no documento original.