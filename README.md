
<!-- README.md is generated from README.Rmd. Please edit that file -->

# wmata

This package provides a R interface to the Washington Metropolitan Area
Transit Authority (WMATA) [API](https://developer.wmata.com/)

## Usage

You can use this interface to query the WMATA API. For example, you can
get the real time predictions for train arrivals at Metro Center (code
A01):

``` r
library(wmata)

# get data
j <- next_trains("A01")

# show just the first 3 results
str(j$Trains[1:3], 2)
#> List of 3
#>  $ :List of 9
#>   ..$ Car            : chr "8"
#>   ..$ Destination    : chr "Glenmont"
#>   ..$ DestinationCode: chr "B11"
#>   ..$ DestinationName: chr "Glenmont"
#>   ..$ Group          : chr "1"
#>   ..$ Line           : chr "RD"
#>   ..$ LocationCode   : chr "A01"
#>   ..$ LocationName   : chr "Metro Center"
#>   ..$ Min            : chr "BRD"
#>  $ :List of 9
#>   ..$ Car            : chr "8"
#>   ..$ Destination    : chr "Shady Gr"
#>   ..$ DestinationCode: chr "A15"
#>   ..$ DestinationName: chr "Shady Grove"
#>   ..$ Group          : chr "2"
#>   ..$ Line           : chr "RD"
#>   ..$ LocationCode   : chr "A01"
#>   ..$ LocationName   : chr "Metro Center"
#>   ..$ Min            : chr "BRD"
#>  $ :List of 9
#>   ..$ Car            : chr "8"
#>   ..$ Destination    : chr "Takoma"
#>   ..$ DestinationCode: chr "B07"
#>   ..$ DestinationName: chr "Takoma"
#>   ..$ Group          : chr "1"
#>   ..$ Line           : chr "RD"
#>   ..$ LocationCode   : chr "A01"
#>   ..$ LocationName   : chr "Metro Center"
#>   ..$ Min            : chr "6"
```

A data frame with mappings from stations to station codes is provided as
the object `stations`:

``` r
head(stations[c("Code", "Name")], 10)
#>    Code                          Name
#> 1   A01                  Metro Center
#> 2   A02                Farragut North
#> 3   A03                 Dupont Circle
#> 4   A04 Woodley Park-Zoo/Adams Morgan
#> 5   A05                Cleveland Park
#> 6   A06                  Van Ness-UDC
#> 7   A07                 Tenleytown-AU
#> 8   A08            Friendship Heights
#> 9   A09                      Bethesda
#> 10  A10                Medical Center
```

## Installation

You can install the released version of wmata from
[GitHub](https://github.com/zamorarr/wmata) with:

``` r
devtools::install_github("zamorarr/wmata")
```

You will also have to sign up for a WMATA developer key at
<https://developer.wmata.com/>. Once you get a key, edit your .Renviron
file and place this line in there (replacing XXX with your key):

``` sh
WMATA_KEY=XXXXXXX
```

You can use `usethis::edit_r_environ()` to edit your .Renviron file.
