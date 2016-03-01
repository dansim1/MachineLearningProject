# Load relevant libraries
require(data.table)
library(data.table)
library(devtools)
library(ggplot2)
library(shiny)
library(slidify)

#Code for ui.R 
shinyUI(fluidPage (
  titlePanel("Explore the Economic Data"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("BPC$mmddyyyy",
                  "mmddyyyy:",
                  min = 1969,
                  max = 2015,
                  value = 2000)),
    mainPanel(
      tabsetPanel(
        tabPanel('Explore the Economic Data',
                  plotOutput('newmPlot')),
        tabPanel('Column Means',
                 dataTableOutput('table1'))
      )
    )
  )))