## collect academic profile data from Google Scholar
# scholars = tibble containing scholar name/id
collect_scholar_data <- function(scholars,
                                 update = TRUE) {
  # ensure data is valid

  # make tibble to save scholar data
  num_scholars <- nrow(scholars)
  scholar_data <- tibble::tibble(
    ID = scholars$ID,
    Name = character(num_scholars),
    hIndex = integer(num_scholars),
    i10Index = integer(num_scholars),
    TotalCites = integer(num_scholars)
  )

  # download data from Google Scholar using scholar pkg
  for (i in 1:num_scholars) {
    # get profile data
    tryCatch(curr_profile <- scholar::get_profile(scholars$ID[i]),
             error = function() stop(paste("invalid Google Scholar ID:",
                                           scholars$ID[i])))

    # store appropriate data into tibble
    scholar_data$ID[i] <- scholars$ID[i]
    scholar_data$Name[i] <- name_val(first = scholars$First[i],
                                     middle = scholars$Middle[i],
                                     last = scholars$Last[i])
    scholar_data$hIndex[i] <- eval_metric(curr_profile$h_index)
    scholar_data$i10Index[i] <- eval_metric(curr_profile$i10_index)
    scholar_data$TotalCites[i] <- eval_metric(curr_profile$total_cites)

    # update message
    if (update) {
      print(paste("Collection for",
                  scholars$ID[i],
                  "complete."))
    }
  }

  return(scholar_data)
}
