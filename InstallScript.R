

##### rgee install

## Christopher Tsz Hin Choi
## Christopher.Choi@colostate.edu
## 05/31/2022

## Set up for reference

## Source: https://www.youtube.com/watch?v=_fDhRL_LBdQ&ab_channel=DataNinjas

install.packages('rgee')
install.packages('reticulate')
install.packages('remotes')

## Install r-spatial/rgee
remotes::install_github('r-spatial/rgee')

library(reticulate)
library(rgee)

py_discover_config()

import('sys')$executable

ee_install()

## Check if everything downloaded
ee_check()

#set Python version to use
reticulate::use_python('C:/Users/cchoi/.conda/envs/rgee/python.exe', required = TRUE)
reticulate::py_config()

## Inisitialize GEE
ee_Initialize()

## Test
ee$String('Hello world')$getInfo()

## rgee documentation
# https://r-spatial.github.io/rgee/reference/rgee-package.html

## Community Datasets
# https://github.com/samapriya/awesome-gee-community-datasets



