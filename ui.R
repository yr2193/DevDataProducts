library(shiny)
shinyUI(fluidPage(
    titlePanel("BMI and BMR calculator"),
    sidebarLayout(
        sidebarPanel(
            h3("STANDARD"),
            h4("Your Height"),
            numericInput("ft", label="feet", value=0),
            br(),
            numericInput("inch", label="inches", value=0),
            br(),
            sliderInput("wt",
                        label=h4("Your Weight (lb)"),
                         min = 70, max = 250, value=70),
            br(),
            numericInput("age", label = h4("Your Age"),value=20),
            br(),
            selectInput("sex", label=h4("Gender"),choices=list("M", "F")),
            br(),
            submitButton("Submit")
        ),
        # Tab panels:
        mainPanel(
           tabsetPanel(type = "tab",
                       tabPanel("Read Me", "This app caculates BMI and BMR values.
                                BMI, aka body mass index, is a measure of relative weight 
based on an individual's mass and height. It is used as a simple method to assess how much an individual's body weight departs from what is normal or desirable for a person of his or her height. BMR, aka basal metabolic rate, is the rate of energy expenditure by humans at rest, and is measured using Revised Harris-Benedict Equation. Both values are useful for weight control. To begin using this app, just simply enter your parameters in the left and click the tabs on the right to view results!"),
                       tabPanel("BMI", textOutput("BMI") ),
                       tabPanel("BMR", textOutput("BMR"))
                        )
            )
        )
    )
)