# Load relevant libraries
require(data.table)
library(devtools)
devtools::install_github('rstudio/shinyapps')
library(ggplot2)
library(shiny)
library(slidify)

# Read data
setwd("C:/Users/Dan/Google Drive/Data Science_JohnsHopkins/9_Developing Data Products/Project")
BPC <- read.csv("beaPersCon.csv")
BPC[ ,1] <- as.Date(BPC[ , 1], format = "%m/%d/%Y")
cols <- c(1,3:6)
BPC <- BPC[ ,cols]
BPCColMean <- as.data.frame(colMeans(BPC[ ,2:5], na.rm = TRUE))

# Shiny server
shinyServer(
  function(input, output, session) {
    output$newmPlot <- renderPlot({
      ggplot(BPC, aes(x=mmddyyyy), group = mmddyyyy) + 
        geom_line(aes(y=Goods, color="Goods")) + 
        geom_line(aes(y=Durable, color="Durable")) + 
        geom_line(aes(y=Nondurable, color="Nondurable")) + 
        geom_line(aes(y=Services, color="Services"))
    })
    output$table1 = renderDataTable({BPCColMean}, options = NULL)
    }) 