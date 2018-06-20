# Some useful keyboard shortcuts for package authoring:
#
#   Build and Reload Package:  'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'

#' Write R data.frame to Tableau Extract.
#'
#' @param data input data.frame
#' @param path output path of Tableau Extract
#' @param spatial_columns index of spatial column, either number or name
#' @param spatial_indicator change spatial characteristic
#' @param add_index Add index column to Tableau Extract
#' @examples
#' \dontrun{
#' # The most simple example is outputting iris dataset into .tde or .hyper format:
#' write_tableau(iris,"iris.tde")
#'
#'
#' # Another example that involves setting spatial column and add index:
#' # I grabbed the following Brazil flights data off of kaggle for this example:
#' # https://www.kaggle.com/microtang/exploring-brazil-flights-data/data.
#' library(tidyverse)
#' library(RTableau)
#' # Read in the data and select first 1000 rows
#' example_df <- read_csv("BrFlights2.csv")
#' example_df <- slice(example_df,1:1000)
#'
#' # Set up a spatial column as `POINT (Lon Lat)` format
#' example_df <- example_df %>%
#'   mutate(SpatialDest = paste0("POINT (",round(LongDest,6)," ",round(LatDest,6),")"))

#' # Write .tde or .hyper Extract!
#' write_tableau(example_df,"BrFlights.tde","SpatialDest",add_index = T)
#' }
write_tableau <- function(data, path, spatial_columns=NA, spatial_indicator=T, add_index=F) {
  df_tableau <- pandleau$pandleau(reticulate::r_to_py(data))
  if(!is.na(spatial_columns)){
    spatial_columns <- ifelse(is.numeric(spatial_columns),spatial_columns-1,spatial_columns)
    df_tableau$set_spatial(reticulate::r_to_py(spatial_columns), indicator=reticulate::r_to_py(spatial_indicator))
  }
  df_tableau$to_tableau(reticulate::r_to_py(path),add_index=reticulate::r_to_py(add_index))
}
