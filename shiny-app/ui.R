library(shiny)
library(rCharts)
require(markdown)

shinyUI(
    navbarPage("Resting Metabolic Rate (RMR) Calculator",
        tabPanel("Calculator",
                 # Application title
                 sidebarPanel(
                   numericInput('weight', 'Insert your weight in kilograms', 70) ,
                   numericInput('height', 'Insert your height in centimetres', 170, min = 0.2, max = 2.5, step = 0.01),
                   numericInput('age', 'Insert your age', 30),
                   radioButtons("radio", "gender",  c("Male" = "male",
                                                "Female" = "female"), selected = NULL, inline = FALSE, width = NULL),
                   submitButton('Submit')
                 ), 
                 mainPanel(
                   p('RMR calculator which is used to calculate Resting Metabolic Rate for men and women from the known values. RMR is closely related to BMR (Basal Metabolic Rate).'),
                   p('Formula :'),
                   p('For Men: Resting metabolic rate = ( 10 x W ) + ( 6.25 x H ) - ( 5 x A ) + 5 '),
                   p('For Women: Resting metabolic rate = ( 10 x W ) + ( 6.25 x H ) - ( 5 x A ) - 161 '),
                   p('  Where, W = Weight  H = Height  A = Age'),

                   
                   h4('You entered:'), 
                   p('weight:'), verbatimTextOutput("inputweightvalue"),
                   p('height:'), verbatimTextOutput("inputheightvalue"),
                   p('age:'), verbatimTextOutput("inputagevalue"),
                   p('gender:'), verbatimTextOutput("inputradiovalue"),
                   h4('Your RMR is:'),
                   verbatimTextOutput("estimation")

                   
                 )
            
        ),
        
        tabPanel("About RMR",
            mainPanel(
                includeMarkdown("include.md")
            )
        )
    )
)
