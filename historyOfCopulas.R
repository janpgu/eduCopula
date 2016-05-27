# Clean Up
rm(list=ls())
cat("\014")

# Read data
df <- read.csv("Scopus.csv", header=TRUE, sep = ",", quote = "\"")  # account for odd format
colnames(df) <- c("Year", "Amount")                                 # rename cols

# Plotting
tikz(file = "/Users/Ben/Dropbox/Dreamteam FS16/Time Series Analysis/Project Copulas/ProjectPaper/Graphics/adventCopula.tex",
     width = 5.6, height = 4.1, standAlone = TRUE)
plot(df$Amount ~ df$Year, 
     type = "l",
     xlab = "Year",
     ylab = "Amount of Publications",
     col = "dodgerblue4",
     lty = 1,
     pch = 16,
     lwd = 2,
     cex = 0.8)
points(df$Amount ~ df$Year,
       col = "dodgerblue4",
       pch = 16,
       cex = 1)
dev.off()