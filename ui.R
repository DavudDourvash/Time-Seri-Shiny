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
    ),
    dashboardSidebar(
      sidebarMenu(
        menuItem("setting", tabName = "input", icon = icon("dashboard")),
        menuItem("show", tabName = "plot", icon = icon("th"))
      )
    ),
    ####dashboardbody####  
    dashboardBody(
      tabItems(
        tabItem(tabName = "input",
                h4("Please select :"),
                fluidRow(responsive=TRUE,
                 
                  box(width = 4, collapsible = TRUE, collapsed = TRUE,status ="info",
                    fileInput("data", h4("import your dataset:"),
                              accept=c('text/csv', 'text/comma-separated-values,text/plain','.csv','.xlsx'))),
                  
                  box(solidHeader=TRUE, width = 5,background = "purple",height = 150,
                      title = "Duration",
                      sliderInput("slider1", "Slide Me :", 0, 1000, 1, animate = TRUE),
                      textOutput("num1")),
                  column(3),
                  box(selectInput(
                    "y_input", 
                    label = h5("Select Time Series/Response Variable"),
                    "")),
                  plotOutput("plot"), width = 12
                )))
    )))


