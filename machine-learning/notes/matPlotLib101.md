# 🐊 `matplotlib` 101

### __Display a graph__

One of the best methods to use is simply the `.plot()` method.

This will simply plot both the "x" and "y" axis.

```py
import matplotlib.pyplot as plt
import numpy as np
from scipy import norm

x = np.arrange(-3, 3, 0.001)

plt.plot(x, norm.pdf(x))
plt.show()
```

### __Display multiple graphs__

You can render multiple plots in one graph by simply calling `.plot()` more than once.

```py
import matplotlib.pyplot as plt
import numpy as np
from scipy import norm

x = np.arrange(-3, 3, 0.001)
x2 = np.arrage(-2, 2, 0.01)

plt.plot(x2, norm.pdf(x2))
plt.plot(x, norm.pdf(x))

plt.show()
```

### __Save it to a file__

To do this, simply call `.savefig()`

```py
plt.savefig("/Users/markmusic/Developer", format="png")
```

### __Adjust the Axes__

```py
axes = plt.axes() # Creates an instance
axes.set_xlim([-5, 5]) # X limit
axes.set_ylim([0, 1.0]) # Y limit
axes.set_xticks([-5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5]) # Tick Marks
axes.set_yticks([0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0]) # Tick Marks
```

### __Add a Grid__

Add an:

```py
axes.grid()
```

### __Change Line Types and Colors__

Add a the color as a third parameter.

```py
plt.plot(x, norm.pdf(x), 'b-')
plt.plot(x, norm.pdf(x, 1.0, 0.5), 'r:')
```

### __Labeling Axis and adding a Legend__

You add a legend with:

```py
plt.legend(['Sneetches', 'Gacks'], loc=4) # loc is in what corner
```

You label axis with:

```py
plt.xlabel('Greebles')
plt.ylabel('Probability') 
```

### __Pie Charts__

```py
values = [12, 55, 4, 32, 14]
colors = ['r', 'g', 'b', 'c', 'm']
explode = [0, 0, 0.2, 0, 0]
labels = ['India', 'United States', 'Russia', 'China', 'Europe']
plt.pie(values, colors= colors, labels=labels, explode = explode)
plt.title('Student Locations')
plt.show()
```

### __Bar Chart__

```py
values = [12, 55, 4, 32, 14]
colors = ['r', 'g', 'b', 'c', 'm']
plt.bar(range(0,5), values, color= colors)
```

### __Scatter Plot__

```py
from pylab import randn

X = randn(500)
Y = randn(500)
plt.scatter(X,Y)
```

### __Histograms__

```py
incomes = np.random.normal(27000, 15000, 10000)
plt.hist(incomes, 50) # 50 is the number of buckets of data
```

### __Box and Whisker__

Useful for visualizing the spread & skew of data.

The red line represents the median of the data, and the box represents the bounds of the 1st and 3rd quartiles.

So, half of the data exists within the box.

The dotted-line "whiskers" indicate the range of the data - except for outliers, which are plotted outside the whiskers. Outliers are 1.5X or more the interquartile range.

This example below creates uniformly distributed random numbers between -40 and 60, plus a few outliers above 100 and below -100:

```py
uniformSkewed = np.random.rand(100) * 100 - 40
high_outliers = np.random.rand(10) * 50 + 100
low_outliers = np.random.rand(10) * -50 - 100
data = np.concatenate((uniformSkewed, high_outliers, low_outliers))
plt.boxplot(data)
plt.show()
```