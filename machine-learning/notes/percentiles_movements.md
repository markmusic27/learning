# 🗿 Percentiles and Movements

### __Percentiles__

If you were to sort the data, a percentile is the point at which that percent of the data is less than the percent you're at.

> 99th percentile is just 1%
> 20th percentile is 80%

__For example:__ My SAT scores were in the 99th percentile.

This would mean that _you scored higher than 99% of all of the other people who took the SAT_ in that year.

#### __Percentiles in Normal Distributions:__

When people talk about percentiles in Normal Distributions, you very often hear the word quartiles. This refers to the different quartiles in box and whisker plots and how they can be associated to normal distributions.

<img src="https://i.ibb.co/n7njJrx/Screen-Shot-2020-12-17-at-10-09-24-AM.png" height="200" style="border-radius: 10px"/>

Here is where the data is found in quartiles:

-   __Within Q1 and Q3 (IQR)__ lies 50% of the data.

### __Percentiles in Python__

Just like always, we're creating a random data set and plotting it in a histogram.

```py
import numpy as np
import matplotlib.pyplot as plt

values = np.random.normal(0, 5, 10000)

plt.hist(values, 50)
plt.show()
```

To get the percentile value, we can use `numpy`'s percentile method.

```py
np.percentile(values, percentileValueYouWant) 
```

### __Moments__

Moments are basically a way to measure the shape of a data distribution.

Even though it looks complex, its actually pretty simple conceptually.

Here's the moments formula:

<img src="https://i.ibb.co/h2SVKXw/Untitled-design.png" height="150" style="border-radius: 10px"/>

Here are the different moments and what they mean:

-   __Moment #1__: is the mean, the average.
-   __Moment #2__: is the variance.

Thats it!

The third and and fourth moments are a bit more complex:

-   __Moment #3__: is skew (__${\gamma}$__)
-   __Moment #4__: is kurtosis.

#### __Skew:__

It is essentially how "lopsided" the distribution is.

>If a distribution has a longer tail on the left, it will be skewed to the left and have a negative skew

<img src="https://i.ibb.co/L53fz6x/Screen-Shot-2020-12-18-at-10-58-10-AM.png" height="150" style="border-radius: 10px"/>

__DECONSTRUCTION:__ The grey line is how a normal distribution would look. 

#### __Kurtosis:__

Al that really is is how thick is the tail and how sharp is the peak,compared to a normal distribution.

>Higher peaks have a higher kurtosis.

Basically, it measures how peaked your data is.

### __Moments in Python__

Here is how you would get each of these moments in Python.

The first thing is to import the libraries needed. In this case, `numpy` and `scipy`

```py
import numpy as np
import scipy as sp
```

-   __Moment 1 (Mean):__ `np.mean(data)`
-   __Moment 2 (Variance):__ `np.var(data)`
-   __Moment 3 (Skew):__ `sp.skew(data)`
-   __Moment 4 (Kurtosis):__ `sp.kurtosis(data)`