library(shiny)

# Define UI for application 
shinyUI(pageWithSidebar(
    
    # Application title
    headerPanel("Iris classification - a famous data set!"),
    
    # Sidebar with a slider input for number of observations
    sidebarPanel(
        #h5(helpText("Start Here:")),
        h5(helpText("For the Iris flower select the petal/sepal length and width and start here")),
        sliderInput("Petal_Length", 
                    "Petal Length:", 
                    min = 1,
                    max = 6.9, 
                    value = 3, step = 0.1)
        ,
        sliderInput("Petal_Width", 
                    "Petal Width:", 
                    min = 0.1,
                    max = 2.5, 
                    value = 1.5, step = 0.1)
        ,
        sliderInput("Sepal_Length", 
                    "Sepal Length:", 
                    min = 4.3,
                    max = 7.9, 
                    value = 6, step = 0.1)
        ,
        sliderInput("Sepal_Width", 
                    "Sepal Width:", 
                    min = 2,
                    max = 4.4, 
                    value = 3.6, step = 0.1)
        ,
        submitButton('Submit')
    ),
    
    
    # Show a plot of the generated distribution
    mainPanel(    
        helpText("This is an illustration of  the famous iris data set. 
The Iris flower data set or Fisher's Iris data set is a multivariate data set introduced by Sir Ronald Fisher (1936)
as an example of discriminant analysis. The data set consists of 50 samples from each of three species of Iris 
(Iris setosa, Iris virginica and Iris versicolor). 
                 Four features were measured from each sample: 
                 the length and the width of the sepals and petals, in centimetres.
                 Based on the combination of these four features, Fisher developed a linear discriminant model to distinguish the species from each other.
                 This Shiny application uses random forest as machine learning method, will predict the corresponding iris species 
    					   and return the results and the respective image in the bottom of the main panel.
                 (Source of the pictures: http://en.wikipedia.org/wiki/Iris_flower_data_set)"),        
        h5('You entered as Petal length'),
        verbatimTextOutput("pl"),        
        h5('You entered as Petal width'),
        verbatimTextOutput("pw"),        
        h5('You entered as Sepal length'),
        verbatimTextOutput("sl"),        
        h5('You entered as Sepal width'),
        verbatimTextOutput("sw"),        
        h5('Which results in a prediction of '),
        verbatimTextOutput("pred"),
        plotOutput("distPlot")
        
    )
))