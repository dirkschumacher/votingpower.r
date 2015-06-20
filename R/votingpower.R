#' votingpower
#' 
#' Implements voting power indexes and algorithms.
#' 
#' @examples
#' # The famous Nassau County Board's voting system 
#' # [https://en.wikipedia.org/wiki/Banzhaf_power_index]
#' board <- create_weighted_voting_game(16, c(9, 9, 7, 3, 1, 1))
#' compute_bz_power(board)
#' @docType package
#' @name votingpower
NULL