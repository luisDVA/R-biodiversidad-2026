# Script de instalación para los paquetes usados en las presentaciones del viernes

packages_cran <- c(
  "letsR", "sf", "ggplot2", "viridisLite", "tmap", "dplyr", "here", 
  "janitor", "classInt", "biscale", "patchwork", "tidyr", "rnaturalearth", 
  "tidyterra", "ape", "deeptime", "tidytree", "ggimage", "geiger", 
  "caper", "rsvg", "rphylopic", "rotl", "readr", "rgbif", "terra", 
  "alphahull", "rangeBuilder", "ggthemes", "BiocManager"
)

# Instalar paquetes de CRAN
for (pkg in packages_cran) {
  if (!requireNamespace(pkg, quietly = TRUE)) {
    message(paste("Instalando el paquete:", pkg))
    install.packages(pkg)
  }
}

# Instalar paquetes de Bioconductor
packages_bioc <- c("ggtree", "ggtreeExtra", "TDbook")

for (pkg in packages_bioc) {
  if (!requireNamespace(pkg, quietly = TRUE)) {
    message(paste("Instalando el paquete de Bioconductor:", pkg))
    BiocManager::install(pkg)
  }
}

