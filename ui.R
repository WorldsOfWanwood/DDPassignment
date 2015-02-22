shinyUI(fluidPage(
  titlePanel("Guinea Pig Tooth Length predictor"),
  
  sidebarLayout(
    sidebarPanel(
      
      helpText("Select delivery method and dosage of vitamin c to find the expected teeth length of guinea pigs (shown in boxplot and text).
               
               You can also find the  likelihood that a guinea pig will have a tooth length within a certain range"),
      
      selectInput("method", 
                  label = "Delivery Method",
                  choices = c("Orange juice", "Ascorbic acid"),
                  selected = "Orange juice"),
      
      selectInput("dosage", 
                  label = "Dosage Level (mg)",
                  choices = c("0.5", "1","2"),
                  selected = "0.5"),
      
      
      sliderInput("rangeWanted",
                  label = "Growth range wanted (mm)",
                  min = 0,
                  max = 40,
                  value = c(5,30)
        )
      ),
    
    
    
    mainPanel(
      textOutput("title"),
      textOutput("summary"),
      textOutput("summary2"),
      plotOutput("plot")
    )
  )
))