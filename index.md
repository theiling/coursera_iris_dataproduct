---
title       : Developing Dataproducts - Iris
subtitle    : A famous dataset!
author      : ThomasH
job         : Coursera Student
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : standalone # {standalone, draft, selfcontained}
knit        : slidify::knit2slides
---

## Iris - a famous dataset

This is an illustration of  the famous iris data set. 

The Iris flower data set or Fisher's Iris data set is a multivariate data set introduced by Sir Ronald Fisher (1936) as an example of discriminant analysis. 

The data set consists of 50 samples from each of three species of Iris (Iris setosa, Iris virginica and Iris versicolor). 

Four features were measured from each sample: 
- the length of the sepals in centimeter
- the width of the sepals, in centimeter
- the length of the petals, in centimetres.
- the width of the sepals in centimeter

Based on the combination of these four features, Fisher developed a linear discriminant model to distinguish the species from each other.

--- .class #id 

## Usage of the application

In the left side of the application the four features can be selected.

After pressing the submit button the application will predict the corresponding iris species  and return the results and the respective image in the bottom of the main panel.

An example of the original iris data is shown below. 

```
##   Sepal.Length Sepal.Width Petal.Length Petal.Width Species
## 1          5.1         3.5          1.4         0.2  setosa
## 2          4.9         3.0          1.4         0.2  setosa
## 3          4.7         3.2          1.3         0.2  setosa
```

--- .class #id 

## Shiny application and used machine learning method

This application was built with Shiny (http://shiny.rstudio.com).

As machine learning method Random forest was selected. (See http://en.wikipedia.org/wiki/Random_forest)

A summary of the confusion matrix table and accuracy is calculated below

```
## randomForest 4.6-10
## Type rfNews() to see new features/changes/bug fixes.
## Loading required package: lattice
## Loading required package: ggplot2
```

```
##             Reference
## Prediction   setosa versicolor virginica
##   setosa         20          0         0
##   versicolor      0         15         1
##   virginica       0          2        12
```

```
## [1] 0.94
```


Source of the pictures: http://en.wikipedia.org/wiki/Iris_flower_data_set

--- .class #id 

## Coursera

This Shiny application was developed during the Coursera Course "Developing Data Products".
