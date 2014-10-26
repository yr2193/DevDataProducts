

shinyServer(function(input, output) {
    BMI <- function(wt, ft, inch){
        if(ft==0){"Enter the parameters to get your BMI!"}
        else{
            bmi <- wt*703/(12*ft+inch)^2
            bmi <- round(bmi,2)
            if(bmi<18.5){
                prtbmi <- paste("Your BMI is",bmi," and you are underweight. Eat more!")
            }
            else{
                if(18.5<bmi & bmi<24.9){
                    prtbmi <-paste("Your BMI is",bmi," and you are normal. Congrats!")
                }
                else{
                    if(25.0<bmi & bmi<29.9){
                        prtbmi <- paste("Your BMI is",bmi," and you are overweight. Do some exercise!")
                    }
                    else{
                        prtbmi <- paste("Your BMI is",bmi," and you are obese. Watch your diet and exercise more!")
                    }
                }
        }
        }
    }
    
    BMR <- function(wt,ft,inch,age,sex){
        if(ft==0){"Enter the parameters to get your BMR!"}
        else{
            if(sex=="F"){
                bmr <- 447.593+(9.247*wt*0.45359)+3.098*(12*ft+inch)*2.54-4.33*age
            }
            else{
                bmr <- 88.362+(13.397*wt*0.45359)+4.799*(12*ft+inch)*2.54-5.677*age
            }
            bmr <- paste("Your BMR is",round(bmr,2),"kcal/day.")
        }
    }
    
        output$BMI <- renderText(paste(BMI(input$wt,input$ft,input$inch)))   
        output$BMR <- renderText(paste(BMR(input$wt,input$ft,input$inch,input$age,input$sex)))      
})
