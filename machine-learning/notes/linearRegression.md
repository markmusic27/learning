# 🏒 Linear Regression

All this is, is trying to fit a curve (some sort of function) to a set of observations. You can then use that function to predict new values.

The simplest form of regression analysis is linear regression. This is just when you fit a strait line to a set of observations. What you're trying to find is a linear relationship in the data.

<img src="https://miro.medium.com/max/688/0*Yfz5JM6W3a36FLD8.png" style="border-radius: 10px" />

The term _"Linear Regression"_ is actually quite misleading. Regression implies going backward when it not necessarily going backward. You could say that you are looking back to predict new values but that's kind of a stretch.

### __How it works__

Internally, it is made up of technique called _"ordinary least squares"_ or OLS.

What that consists of is essentially just minimizing the sum of squared-error between each point and the line (the distance between each point and the line).

### __Algorithm__

The slope of the line is the correlation of two variables multiplied by the standard deviation in $Y$, all then divided by the standard deviation of $X$.

The intercept is then just the mean of $Y$ minus the slope multiplied by the mean of $X$.

Essentially, it is the common formula: $y=mx+b$

### __Note__

When people talk about _"maximum likelihood estimation"_, they are just referring to maximizing the probability that a Y value corresponds to an X value.

### __Gradient Decent__

Gradient decent is another method to find the least squares.

It is almost exclusively used for 3D data (data that has X, Y, and Z).

<img src="https://hackernoon.com/hn-images/1*f9a162GhpMbiTVTAua_lLQ.png" height="200" style="border-radius: 10px" />

It is used for optimizing all types of of data. 

It is too big of a concept to cover in these notes but they will be covered in others.

