library(shiny)
## Load the Iris images
### Source: http://en.wikipedia.org/wiki/Iris_flower_data_set
### http://en.wikipedia.org/wiki/File:Kosaciec_szczecinkowaty_Iris_setosa.jpg
### http://en.wikipedia.org/wiki/File:Iris_versicolor_3.jpg
### http://en.wikipedia.org/wiki/File:Iris_virginica.jpg

require(jpeg)
library(graphics)
#require(ReadImages)
#require(RcppEigen)
irisvi  <- readJPEG("220px-Iris_versicolor_3.jpg")
irisve  <- readJPEG("220px-Iris_virginica.jpg")
irisse  <- readJPEG("220px-Kosaciec_szczecinkowaty_Iris_setosa.jpg")

## Start machine learning
set.seed(1234)
data(iris)
m <- dim(iris)[1]
val <- sample(1:m, size = round(m/3), replace = FALSE,
              prob = rep(1/m, m))
iris.learn <- iris[-val,]
iris.valid <- iris[val,]

library(randomForest)
library(caret)
rf <- randomForest(Species ~. , data=iris.learn, method="class")

which_iris <- function(inputvalue){
    as.character(predict(rf, inputvalue))
}

# Define server logic required to generate and plot a random distribution
shinyServer(function(input, output) 
{dt<-reactive({
    p<-data.frame(0.0,0.0,0.0,0.0)
    names(p) <- c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width")
    #names(p)<-names(iris)[1:4]
    p[1,1]<-{input$Sepal_Length}
    p[1,2]<-{input$Sepal_Width}
    p[1,3]<-{input$Petal_Length}
    p[1,4]<-{input$Petal_Width}
    p
})

output$pl <- renderPrint({input$Petal_Length})
output$pw <- renderPrint({input$Petal_Width})
output$sl <- renderPrint({input$Sepal_Length})
output$sw <- renderPrint({input$Sepal_Width})
output$prediction <- renderPrint({input$ml_method})

output$pred<-renderText({which_iris(dt())})

output$distPlot <- renderPlot({    
    # load the image  and plot it
    if (which_iris(dt())=="setosa") {
    plot(1, type="n", xlim=c(0, 220), ylim=c(0, 180))
    rasterImage(irisse,1, 1, 220, 165)
    }
    if (which_iris(dt())=="versicolor") {
        plot(1, type="n", xlim=c(0, 220), ylim=c(0, 180))
        rasterImage(irisve,1, 1, 220, 165)
    }
    if (which_iris(dt())=="virginica") {
        plot(1, type="n", xlim=c(0, 220), ylim=c(0, 180))
        rasterImage(irisvi,1, 1, 220, 165)
    }
    
})

})