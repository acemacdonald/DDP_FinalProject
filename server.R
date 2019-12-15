library(shiny) 



BMI_Factor<-function(Weight,Height) {Weight/(Height^3)}



diagnostic_f<-function(Weight,Height){
    
    RFM_value<-Weight/(Height^3)
    
    ifelse(RFM_value<5,"Essential Fat",ifelse(RFM_value<13,"Athletic",ifelse(RFM_value<17,"Fit",ifelse(RFM_value<24,"Acceptable","Obese"))))
    
}



shinyServer(
    
    function(input, output) {
        
        
        
        output$inputweightvalue <- renderPrint({input$Weight})
        
        output$inputheightvalue <- renderPrint({input$Height})
        
        output$estimation <- renderPrint({BMI_Factor(input$Weight,input$Height)})
        
        output$diagnostic <- renderPrint({diagnostic_f(input$Weight,input$Height)})
        
    } 
    
)