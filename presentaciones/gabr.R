
library(ggplot2)
library(sf)

data <- bi_class(stl_race_income, x = pctWhite, y = medInc, style = "quantile", dim = 3)

map <- ggplot() +
  geom_sf(data = data, mapping = aes(fill = bi_class), 
  color = "white", size = 0.1, show.legend = FALSE) +
  bi_scale_fill(pal = "GrPink", dim = 3)

map

stl_race_income

ggplot()+
  geom_sf(data = stl_race_income,
    aes(fill=color,alpha=alpha),shape=15, size=11,show.legend = FALSE)
 # scale_fill_viridis_c()+
  theme_bw()
map