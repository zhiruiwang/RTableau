# Some useful keyboard shortcuts for package authoring:
#
#   Build and Reload Package:  'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'

#' @import reticulate

#' global reference to pandleau (will be initialized in .onLoad)
pandleau <- NULL

.onLoad <- function(libname, pkgname) {
  # use superassignment to update global reference to pandleau
  pandleau <<- reticulate::import("pandleau", delay_load = TRUE)
}

#' Write R data.frame to Tableau Extract.
#'
#' @param data input data.frame
#' @param path output path of Tableau Extract
#' @param spatial_columns index of spatial column, either number or name
#' @param spatial_indicator change spatial characteristic
#' @param add_index Add index column to Tableau Extract
#' @examples
#' write_tableau(iris,"iris.tde")
write_tableau <- function(data, path, spatial_columns=NA, spatial_indicator=T, add_index=F) {
  df_tableau <- pandleau$pandleau(reticulate::r_to_py(data))
  if(!is.na(spatial_columns)){
    spatial_columns <- ifelse(is.numeric(spatial_columns),spatial_columns-1,spatial_columns)
    df_tableau$set_spatial(reticulate::r_to_py(spatial_columns), indicator=reticulate::r_to_py(spatial_indicator))
  }
  df_tableau$to_tableau(reticulate::r_to_py(path),add_index=reticulate::r_to_py(add_index))
}
