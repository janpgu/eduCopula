# Clean Up
rm(list=ls())
cat("\014")

library(copula)

set.seed(2016) # ensure reproducibility

# Create copula objects
normCop <- normalCopula(param = 0.7, dim = 2)
tCop <- tCopula(param = 0.7, df = 3, dim = 2)
clayCop <- claytonCopula(param = 5, dim = 2)
gumCop <- gumbelCopula(param = 5, dim = 2)

# Simulate
nR <- rCopula(10000, normCop)
tR <- rCopula(10000, tCop)
cR <- rCopula(10000, clayCop)
gR <- rCopula(10000, gumCop)

# Plotting
par(mfrow = c(2, 2))
plot(nR[, 1], nR[, 2], pch='.', col='dodgerblue4', xlab = "", ylab = "", main = "Gaussian Copula")
plot(tR[, 1], tR[, 2], pch='.', col='dodgerblue4', xlab = "", ylab = "", main = "t-Copula")
plot(cR[, 1], cR[, 2], pch='.', col='dodgerblue4', xlab = "", ylab = "", main = "Clayton Copula")
plot(gR[, 1], gR[, 2], pch='.', col='dodgerblue4', xlab = "", ylab = "", main = "Gumbel Copula")
