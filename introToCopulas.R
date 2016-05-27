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

# Plotting
colnames(pq) <- c('P', 'Q') # name our two r.v.s P and Q
pdf(file = "C:/Users/Jan/Dropbox/2. University/MA - Semester 2/2016 - Dreamteam/Time Series Analysis/Project Copulas/ProjectPaper/Graphics/eduCopula1.pdf")
pairs.panels(pq, rug = FALSE, cex.cor = 0.7, hist.col = "dodgerblue4") # plot
dev.off()

###########################################################################################################################################################

uv <- pnorm(pq)

# Plotting
colnames(uv) <- c('U', 'V') # name our two r.v.s U and V
pdf(file = "C:/Users/Jan/Dropbox/2. University/MA - Semester 2/2016 - Dreamteam/Time Series Analysis/Project Copulas/ProjectPaper/Graphics/eduCopula2.pdf")
pairs.panels(uv, rug = FALSE, cex.cor = 0.7, hist.col = "dodgerblue4") # plot
dev.off()

###########################################################################################################################################################

x <- qt(uv[, 1], df = 7) # transform first rv with quantile function of student's t with nu = 7
y <- qt(uv[, 2], df = 15) # transform second rv with quantile function of student's t with nu = 15
xy <- cbind(x, y) # combine the two matrices by columns

# Plotting
colnames(xy) <- c('X', 'Y') # name our two r.v.s X and Y
pdf(file = "C:/Users/Jan/Dropbox/2. University/MA - Semester 2/2016 - Dreamteam/Time Series Analysis/Project Copulas/ProjectPaper/Graphics/eduCopula3.pdf")
pairs.panels(xy, rug = FALSE, cex.cor = 0.7, hist.col = "dodgerblue4") # plot
dev.off()