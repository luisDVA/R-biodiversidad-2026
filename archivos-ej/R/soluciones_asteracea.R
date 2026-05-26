# Soluciones - Asteraceae de México
# Curso 2026
library(tidyverse)

# datos
occ <- read_csv("archivos-ej/asteraceaMX.csv")
tax <- read_csv("archivos-ej/asteraceaTaxonomia.csv")

# Unir las tablas
#  la tabla de taxonomía para tener registros únicos por especie
tax_unique <- tax |> distinct(scientificName, .keep_all = TRUE)

# Unimos con left_join
asteraceae <- occ |> 
  left_join(tax_unique, by = "scientificName")
asteraceae

# ¿Qué género tiene más registros?
asteraceae |> 
  separate(scientificName, into = "genus", sep = " ") |> 
  count(genus, sort = TRUE)  
  head(10) 
  
# Elevación por subfamilia
print("Elevación promedio por subfamilia:")
asteraceae |> 
  group_by(subfamily) |> 
  summarise(
    elev_promedio = mean(minimumElevationInMeters, na.rm = TRUE)
  ) |> 
  arrange(desc(elev_promedio)) 

# Riqueza de especies por estado
asteraceae |> 
  group_by(stateProvince) |> 
  summarise(riqueza = n_distinct(scientificName)) |> 
  arrange(desc(riqueza)) |> 
  head(10) 

# Ejercicio 5: Colectas en los años 80
asteraceae_80s <- asteraceae |> 
  mutate(year = as.numeric(str_extract(eventDate, "\\d{4}$"))) |> 
  filter(year >= 1980 & year <= 1989)

# Estados con 'Lepidonia'
asteraceae |> 
  filter(str_detect(scientificName, "^Lepidonia")) |> 
  count(stateProvince, sort = TRUE)
