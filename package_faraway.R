
# Pacote Faraway ---------------------------------------------------------------------------------------------------------------------------

### O pacote Faraway apresenta diversos bancos de dados que podem ser usados para a 
### prática de estatística.

# Instalar pacote --------------------------------------------------------------------------------------------------------------------------

install.packages("faraway")
library(faraway)

# Banco de dados disponíveis -------------------------------------------------------------------------------------------------------

faraway::airpass # Dados que apresenta o número de passageiros de 1949 a 1961

faraway::alfalfa # Dados de um experimento dos efeitos da inoculação de sementes, irrigação e sombra sobre a colheita da alfafa

faraway::babyfood # Dados sobre estudos de doenças respiratórias infantis

# Carregando banco de dados ----------------------------------------------------------------------------------------------------------------

View(alfalfa)

