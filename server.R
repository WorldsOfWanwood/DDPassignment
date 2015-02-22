
shinyServer(
  function(input, output) {
    
    output$title <- renderText({ 
      paste("With a delivery method of ", input$method,
            "and a dosage of ",input$dosage,"mg:")
    })
    
    output$summary <- renderText({
      #convert inputs to correct forms
      method <- "VC"
      if (input$method == "Orange Juice") {method <- "OJ"}
      
      dosage <- as.numeric(input$dosage)
      
      pRange<-input$pRange
      
      #create data frame of only relevant measurements
      correctMethod <- ToothGrowth$supp == method
      correctDosage <- ToothGrowth$dose == dosage
      correct <- correctMethod & correctDosage
      lengths<-ToothGrowth[correct,1]
      
      mean<-mean(lengths)
      sd <- sd(lengths)
      upper<-round(qnorm(0.975,mean,sd),2)
      lower<-round(qnorm(0.025,mean,sd),2)
      
      paste("Mean growth is ",round(mean,2)," with a standard deviation of ",round(sd,2),
            ". So we would expect about 95% of the guinea pigs to have tooth growth of between ",lower,
            "mm and ",upper,"mm.")
    })
    
    
    output$summary2 <- renderText({
      #convert inputs to correct forms
      method <- "VC"
      if (input$method == "Orange Juice") {method <- "OJ"}
      
      dosage <- as.numeric(input$dosage)
      
      pRange<-input$pRange
      
      minWant<-input$rangeWanted[1]
      maxWant<-input$rangeWanted[2]
      
      
      #create data frame of only relevant measurements
      correctMethod <- ToothGrowth$supp == method
      correctDosage <- ToothGrowth$dose == dosage
      correct <- correctMethod & correctDosage
      lengths<-ToothGrowth[correct,1]
      
      mean<-mean(lengths)
      sd <- sd(lengths)
      upper<-round(qnorm((0.5+pRange/200),mean,sd),2)
      lower<-round(qnorm((0.5+pRange/200),mean,sd,lower.tail=FALSE),2)
      
      less<-pnorm(((minWant-mean)/sd),lower.tail=TRUE)
      greater<-pnorm(((maxWant-mean)/sd),lower.tail=FALSE)
        
      val<-round((1-less-greater)*100)
      
      paste("We expect that the guinea pig will have a tooth length between ",
            minWant,"mm and ",maxWant,"mm about ",val,"% of the time")
    })
    
    output$plot <- renderPlot({
      #convert inputs to correct forms
      method<-"OJ"
      if (input$method == "Ascorbic acid") {method <- "VC"}
      dosage <- as.numeric(input$dosage)
      
      #create data frame of only relevant measurements
      correctMethod <- ToothGrowth$supp == method
      correctDosage <- ToothGrowth$dose == dosage
      correct <- correctMethod & correctDosage
      lengths<-ToothGrowth[correct,1]
      title<-paste("Boxplot of tooth lengths for ",dosage,"mg of Vitamin C from ",input$method)
      boxplot(lengths,ylab="Tooth length (mm)",main=title)
    })
  })