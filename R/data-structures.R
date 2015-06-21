#' create_weighted_voting_game
#'
#' A weigthed voting game consists of a quota and an assembly.
#' In this case the quota is the number of weigthed votes that are 
#' needed to change the outcome to yes.
#' Each voter has a weight. 
#' 
#' @param quota the quota of the voting game.
#' @param weights A vector of weights. Each weight corresponds to one voter.
#' @return A list datastructure with two values: quota and weights 
#' corresponding to the input values.
#'
#' @export
create_weighted_voting_game <- function(quota, weights) {
  wvg <- list(quota = quota, weights = weights)
  class(wvg) <- "wvg"
  wvg
}

#' create_equal_weight_voting_game
#'
#' A voting game with an assembly with a quota and a number of voters
#' with equal weight of one.
#' 
#' @param quota the quota of the voting game.
#' @param n the number of voters
#' @return A list datastructure with two values: quota and weights 
#' corresponding to the input values.
#'
#' @export
create_equal_weight_voting_game <- function(quota, n) {
  create_weighted_voting_game(quota, rep.int(1, n))
}