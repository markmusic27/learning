# 🌼 Polynomial Regression

### __General Idea__

The whole idea of polynomial regression is that sometimes your data is simply not best represented by a strait line (linear regression). Polynomial regression is just another model that can be used to predict future values when your data doesn't follow a linear trend. 

Essentially, polynomial regression is used when there are curves in your data.

Examples:

| Degree | Formula |
| ------ | ------- |
| 1 | $y=mx+b$ |
| 2 | $y=ax^2+b+c$ |
| 3 | $y=ax^3+bx^2+cx+d$ |

__NOTE__ The higher the degree of the polynomial, the more complex the curves of the regression (the relationships) are. 

### __Overfitting__

Sometimes, when people try to overfit their data to make their model perfect. What ends up happening is you end up having very large degrees for the polynomials.

It is important to note that many times, your data will have some natural relationship. 

Whenever you start to create your polynomial regression model, visualize your data and ask yourself: "how complex does this curve really need to be". Remember that the point of polynomial regression is NOT to map the data exactly, it is to get accurate predictions of future values.

### Using it in Python

For this, we are going to be using the `numpy` package.

```py
import numpy as np

np.polyfit(x, y, degree)
```

What we're doing here is passing in the x value, y value, and the degree of the polynomial we want to use.
