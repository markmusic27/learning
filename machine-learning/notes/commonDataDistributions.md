# 🚨 Common Data Distributions

### __Uniform Distribution__

A uniform distribution is when there is constant probability of a value occurring within a given range.

```py
import numpy as np
import matplotlib.pyplot as plt

values = np.random.uniform(minNum, maxNum, amount)

plt.hist(values, 50)
plt.show()
```

Instead of the data being concentrated around the mean, a uniform distribution has an equal probability of the same value occurring.

### __Normal / Gaussian__

These are the normal curves we're familiar with. 

The data concentrates around the mean.

```py
import numpy as np
from scipy.stats import norm
import matplotlib.pyplot as plt

x = np.arrange(minNum, maxNum, increment)

plt.plot(x, norm.pdf(x))

# norm.pdf() stands for normal.probabilityDensityFunction

# The x is our y axis and the norm.pdf is the y function.
plt.show()
```

You can also do this with a discrete data:

```py
import numpy as np
import matplotlib.pyplot as plt

mu = 5.0

sigma = 2.0

values = np.random.normal(mu, sigma, 100000)

plt.hist(values, 50)

plt.show()
```

### __Exponential PDF / "Power Law"__ 

This distribution is when the values increase or decrease exponentially.

```py
import numpy as np
from scipy.stats import expon
import matplotlib.pyplot as plt

x = np.arrange(minNum, maxNum, increment)

plt.plot(x, expon.pdf(x))

# expon.pdf() stands for exponential.probabilityDensityFunction

# The x is our y axis and the norm.pdf is the y function.
plt.show()
```

### __Binominal PMF (Probability Mass Function)__

The Binominal PMF, with n and p, creates a discrete probability distribution of the numbers of successes in a sequence of independent n experiments, each asking a true or false (yes or no) question.

> Flipping coins

```py
import numpy as np
from scipy.stats import binom
import matplotlib.pyplot as plt

n, p = 10, 0.5

x = np.arrange(0, 10, 0.001)

plt.plot(x, binom.pmf(x, n, p))
```

### __Poisson PMF (Probability Mass Function)__

This data distribution has a very specific application. If you have data on the average number of things happening in some given time period, you would use this. This can predict the odds of getting some other value in the future.

> My website gets an average of 500 visits per day. What's the probability of getting550 in a future day?

```py
import numpy as np
from scipy.stats import poisson
import matplotlib.pyplot as plt

mu = 500

x = np.arrange(400, 600, 0.5)

plt.plot(x, poisson.pmf(x, mu))
```