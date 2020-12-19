# 🏝 `seaborn` 101

Seaborn is essentially a library that extends `matplotlib` and makes it a bit easier and prettier to look at.

Anytime that you want to use seaborn, you have to import it and set it.

```py
import seaborn as sns

sns.set()
```

### __Unique plots__

The amazing thing about seaborn is that it allows you to use graphs that `matplotlib` simply doesn't have.

One of these is displot which allows you to plot a distribution from a histogram.

```py
sns.displot(data)
```

### __Pair plot__

This is really interesting since it allows you to see every combination of plots to see which ones you like.

```py
sns.pairplot(data, column, height)
```

### __Scatter plot__

Even though matplotlib has a way to visualize scatter plots, seaborn makes a prettier, and overall better version of it.

```py
sns.scatterplot(x="dataColumn", y="dataColumn", data=data)
```

### __Linear Regression Scatter Plot__

```py
sns.lmplot(x="dataColumn", y="dataColumn", data=data)
```

### __Box & Whisker Plots__

This is another example where seaborn has something done better than matplotlib.

```py
sns.set(rc={"figure.figsize": (5, 15)}) # This will simply give us more space to work with.
ax = sns.boxplot(x="xColumn", y="yColumn", data=data) # This will create the individual box plots
ax.set_xsticklabels(ax.get_xsticklabels(), rotation=45) # This will label the x axis and give them a rotation of 45 to see them better.
```

### __Swarm Plot__

```py
ax = sns.swarmplot(x="dataColumn", y="dataColumn", data=data) # This will take care of plotting that data.
ax.set_xsticklabels(ax.get_xsticklabels(), rotation=45) # This will label the x axis and give them a rotation of 45 to see them better.
```

### __Count Plot__

A histogram only really works when you have numerical data, count plots are used when the data is categorical.

```py
ax = sns.countplot(x="dataColumn", data=data)
ax.set_xsticklabels(ax.get_xsticklabels(), rotation=45)
```

### __Heat Map__

This is one of the coolest ways to see and visualize data. They essentially allow you to plot 2D data were the colors represent the values within each table.

> The contribution log in GitHub is a Heat Map

```py
df2 = df.pivot_table(index="Cylinders", columns="Eng Displ", values="ComboMGP", aggFunc="mean") # This is just taking the raw data and creates a pivot table (multidimensional array to 2D array). Index is just the y and the columns is the x axis. Then the values is what the correlation between cars with same x and y axis vals. Then you represent those values with color. The aggFunc is the aggregated function which is essentially just called when there are multiple cars with the same value. In this case, it will use the mean of both values
sns.heatmap(df2)
```