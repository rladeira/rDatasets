rm(list = ls())

library(rDatasets)
library(mlbench)

datasetPath <- file.path("dataParsing", "syntheticDatasets", "cassini")

mlBenchCassini <- mlbench.cassini(1000, relsize = c(4.5,4.5,1))
plot(mlBenchCassini)

cassiniData <- as.data.frame(mlBenchCassini)

cassiniData <- data.frame(cassiniData[,1:2],
                          sapply(1:8, function(i) runif(1000)),
                          cassiniData[,3])
colnames(cassiniData) <- c(paste("F", 1:10, sep = ""), "class")


cassini_ <- buildDataAbstraction(
  name = "Cassini",
  data = cassiniData[, -11],
  labels = cassiniData[, 11])

save(cassini_,
     file = file.path(
       datasetPath, "cassini_.RData"))
