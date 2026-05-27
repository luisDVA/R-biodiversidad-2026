library(ggplot2)
library(patchwork)

cafeteria <- data.frame(carbohidratos = 1:10, grasa = 1:10, energia = 1:10, proteina = 1:10)
grasaCarb <- ggplot(cafeteria, aes(carbohidratos, grasa)) + geom_point()
protEnergia <- ggplot(cafeteria, aes(energia, proteina)) + geom_point()

protEnergia_mod <- protEnergia + labs(x = "*Esta es una etiqueta tan larga e importante \nque tiene que abarcar muchas líneas \nen el gráfico")

cat("Original classes:\n")
print(class(grasaCarb))

grasaCarb_fix <- grasaCarb
class(grasaCarb_fix) <- c("ggplot", "gg")

cat("\nFixed classes:\n")
print(class(grasaCarb_fix))

tryCatch({
    res <- free(grasaCarb_fix) | protEnergia_mod
    print("Success with fixed classes")
}, error = function(e) {
    cat("Error with fixed classes:\n")
    print(e)
})
