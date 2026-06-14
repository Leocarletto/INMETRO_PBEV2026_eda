
library(tidyverse)
library(ggridges)
library(wesanderson)
library(ragg)

pbev <- readRDS("pbev.rds") |>
  filter(emissao_gasolina_diesel_co2_total_g_km < 1000)

cats <- sort(unique(pbev$categoria))
minhas_cores <- wes_palette("Darjeeling2", n = length(cats), type = "continuous")
names(minhas_cores) <- cats

dir.create("images", showWarnings = FALSE)

# 1) Distribuição das emissões de CO2 por categoria (density ridges)

emissao_long <- pbev |>
  select(categoria,
         Etanol = emissao_etanol_co2_total_g_km,
         `Gasolina/Diesel` = emissao_gasolina_diesel_co2_total_g_km) |>
  pivot_longer(cols = c(Etanol, `Gasolina/Diesel`),
               names_to = "combustivel", values_to = "emissao") |>
  mutate(combustivel = factor(combustivel,
                              levels = c("Etanol", "Gasolina/Diesel")))

g_emissao <- ggplot(emissao_long,
                    aes(x = emissao, y = categoria, fill = categoria)) +
  geom_density_ridges(scale = 4, rel_min_height = 0.01,
                      color = "black", linewidth = 0.3) +
  facet_wrap(~ combustivel, scales = "free_x") +
  scale_y_discrete(limits = cats, drop = FALSE,
                   expand = expansion(mult = c(0.01, 0.06))) +
  scale_x_continuous(breaks = scales::breaks_pretty(n = 4)) +
  scale_fill_manual(values = minhas_cores) +
  coord_cartesian(xlim = c(0, NA)) +
  labs(x = NULL, y = NULL, fill = "Categoria",
       title = "Densidade da emissão de CO₂ (g/km rodado)") +
  theme_ridges(font_size = 13) +
  theme(legend.position = "right",
        plot.title   = element_text(size = 16, face = "bold"),
        strip.text   = element_text(size = 13, face = "bold"),
        axis.text    = element_text(size = 11),
        legend.title = element_text(size = 11, face = "bold"),
        legend.text  = element_text(size = 10),
        legend.key.size = unit(0.5, "cm"))

agg_png("images/grafico_emissao.png", width = 10, height = 5.1,
        units = "in", res = 200, background = "white")
print(g_emissao)
invisible(dev.off())
message("OK -> images/grafico_emissao.png")


dados_diesel <- pbev |>
  filter(!is.na(diesel_ou_gasolina_km_por_litro_combinado),
         diesel_ou_gasolina_km_por_litro_combinado > 0) |>
  group_by(categoria) |>
  filter(n() >= 3) |>
  ungroup() |>
  droplevels()

dados_etanol <- pbev |>
  filter(!is.na(etanol_km_por_litro_combinado),
         etanol_km_por_litro_combinado > 0) |>
  group_by(categoria) |>
  filter(n() >= 3) |>
  ungroup() |>
  droplevels()

consumo_long <- bind_rows(
  dados_etanol |>
    transmute(categoria, consumo = etanol_km_por_litro_combinado,
              combustivel = "Etanol"),
  dados_diesel |>
    transmute(categoria, consumo = diesel_ou_gasolina_km_por_litro_combinado,
              combustivel = "Gasolina/Diesel")
) |>
  mutate(
    combustivel = factor(combustivel, levels = c("Etanol", "Gasolina/Diesel")),
    categoria   = factor(categoria, levels = sort(unique(as.character(categoria))))
  )

g_consumo <- ggplot(consumo_long,
                    aes(x = consumo, y = categoria, fill = categoria)) +
  geom_boxplot(color = "black", width = 0.6) +
  facet_wrap(~ combustivel, scales = "free_x") +
  scale_fill_manual(values = minhas_cores) +
  labs(x = "Consumo (km/l)", y = NULL, fill = "Categoria",
       title = "Consumo de combustível (km/l) por categoria") +
  theme_ridges(font_size = 13) +
  theme(legend.position = "right",
        plot.title   = element_text(size = 16, face = "bold"),
        strip.text   = element_text(size = 13, face = "bold"),
        axis.text    = element_text(size = 11),
        legend.title = element_text(size = 11, face = "bold"),
        legend.text  = element_text(size = 10),
        legend.key.size = unit(0.5, "cm"))

agg_png("images/grafico_consumo.png", width = 10, height = 5.1,
        units = "in", res = 200, background = "white")
print(g_consumo)
invisible(dev.off())
message("OK -> images/grafico_consumo.png")

message("Concluído.")
