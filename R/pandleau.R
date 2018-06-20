#' global reference to pandleau (will be initialized in .onLoad)
pandleau <- NULL

.onLoad <- function(libname, pkgname) {
  # use superassignment to update global reference to pandleau
  pandleau <<- reticulate::import("pandleau", delay_load = TRUE)
}
