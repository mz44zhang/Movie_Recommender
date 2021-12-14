## ui.R
library(shiny)
library(shinydashboard)
library(recommenderlab)
library(data.table)
library(ShinyRatingInput)
library(shinyjs)

source('functions/helpers.R')
genre_list = c("Action", "Adventure", "Animation", 
               "Children's", "Comedy", "Crime",
               "Documentary", "Drama", "Fantasy",
               "Film-Noir", "Horror", "Musical", 
               "Mystery", "Romance", "Sci-Fi", 
               "Thriller", "War", "Western")

shinyUI(
  dashboardPage(
    skin = "blue",
    dashboardHeader(title = "Movie Recommender"),
    
    dashboardSidebar(
      sidebarMenu(
        # Setting id makes input$sidebar give the tabName of currently-selected tab
        id = "sidebar",
        menuItem("Recommender by ratings", tabName = "dashboard_rating"),
        menuItem("Recommender by genres", tabName = "dashborad_genre")
      )),
    
    dashboardBody(
      tabItems(
        
        
        tabItem(tabName = "dashboard_rating",
                includeCSS("css/movies.css"),
                fluidRow(box(width = 12, title = "Step 1: Rate as many movies as possible", status = "info", solidHeader = TRUE, collapsible = TRUE,div(class = "rateitems",uiOutput('ratings')))),
                
                fluidRow(useShinyjs(),
                         box(width = 12, status = "info", solidHeader = TRUE,
                             title = "Step 2: Discover movies you might like",
                             br(),
                             withBusyIndicatorUI(actionButton("btn", "Click here to get your recommendations", class = "btn-warning")),
                             br(),
                             tableOutput("results")))),
        
        # Second tab content
        tabItem(tabName = "dashborad_genre",
                includeCSS("css/movies.css"),
                fluidRow(useShinyjs(),
                         box(width = 12, title = "Step 1: Select your favorite genre", status = "info", solidHeader = TRUE, collapsible = TRUE,
                           selectInput('genre_select', 'select a single genre from the dropdown menu', genre_list))),
                
                fluidRow(useShinyjs(),
                         box(width = 12, status = "info", solidHeader = TRUE,
                             title = "Step 2: Discover movies you might like",
                             br(),
                             # withBusyIndicatorUI(actionButton("btn2", "Click here to get your recommendations", class = "btn-warning")),
                             br(),
                             tableOutput("results2"))))
        
        
        
        
      )
      
    )
  )
) 