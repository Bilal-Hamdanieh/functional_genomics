quantile_normalization <- 
  
  function(bg_corrected_data){
    # bg_corrected data = Background Corrected Data: Normex
    
    # For ranking, sorting, accessing and manipulating rows and columns:
    # We focus on using apply() family methods instead of for loops to optimize speed
    
    # ranked cols matrix: Contains Expressions-> Ranks in their matrix
    ranked_cols_matrix <- apply(bg_corrected_data,2, rank,ties.method="min")
    
    # we can use apply(data,2,sort) to get the sorted matrix by columns
    sorted_cols_matrix <- apply(bg_corrected_data, 2, sort)
    
    # Get the mean of every row in the sorted_cols_matrix
    median_by_row <- rowMedians(sorted_cols_matrix)
    
    # Function replace_w_medians: Replaces all the exprs with the same rank with the medians of their rank
    replace_w_medians <- function(column, medians){
      # Rank-Frequency table: Gets all repeated expressions and their frequency
      rank_freq <- data.frame(table(column))
      rank_freq <- as.matrix(rank_freq)
      
      # Function to update row medians into row medians but column specific, check below for more...
      update_median <- function(rf, med){
        new_median <- rep(mean(med[as.integer(rf[1]):(as.integer(rf[1])+as.integer(rf[2])-1)]),rf[2])
        return (new_median)
      }
      # All Repeated Ranks will influence the medians => replace the medians with average of medians
      new_medians <- apply(rank_freq,1, update_median, med=median_by_row)
      new_medians <- unlist(new_medians)
      
      # Index to mean function: Replace all values with rank x with average median of the same rank
      index_to_mean <- function(my_index, my_mean){
        return(my_mean[my_index])
      }
      # Apply index_to_mean on column X
      final_result <- lapply(column, index_to_mean, my_mean=new_medians)
      final_result <- unlist(final_result)
      return(final_result)
    }
    
    # Apply replace_w_medians to every column of the matrix:
    final_result  <- apply(ranked_cols_matrix,2,replace_w_medians, medians=median_by_row)
    
    
    # Return Final Result
    return(final_result)
  }