
# Pacote Faraway ---------------------------------------------------------------------------------------------------------------------------

### O pacote Faraway apresenta diversos bancos de dados que podem ser usados para a 
### prática de estatística.

# Instalar pacote --------------------------------------------------------------------------------------------------------------------------

install.packages("faraway")
library(faraway)

# Banco de dados disponíveis no pacote-------------------------------------------------------------------------------------------------------

faraway::airpass # Dados que apresenta o número de passageiros de 1949 a 1961

faraway::alfalfa # Dados de um experimento dos efeitos da inoculação de sementes, irrigação e sombra sobre a colheita da alfafa

faraway::babyfood # Dados sobre estudos de doenças respiratórias infantis

# Visualizando o banco de dados selecionado ----------------------------------------------------------------------------------------------------------------

View(alfalfa)

# Descrição dos dados ----------------------------------------------------------------------------------------------------------------------

library(dplyr)

## Média e erro-padrão por tratamento de sombra

alf1 <- alfalfa %>%
  group_by(shade) %>%
  summarise(media = mean(yield), se = sd(yield) / sqrt(length(yield)))
alf1

## Média e erro-padrão por tratamento de irrigação

alf2 <- alfalfa %>%
  group_by(irrigation) %>%
  summarise(media = mean(yield), se = sd(yield) / sqrt(length(yield)))
alf2

# Gráfico ----------------------------------------------------------------------------------------------------------------------------------

library(ggplot2) # Pacote para produzir os gráficos

a <- ggplot(alf1, aes(x = shade, y = media, fill = shade)) +
  geom_bar(stat = "identity", position = position_dodge()) +
    geom_errorbar(aes(ymin = media - se, ymax = media + se), width = .2,
                 position = position_dodge(.9)) +
  scale_fill_brewer(palette = "PuOr") +
  labs(y = "Colheita alfalfa", x = "Sombreamento") +
  theme(legend.position = "none")
a

b <- ggplot(alf2, aes(x = irrigation, y = media, fill = irrigation)) +
  geom_bar(stat = "identity", position = position_dodge()) +
    geom_errorbar(aes(ymin = media - se, ymax = media + se), width = .2,
                 position = position_dodge(.9)) +
  scale_fill_brewer(palette = "PuOr") +
  labs(y = "Colheita alfalfa", x = "Irrigação") +
  theme(legend.position = "none")
b

## Gráfico juntos - Pacote gridExtra

gridExtra::grid.arrange(a, b)
