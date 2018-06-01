<a rel="Delivery" href="https://github.com/BCDevExchange/assets/blob/master/README.md"><img alt="In production, but maybe in Alpha or Beta. Intended to persist and be supported." style="border-width:0" src="https://assets.bcdevexchange.org/images/badges/delivery.svg" title="In production, but maybe in Alpha or Beta. Intended to persist and be supported." /></a>[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

# Trends in B.C. Scrap Tire Recycling through Industry-led Product Stewardship (1991-2011)

An R script to populate an indicator on Trends in B.C. Scrap Tire Recycling through Industry-led Product Stewardship (1991-2011). This script reproduces the summary scrap tire plot published on [Environmental Reporting BC](http://www.env.gov.bc.ca/soe/indicators/sustainability/tire-recycling.html) in November 2012.

## Usage

### Data

The [scrap tire recycling data](https://catalogue.data.gov.bc.ca/dataset?q=tire) data used for the indicator is available from the [B.C. Data Catalogue](https://catalogue.data.gov.bc.ca/dataset?download_audience=Public):

- [BC FIRST Tire Recycling Data 1991-2006](https://catalogue.data.gov.bc.ca/dataset/a29ad492-29a2-44b9-8693-d27a8cc8e686) is available under the
[Open Government Licence - British Columbia](http://www2.gov.bc.ca/gov/content/governments/about-the-bc-government/databc/open-data/open-government-license-bc)
- [Tire Stewardship BC Tire Recycling Data](https://catalogue.data.gov.bc.ca/dataset/f791329b-c2dc-4f82-9993-209780f2a1c6) is available under the
[Access Only](http://www2.gov.bc.ca/gov/content?id=1AAACC9C65754E4D89A118B875E0FBDA) licence.


### Code

Most packages used in the analysis can be installed from CRAN using `install.packages()`, but you will need to install [envreportutils](https://github.com/bcgov/envreportutils) using devtools:


```r
install.packages("devtools") # If you don't already have it installed

library(devtools)
install_github("bcgov/envreportutils")
```

## Getting Help or Reporting an Issue

To report bugs/issues/feature requests, please file an [Issue](https://github.com/bcgov/tire-recycling-indicator/issues).

## How to Contribute

If you would like to contribute, please see our [CONTRIBUTING](CONTRIBUTING.md) guidelines.

Please note that this project is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md). By participating in this project you agree to abide by its terms.

## License

    Copyright 2016 Province of British Columbia

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at 

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
    
This repository is maintained by [Environmental Reporting BC](http://www2.gov.bc.ca/gov/content?id=FF80E0B985F245CEA62808414D78C41B). Click [here](https://github.com/bcgov/EnvReportBC) for a complete list of our repositories on GitHub.