# 🩹 Mean, Median, and Mode

### __Concepts__

These are pretty simple and fundamental concepts of statistics.

__The mean is just the average data.__

You calculate that with this equation:

<img src="https://i.ibb.co/2Wr9hPL/Screen-Shot-2020-12-16-at-5-09-05-PM.png" style="border-radius: 10px" height="100">

__The median is the data point in the middle of the data.__

You calculate that with this equation:

<img src="https://i.ibb.co/vs7NB6m/Screen-Shot-2020-12-16-at-5-10-54-PM.png" style="border-radius: 10px" height="100">

__The mode is the most common data point.__

You don't need a formula to calculate.

### __Using them in Python__

The first step in to import the `numpy` package

```py
import numpy as np
```

For the sakes of these notes, you can create a fake data set by using the `.random.normal()` method.

```py
incomes = np.random.normal(27000, 15000, 10000)

# The .normal says that its a normal distribution (bell curve)

# The distribution of the data set will be the first data point of 27000.

# The 15000 is the standard deviation of the data set.

# The 10000 is the total amount of data points.

# This will generate the fake data set

np.mean(incomes)

# This will find the mean of the data set.

np.median(incomes)

# This will find the median of the data set.
```

You can display the data with a package called `matplotlib`

```py
import matplotlib.pyplot as plt

# Since matplotlib is a large library, we are only importing .pyplot
```

To display the graph inline, add the line `%matplotlib inline`

```py
plt.hist(incomes, 50) 

# This will generate the graph. The 50 stands for the amount of buckets you want the data to be split up into

plt.show()
```

To get the mode, you import the `scipy` package.

```py
from scipy import stats

stats.mode(incomes)
```



