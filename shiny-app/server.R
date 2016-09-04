library(shiny) 

RMR<-function(weight,height,age,gender)
{
  if(gender == "male")
  {
    ( 10 * weight ) + ( 6.25 * height ) - ( 5 * age ) + 5
  }
  else
  {
    ( 10 * weight ) + ( 6.25 * height ) - ( 5 * age ) - 161
  }
 
}


shinyServer(
  function(input, output) {
    
    output$inputweightvalue <- renderPrint({input$weight})
    output$inputheightvalue <- renderPrint({input$height})
    output$inputagevalue <- renderPrint({input$age})
    output$inputradiovalue <- renderPrint({input$radio})
    output$estimation <- renderPrint({RMR(input$weight,input$height,input$age,input$radio )})
  } 
)