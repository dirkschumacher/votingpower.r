#' compute_bz_score
#'
#' Computes the Bz score for each voter. The Bz score is the number of coalitions
#' where that voter is critical; i.e. where voting no changes the outcome.
#' 
#' The current algorithm has an exponential running time in terms of the 
#' number of voters.
#' 
#' @param wvg a weigthed or simple voting game.
#' @return A vector of Bz scores. The order corresponds to the order of the voters.
#'
#' @export
compute_bz_score <- function(wvg) {
  if (!("wvg" %in% class(wvg))) {
    stop("wvg must be a weighted or simple voting game") 
  }
  number_assembly <- length(wvg$weights)
  bz_scores <- 1:length(wvg$weights) %>% 
    Map(f = function(n) {
      combn(number_assembly, n, simplify = FALSE)
    }) %>%
    unlist(recursive = FALSE) %>%
    Map(f = function(coalition) {
      voters <- 1:number_assembly %in% coalition
      coalition_weight <- sum(wvg$weights[coalition])
      is_critical <- coalition_weight >= wvg$quota & 
        coalition_weight - as.numeric(voters) * wvg$weights < wvg$quota
      as.numeric(is_critical)
    }) %>%
    Reduce(f = "+")
  bz_scores
}

#' compute_bz_index
#'
#' Computes the Bz index for each voter. The Bz index is the Bz score normalised.
#' 
#' The current algorithm has an exponential running time in terms of the 
#' number of voters.
#' 
#' @param wvg a weigthed or simple voting game.
#' @return A vector of Bz indexes The order corresponds to the order of the voters.
#'
#' @export
compute_bz_index <- function(wvg) {
  bz_score <- compute_bz_score(wvg)
  bz_score / sum(bz_score)
}

#' compute_bz_power
#'
#' The Banthaf voting power measure is corresponds to the probability that 
#' a voter is critical.
#'
#' The current algorithm has an exponential running time in terms of the 
#' number of voters.
#'  
#' @param wvg a weigthed or simple voting game.
#' @return A vector of Bz power measures. The order corresponds to the order 
#' of the voters.
#'
#' @export
compute_bz_power <- function(wvg) {
  bz_score <- compute_bz_score(wvg)
  bz_score / 2^(length(wvg$weights) - 1)
}
