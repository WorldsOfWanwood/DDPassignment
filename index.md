---
title       : Guinea Pig Tooth Growth Predictor
subtitle    : Pitch for app
author      : 
job         : 
framework   : io2012      # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## What it does

This app can predict the range of tooth growth that will occur in a guinea pig supplemented with different sources and dosages of vitamin c.

![picture](guineapig.jpg)


--- .class #id 


## Features

The app takes three inputs, and outputs a histogram of the tooth lengths expected, and text detailing the mean and standard deviation for that method. It responds reactively to all input, and immediatelly updates.

![picture](pres1.png)

--- .class #id 

## How it works
### Backend calculation

The program utilises the built in dataset ToothGrowth from the datasets package, and the qnorm and pnorm functions to calculate probabilities, and a boxplot as shown in this representative code chunk:
(previous code ommited for brevity)


```r
boxplot(lengths,ylab="Tooth length (mm)",main=title1)
```

![plot of chunk unnamed-chunk-2](assets/fig/unnamed-chunk-2-1.png) 

--- .class #id 

## Example :)

So if the user inputs "Orange Juice", "2mg", "80 %", and "12mm", the server calculates:
(previous code ommited for brevity




```r
mean<-mean(lengths)
sd <- sd(lengths)
upper<-round(qnorm(0.975,mean,sd),2)
lower<-round(qnorm(0.025,mean,sd),2)
paste("Mean growth is ",round(mean,2)," with a standard deviation of ",round(sd,2),
            ". So we would expect about 95 % of the guinea pigs to have tooth growth of between ",lower,
            "mm and ",upper,"mm.")
```

```
## [1] "Mean growth is  26.06  with a standard deviation of  2.66 . So we would expect about 95 % of the guinea pigs to have tooth growth of between  20.86 mm and  31.26 mm."
```

