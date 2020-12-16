# 🐼 Pandas Intro

### __What is it?__

In a few words, Pandas is a library that allows you to load, clean, and manipulate tabular data (data that is stored in columns and rows). This is essential because as a data scientist, you deal with this data a lot.

Pandas also has very good integration with libraries like `NumPy` and `Scikit_Learn`.

NumPy allows you to turn the data you get from Pandas and turn it into multidimensional arrays of data which you can then feed into your model with Scikit_Learn.

This would be the order:

1.  Clean, understand, and manipulate the data __with Pandas__.
2.  Convert and format the data into a multidimensional array __with NumPy__.
3.  Feed the data into the model __with Scikit_learn__

### __How do you use it?__

The first step would be to import it 

```py
import numpy as np # as just tells you to use it as this name
import pandas as pd # as just tells you to use it as this name
```

Here is an example of how you'd use it:

```py
df = pd.read_csv("PastHires.csv") 

# This is just opening and reading the data in the csv file. This then creates a pandas data frame. We are assigning that data frame to the variable df

df.head()

# We then are calling head to visualize the first five rows in the data frame.
```

__NOTE:__ CSV is stands for _comma separated values file_. Aka, just a file with tabular information where each column is separated by a comma.

Something that you can also do with the `.head()` method is pass in an integer to see a specific number of rows.

You can also call `.tail(3)` if you want to see the end of your data file.

### __Shape of data__

When you refer to the shape of the data, we are referring to the dimensionality of the data.

All that it says is the rows and the columns in your data.

To get the shape of your data, call `.shape()` which will return a tuple: `(#rows, #columns)`

### __Size of the data__

When you refer to the size of the data, you are referring to the total amount of cells in your data.

Basically just the total amount of unique data points.

This can be gotten by calling `.size()` or you can get it manually by multiplying the total amount of rows and the total amount of columns.

### __Columns and rows__

You can also call `len(df)` to get the length of the rows in your data.

The `.columns()` method will return an array with the names of the columns of the data.

### __Manipulating the data__

If you want to extract a single column of your data, use bracket notation and pass in the name of the columns that you want as a string.

```py
df["name of column"]
```

This is like a map in dart or a library in python.

You can also extract a given range within a column by using nested brackets.

```py
df["name of column"][:5] # will get me the first 5 data sets in the column
```

You can also extract a single value by using bracket notation with an index.

```py
df["name of column"][3] # will get me the first 4th data set
```

You can extract more than one column by using bracket notation and passing a list of the columns you want.

```py
df[["column1", "column2"]]
```

You can extract a range of values in multiple columns as well.

```py
df[["column1", "column2"]][:5] # will get me the first 5 data sets in the columns
```

You can sort your data frame by a specific value by using `.sort_values()`

```py
df.sort_values(["columnName"])
```

You can also do `.value_counts()` to get the total values in a column

```py
df["columnName"].value_counts()
```

You can then assign that to a value and plot the data in a histogram with the `.plot()`

```py
count = df["columnName"].value_counts()

count.plot(kind="bar") 

# kind="bar" just tells to plot in a bar graph
```

### __Terminology__

__A data-frame is a multi-dimensional object__. (the one that has all of the rows and columns)

When you extract __a single row or column, that is called a series.__

This is just a 1d array.

When you extract __a single value, that is just called a value.__
