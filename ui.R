library(shiny) 

shinyUI(
    
    pageWithSidebar(
        
        # Application title
        
        headerPanel("Relative Fat Mass Calculator"),
        
        
        
        sidebarPanel(
            
            numericInput('Weight', 'Insert your mass in kilograms', 90) ,
            
            numericInput('Height', 'Insert your height in meters', 1.78, min = 0.8, max = 2.8, step = 0.005)
            
        ), 
        
        mainPanel(
            
            p('Relative Fat Mass (RFM) is a new measurement in calculating a persons healthy height to weight ratio. It is similar to BMI but uses a slightly different calculation.'),
            
            withMathJax(),
            helpText('RFM =  $$60-20*\\frac{Mass}{Weight}$$'),
            
            p('In line with the documentation laid out, your results are:'),
            
            tags$div(
                
                tags$ul(
                    
                    tags$li('RFM: < 5%       : Essential Fat'),
                    
                    tags$li('RFM: 6% - 13%      : Athletic'),
                    
                    tags$li('RFM: 14% - 17%     : Fit'),
                    
                    tags$li('RFM: 18% - 24%     : Acceptable'),
                    
                    tags$li('BMI >=25%          : Obese')
                    
                )
                
            ),
            
            
            
            h4('The Moment of Truth:'), 
            
            p('Mass:'), verbatimTextOutput("inputweightvalue"),
            
            p('Height:'), verbatimTextOutput("inputheightvalue"),
            
            h4('Your calulated RFM is:'),
            
            verbatimTextOutput("estimation"),
            
            p('And your category:'),strong(verbatimTextOutput("diagnostic"))
            
            
            
            
            
        )
        
        
        
    )   
    
)