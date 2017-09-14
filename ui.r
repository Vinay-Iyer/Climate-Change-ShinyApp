library(shiny)

shinyUI(fluidPage(
  titlePanel(title = h2("Climate change",align="center")),
  sidebarLayout(position = "right",
                # Sidebar panel            
                sidebarPanel(h5("Select required plots"),
                             
                             fluidRow(
                               column(width = 4, wellPanel(
                                 radioButtons("plot_ctry", "Select country",
                                              c("India", "United States", "Canada"))
                                 
                               )

                                 )
                              )
                             ),
                             br()
                ),
                

          # Main Panel
         mainPanel(tabPanel("Plots", plotOutput("myplot")))
  )
  
)
