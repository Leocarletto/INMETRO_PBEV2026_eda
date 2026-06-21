[🇺🇸 English](README.en.md) | [🇧🇷 Português](README.md)

# Exploratory Data Analysis: Fuel Emissions and Consumption (PBEV 2026)

This repository contains an Exploratory Data Analysis...

# Exploratory Data Analysis: Fuel Emissions and Consumption (PBEV 2026)

This repository contains an Exploratory Data Analysis (EDA) focused on the environmental consequences of combustion engine vehicle emissions in Brazil, comparing the efficiency and impact of ethanol against fossil fuels.

## About the Project

Pollutant emissions from combustion vehicles are one of the greatest modern urban challenges, contributing to air pollution and the greenhouse effect. In Brazil, **Proconve** has been regulating these emissions for 40 years, achieving up to a 98% reduction in carbon monoxide emissions per vehicle since its creation.

The main objective of this analysis is to investigate the impact of the biofuel **ethanol** on reducing pollution compared to **gasoline and diesel**, quantifying the CO2 avoided annually by vehicle category and analyzing the consumption ratio (km/l).

---

## Dataset

The data used comes from the **Brazilian Vehicular Labeling Program (PBEV 2026)**, maintained by **INMETRO** in partnership with the CONPET Program (Petrobras), Ministry of Mines and Energy, Ministry of Environment, and Ibama. 

**Analyzed variables:**
* Vehicle category
* Total CO2 and fossil CO2 emissions (g/km)
* Combined consumption (km/l)

---

## Key Findings

* **CO2 Emissions:** The data distribution shows that gasoline/diesel-powered vehicles operate at significantly higher CO2 emission levels per kilometer driven when compared to ethanol-powered ones.
* **Consumption and Efficiency:** Ethanol's efficiency (ranging between 5.7 and 11.9 km/l) is lower than that of gasoline/diesel (between 4.7 and 17.2 km/l). The environmental advantage requires an assessment alongside the higher volume of fuel consumed.
* **Positive Annual Impact:** Across all categories with available data, ethanol presents an average CO2 reduction. Considering 13,000 km driven annually, the greatest impact reductions occur in the **Commercial** (avoiding about 770 kg of CO2/year), **Large Off-Road** (≈ 529 kg/year), and **Pickup** (≈ 517 kg/year) categories.
* **Carbon Cycle:** Being of plant origin, ethanol has a closed cycle (photosynthesis/respiration), not introducing "new" carbon into the atmosphere, which substantially broadens its ecological advantage over fossil fuels.

---

## Challenges and Next Steps

The dataset presented some challenges that shaped the study's limitations, leaving room for future improvements:

**Limitations:**
* High presence of missing values (NAs) regarding ethanol emissions in non-flex vehicle versions.
* Low sampling in certain vehicle categories, limiting deeper statistical comparisons.

**Future Work:**
* Incorporating current fuel prices to calculate the financial cost and feasibility per kilometer driven for each category.
* Temporal analysis comparing energy efficiency and emission trends year by year.

---

## Technologies Used

The analysis was developed in **R**, using the Quarto/R Markdown format, supported by the following packages:

* `tidyverse` (Data manipulation)
* `ggridges` and `patchwork` (Distribution visualization and plot layout)
* `ggiraph` (Interactive graphics)
* `gt` and `gtExtras` (High-quality table structuring and styling)
* `formattable` and `wesanderson` (Aesthetics and color palettes)

> **Note on AI usage:** The Claude model (Opus 4.8) was used as a support tool for syntax review, visual alignment of interactive components (`geom_density_ridges` and `geom_boxplot` with `ggiraph`), and drafting the vector animation (SVG) illustrating the carbon cycle present in the original document.