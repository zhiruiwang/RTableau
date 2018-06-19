# RTableau

A quick and easy way to convert an R data.frame to a Tableau .tde or .hyper Extract.

## Getting Started

### Prerequisites
 - This package use R package [reticulate](https://github.com/rstudio/reticulate) as an interface to use my co-authored Python package [pandleau](https://github.com/bwiley1/pandleau). In order to use the package, you must install Python. [Anaconda Distribution](https://www.anaconda.com/download/) is recommended. You can download either Python 2 or 3.
 - After installation of Python, following the instruction in the `Prerequisites` and `Installing` section of [pandleau](https://github.com/bwiley1/pandleau) to install TableauSDK(or Extract API 2.0) and pandleau itself.

### Installing

Once installing prerequisites is done, install the package from this repository:  
```R
install.packages("devtools")
devtools::install_github("https://github.com/zhiruiwang/RTableau")
```

## Example

```R
library(RTableau)
write_tableau(iris,"iris.tde")
```

## Authors

* **Zhirui(Jerry) Wang**  - [zhiruiwang](https://github.com/zhiruiwang)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details