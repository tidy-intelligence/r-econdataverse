
<!-- README.md is generated from README.Rmd. Please edit that file -->

# econdataverse

<!-- badges: start -->

![R CMD
Check](https://github.com/tidy-intelligence/r-econdataverse/actions/workflows/R-CMD-check.yaml/badge.svg)
![Lint](https://github.com/tidy-intelligence/r-econdataverse/actions/workflows/lint.yaml/badge.svg)
[![Codecov test
coverage](https://codecov.io/gh/tidy-intelligence/r-econdataverse/graph/badge.svg)](https://app.codecov.io/gh/tidy-intelligence/r-econdataverse)
<!-- badges: end -->

The ‘EconDataverse’ is a universe of open-source packages to work
seamlessly with economic data. This package is designed to make it easy
to install and load multiple ‘EconDataverse’ packages in a single step.
Learn more about the ‘EconDataverse’ at
[econdataverse.org](https://www.econdataverse.org).

## Installation

You can install `econdataverse` from CRAN via:

``` r
install.packages("econdataverse")
```

You can install the development version of `econdataverse` from
[GitHub](https://github.com/tidy-intelligence/r-econdataverse) with:

``` r
# install.packages("pak")
pak::pak("tidy-intelligence/r-econdataverse")
```

## Usage

`library(econdataverse)` will load the core EconDataverse packages:

- [`econid`](https://github.com/teal-insights/r-econid), for
  standardizing identifiers.
- [`econtools`](https://github.com/tidy-intelligence/r-econtools), for
  combining data sources.
- [`imfweo`](https://github.com/Teal-Insights/r-imfweo), for the
  International Monetary Fund World Economic Outlook (WEO).
- [`oecdoda`](https://github.com/tidy-intelligence/r-oecdoda), for the
  OECD Official Development Assistance (ODA).
- [`owidapi`](https://github.com/tidy-intelligence/r-owidapi), for the
  Our World in Data API.
- [`uisapi`](https://github.com/tidy-intelligence/r-uisapi), for the
  UNESCO Institute for Statistics API.
- [`wbids`](https://github.com/Teal-Insights/r-wbids/issues), for the
  World Bank International Debt Statistics (IDS).
- [`wbwdi`](https://github.com/tidy-intelligence/r-wbwdi), for the World
  Bank World Development Indicators (WDI).

``` r
library(econdataverse)
#> ── Attaching core EconDataverse packages ─────────── econdataverse 0.0.0.9000 ──
#> ✔ econid    0.0.2     ✔ owidapi   0.1.1
#> ✔ econtools 0.1.0     ✔ uisapi    0.1.0
#> ✔ imfweo    0.1.0     ✔ wbids     1.0.0
#> ✔ oecdoda   0.1.0     ✔ wbwdi     1.0.1
```

## Contributing

Contributions to `econdataverse` are welcome! If you’d like to
contribute, please follow these steps:

1.  **Create an issue**: Before making changes, create an issue
    describing the bug or feature you’re addressing.
2.  **Fork the repository**: After receiving supportive feedback from
    the package authors, fork the repository to your GitHub account.
3.  **Create a branch**: Create a branch for your changes with a
    descriptive name.
4.  **Make your changes**: Implement your bug fix or feature.
5.  **Test your changes**: Run tests to ensure your changes don’t break
    existing functionality.
6.  **Submit a pull request**: Push your changes to your fork and submit
    a pull request to the main repository.
