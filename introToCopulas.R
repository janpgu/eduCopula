# Clean Up
rm(list=ls())
cat("\014")

library(psych)  # used for pairs.panel()
library(MASS)   # used to draw from multivariate normal

set.seed(2016)  # ensure reproducibility
d <- 2          # number of random variables
n <- 10000      # number of samples
sigmaMatrix <- matrix(c(1.0, 0.7,
                        0.7, 1.0),
                      nrow = d)
pq <- mvrnorm(n, mu = rep(0, d), Sigma = sigmaMatrix)

# Transformations
colnames(pq) <- c('P', 'Q') # name our two r.v.s P and Q
pairs.panels(pq, rug = FALSE, cex.cor = 0.7, hist.col = "dodgerblue4") # plot
###########################################################################################################################################################
uv <- pnorm(pq) # probability integral transform
colnames(uv) <- c('U', 'V') # name our two r.v.s U and V
pairs.panels(uv, rug = FALSE, cex.cor = 0.7, hist.col = "dodgerblue4") # plot
###########################################################################################################################################################
x <- qt(uv[, 1], df = 7) # transform (smirnov) first rv with quantile function of student's t with nu = 7
y <- qt(uv[, 2], df = 15) # transform (smirnov) second rv with quantile function of student's t with nu = 15
xy <- cbind(x, y) # combine the two matrices by columns
colnames(xy) <- c('X', 'Y') # name our two r.v.s X and Y
pairs.panels(xy, rug = FALSE, cex.cor = 0.7, hist.col = "dodgerblue4") # plot
