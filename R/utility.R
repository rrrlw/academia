## format names correctly
name.val <- function(first, middle, last) {
  if (is.na(middle)) {
    return(paste(capitalize(tolower(first)),
                 capitalize(tolower(last))))
  } else {
    return(paste(capitalize(tolower(first)),
                 capitalize(tolower(middle)),
                 capitalize(tolower(last))))
  }
}

