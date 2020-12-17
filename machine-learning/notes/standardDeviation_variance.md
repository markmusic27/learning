# 🎟 Standard Deviation and Variance

Standard Deviation and Variance are two fundamental concepts in statistics.

#### __Standard Deviation__

Standard deviation is, on average, how far away the data plots are from the mean.

This is the equation for standard deviation:

<img src="https://i.ibb.co/XL36WvC/Screen-Shot-2020-12-16-at-6-02-51-PM.png" height="100" style="border-radius: 10px"/>

#### __Variance__

Variance is the average of the squared differences from the mean.

This is the equation for standard deviation:

<img src="https://www.datasciencemadesimple.com/wp-content/uploads/2017/07/Population-Variance-Formula-2.jpg" height="100" style="border-radius: 10px"/>

#### __Difference__

The difference between Standard Deviation and Variance mathematically is that you don't square root the variance while you do for standard deviation.

_Standard Deviation: $\sigma$_

_Variance: $\sigma^{2}$_

### __Identifying Outliers__

Typically, in a normal curve, this is how the data is distributed:

-   __68%__ of all of the data is within 1 Standard Deviation away from the mean.
-   __95%__ of all of the data is within 2 Standard Deviations away from the mean.
-   __99.7%__ of all of the data is within 3 Standard Deviations away from the mean.

Knowing this, we can make a judgement call as to what data points are considered outliers.

__NOTE:__ This is dependant on the data

In most cases, outliers are not within 2 or 3 Standard Deviations from the mean.

### __Standard Deviation / Variance in Sample Data__

If you are taking a portion of the data (a sample) instead of the whole data, you need to subtract `N - 1` to divide that from the sum of the differences of the squares.

This would be the formula form Sample Variance:

<img src="https://i.ibb.co/mTz6s4R/Screen-Shot-2020-12-16-at-6-11-58-PM.png" height="100" style="border-radius: 10px"/>

This would be the formula form Sample Standard Deviation:

<img src="https://media.cheggcdn.com/media%2Ffb2%2Ffb229b3b-7787-4b44-b401-93e6a39b5890%2FphpZEGuzV.png" height="100" style="border-radius: 10px"/>

### __Standard Deviation / Variance in Python__

The first step in to import the `numpy` package

```py
import numpy as np
import matplotlib.pyplot as plt
```

For the sakes of these notes, you can create a fake data set by using the `.random.normal()` method.

To display the graph inline, add the line `%matplotlib inline`

You can display the data with a package called `matplotlib`

```py
incomes = np.random.normal(27000, 15000, 10000)

plt.hist(incomes, 50) 
plt.show()

np.std(incomes)

# This wil compute the standard deviation of the data

np.var(incomes)

# This will compute that variance of the data
```