## format names correctly
name_val <- function(first, middle, last) {
  if (is.na(middle)) {
    return(paste(capitalize(tolower(first)),
                 capitalize(tolower(last))))
  } else {
    return(paste(capitalize(tolower(first)),
                 capitalize(tolower(middle)),
                 capitalize(tolower(last))))
  }
}

## read in academician info data
read_scholars <- function(file_name) {
  readr::read_csv(file = file_name,
                  col_types = cols(
                    First = col_character(),
                    Middle = col_character(),
                    Last = col_character(),
                    ID = col_character()
                  ))
}
