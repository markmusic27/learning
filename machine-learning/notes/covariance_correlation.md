# 🪐 Covariance and Correlation

Covariance and Correlation allow you to see if two attributes are actually related to each other mathematically. __This is the mathematical tools to do so.__ 

### __Covariance__

Think of covariance as taking multidimensional vectors variances from the mean for each attribute and computing the angle between them.



Covariance basically measures how two variables vary in tandem from their means. 

The thing about covariance is that it's hard to measure. Like ${R^2}$, the value is the amount of relationship these variables have. 

>If the covariance is 0, then we know that there is a low relationship between the variables.

However, not like the ${R^2}$ value, its doesn't have a max like 1. The max is dependant on the units you're using . With covariance, we don't know what large means.

This is where correlation comes in!

### __Correlation__

_The range of correlation is from $-1$ to $1$._

To measure it, all you have to do is divide the covariance by the standard deviation of both variables you're measuring.

This will normalize that issue that we were having with covariance.

__Here is what these values mean:__

-   A correlation of ${-1}$ means there is a perfect inverse correlation.
-   A correlation of ${0}$ means that there is no correlation
-   A correlation of ${1}$ means that there is a perfect correlation.

__NOTE:__ Just because there is a correlation doesn't mean that there's causation (that one value causes the other). Instead, it allows you to decide on which experiment to conduct.

### __Computing it in Python__

Covariance:

```py
import numpy as np
from pylab import *
 
# This function finds the deviation from the mean for a list of values. What were doing is simply finding the mean and then returning a list where each values is the value in the list minus the mean of the list.

def de_mean(x):
    xmean = mean(x)
    return [xi - xmean for xi in x]

# This function finds the covariance. It does it by finding the dot product between the deviation of x, y and dividing by n -1 since the data is a sample and not a population.

def covariance(x, y){
    n = len(x)
    return dot(de_mean(x), de_mean(y) / n -1)
}
```

Correlation

```py
import numpy as np

# This function finds the correlation. What we do to find the correlation is just find the standard deviation for x and y and then simply find the quotient of the covariance and the standard deviation of both x and y.

def correlation(x, y):
    sdx = x.std()
    sdy = y.std()

    return correlation(x, y) / sdx / sdy
```

You can also do this with the `numpy` package

```py
import numpy as np

np.corrcoef(x, y)

np.cov(x, y)
```

