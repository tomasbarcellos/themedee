
<!-- README.md is generated from README.Rmd. Please edit that file -->

# dee

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![Travis build
status](https://travis-ci.org/tomasbarcellos/dee.svg?branch=master)](https://travis-ci.org/tomasbarcellos/dee)
[![AppVeyor build
status](https://ci.appveyor.com/api/projects/status/github/tomasbarcellos/dee?branch=master&svg=true)](https://ci.appveyor.com/project/tomasbarcellos/dee)
<!-- badges: end -->

O objetivo do pacote é oferecer padrões de temas e cores para os
gráficos do DEE.

## Instalação

O pacote ainda não está no [CRAN](https://CRAN.R-project.org). Quando
estiver será possível instalá-lo com o comando:

``` r
install.packages("dee")
```

Para instalar a versão de desenvolvimento do
[GitHub](https://github.com/) basta:

``` r
# install.packages("remotes")
remotes::install_github("tomasbarcellos/dee")
```

## Exemplo

Digamos que tenhamos um gráfico comum do ggplot, como o exemplo abaixo:

``` r
library(ggplot2)
#> Warning: package 'ggplot2' was built under R version 3.6.2
library(dee)
grafico <- ggplot(mtcars, aes(wt, mpg, col = factor(cyl))) +
  geom_point()
grafico
```

<img src="man/figures/README-unnamed-chunk-2-1.png" width="100%" />

Para mudar para um dos temas do DEE, é só `somar` o tema desejado:

``` r
grafico +
  theme_esquema()
```

<img src="man/figures/README-example-1.png" width="100%" />

Ou então outro tema:

``` r
grafico +
  theme_exemplo()
```

<img src="man/figures/README-cars-1.png" width="100%" />
