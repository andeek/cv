library(cranlogs)
library(dplyr)
library(stringr)

my_pkgs <- tools::CRAN_package_db() |> 
  filter(str_detect(Author, "Andee Kaplan"))

my_pkgs |> 
  as_tibble() |> 
  select(Package, Version, Author)

my_pkgs |> 
  pull(Package) |> 
  cran_downloads(from = "2010-04-09", to = Sys.Date()) |> 
  filter(count > 0) |> 
  group_by(package) |> 
  summarise(count_total = sum(count))
