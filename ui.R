#####libraries####
#install.packages("shiny")
library(shiny)
library(shinydashboard)
library(quantmod)
library(ggplot2)

####ui####
shinyUI(
####dashboardsidebar####  
  dashboardPage(
    dashboardHeader(
      title = "Time Seri"
    ),
    dashboardSidebar(
      sidebarMenu(
        menuItem("slide", tabName = "input", icon = icon("dashboard")),
        menuItem("show", tabName = "plot", icon = icon("th"))
      )
    ),
####dashboardbody####  
    dashboardBody(
      tabItems(
        tabItem(tabName = "input",
                h2("Please select with care"),
                 fluidRow(
                  box(
                    fileInput("data", "please insert data :",
                              accept=c('text/csv', 'text/comma-separated-values,text/plain','.csv','.xlsx'))),
                  
                  box(solidHeader=TRUE, width = 5,background = "purple",height = 150,
                      title = "Duration",
                      sliderInput("slider1", "Slide Me :", 0, 1000, 1, animate = TRUE),
                      textOutput("num1")),
                  box(selectInput(
                    "y_input", 
                    label = h5("Select Time Series/Response Variable"),
                    "")),
                  box(
                    plotOutput("plot")
                  )))
      ))))


