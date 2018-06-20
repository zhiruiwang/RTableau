# RTableau

A quick and easy way to convert an R data.frame to a [Tableau](https://www.tableau.com/) .tde or .hyper Extract.

## Getting Started

### Prerequisites
 - This package uses R package [reticulate](https://github.com/rstudio/reticulate) as an interface to use my co-authored Python package [pandleau](https://github.com/bwiley1/pandleau). In order to use the package, you must install Python. [Anaconda Distribution](https://www.anaconda.com/download/) is recommended. You can download either Python 2 or 3.
 - After installation of Python, following the instruction in the `Prerequisites` and `Installing` section of [pandleau](https://github.com/bwiley1/pandleau) to install TableauSDK(or Extract API 2.0, depends on whether you want to output as .tde or .hyper format) and pandleau itself.

### Installing

Once installing prerequisites is done, install the package from this repository:  
```R
install.packages("devtools")
devtools::install_github("zhiruiwang/RTableau")
```

## Example

The most simple example is output iris dataset into .tde or .hyper format:
```R
library(RTableau)
write_tableau(iris,"iris.tde")
```
Another example that involves setting spatial column and add index:  
I grabbed the following Brazil flights data off of kaggle for this example: https://www.kaggle.com/microtang/exploring-brazil-flights-data/data.

```R
library(tidyverse)
library(RTableau)
# Read in the data and select first 1000 rows
example_df <- read_csv("BrFlights2.csv")
example_df <- slice(example_df,1:1000)

# Set up a spatial column as `POINT (Lon Lat)` format
example_df <- example_df %>% 
  mutate(SpatialDest = paste0("POINT (",round(LongDest,6)," ",round(LatDest,6),")"))

# Write .tde or .hyper Extract!
write_tableau(example_df,"BrFlights.tde","SpatialDest",add_index = T)

```

## Authors

* **Zhirui(Jerry) Wang**  - [zhiruiwang](https://github.com/zhiruiwang)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
