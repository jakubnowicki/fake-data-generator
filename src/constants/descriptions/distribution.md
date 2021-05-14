Column filled with values that follow given statistical distribution.
You can use one of the distributions available [here](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/Distributions.html). You can use
funciton name (eg. `rnorm`) or regular distribution name (eg. "Normal").
For available names, check [this file](https://github.com/jakubnowicki/fixtuRes/blob/master/inst/distributions.yaml).

Parameters:

* `type: distribution` - column type
* `distribution_type` - distribution name
* `...` - all arguments required by distribution function

Example:

```yaml
data_frame:
  columns:
    normal_distribution:
      type: distribution
      distribution_type: Gaussian
    bernoulli_distribution:
      type: distribution
      distribution_type: binomial
      size: 1
      prob: 0.5
    poisson_distribution:
      type: distribution
      distribution_type: Poisson
      lambda: 3
    beta_distribution:
      type: distribution
      distribution_type: rbeta
      shape1: 20
      shape2: 30
    cauchy_distribution:
      type: distribution
      distribution_type: Cauchy-Lorentz
```
