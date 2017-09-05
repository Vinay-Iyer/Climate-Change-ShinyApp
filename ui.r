library(shiny)

shinyUI(fluidPage(
<<<<<<< HEAD
  
=======

>>>>>>> 3a4bfee812f4028a82e549ba30a41b1e57211a4f
  titlePanel(title = h2("Climate change",align="center")),
  sidebarLayout(position = "right",
                # Sidebar panel            
                sidebarPanel(h5("Select required plots"),
                             
                             fluidRow(
                               column(width = 4, wellPanel(
                                 radioButtons("plot_ctry", "Select country",
<<<<<<< HEAD
                                              c("India", "United States", "Canada"))
                                 
                               )
                               )
=======
                                              c("India", "United States"))
                                 
                                 )
                              )
>>>>>>> 3a4bfee812f4028a82e549ba30a41b1e57211a4f
                             ),
                             br()
                ),
                
<<<<<<< HEAD
                
                # Main Panel
                mainPanel(tabPanel("Plots", plotOutput("myplot")))
=======
  
  # Main Panel
  mainPanel(tabPanel("Plots", plotOutput("myplot")))
>>>>>>> 3a4bfee812f4028a82e549ba30a41b1e57211a4f
  )
  
)
)