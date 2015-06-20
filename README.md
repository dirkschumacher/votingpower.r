# Measure voting power in R
[![Build Status](https://travis-ci.org/dirkschumacher/votingpower.r.png?branch=master)](https://travis-ci.org/dirkschumacher/votingpower.r)
[![Coverage Status](https://coveralls.io/repos/dirkschumacher/votingpower.r/badge.svg?branch=master)](https://coveralls.io/r/dirkschumacher/votingpower.r?branch=master)

Have you ever asked yourself if weigthed voting is fair? This package implements (or will implement) some of the most popular voting power measurement methods. 

Imagine you are a representative of the country Luxembourg in the European Economic Community of 1958. Germany, France and Italy hat 4 votes each, Belgium and the Netherlands 2 and Luxembourg 1 vote. The necessary quota was 12 out of the 17 votes. The problem is, there exist no situation where the vote of Luxembourg counts; i.e. would change the outcome for a yes to no - this is called being critical. 

This topic is a bit esoteric but quite interesting. Quite some algorithms exists both for measuring power and for the inverse problem: designing weights such that a specific voting power is achieved.

Current version: 0.0.1

# Installation

To install the current development version use devtools:

```R 
devtools::install_github("dirkschumacher/votingpower.r")
```

## Quick start
Let us recreate the example of the EEC from above.

```R
library(votingpower)
eec <- create_weighted_voting_game(12, c(4, 4, 4, 2, 2, 1))
# the Banzhaf score counts the coalitions where a voter is critical.
score <- compute_bz_score(eec)
print(score) 
# [1] 10 10 10 6 6 0

# The probability of a voter being critical is a good indicator for power
power <- compute_bz_power(eec)
print(score) 
# [1] 0.3125 0.3125 0.3125 0.1875 0.1875 0.0000

# The below is the power according to the weights
print(round(eec$weights / sum(eec$weights), 2))
# [1] 0.24 0.24 0.24 0.12 0.12 0.06
```
More can be found [here](https://en.wikipedia.org/wiki/Banzhaf_power_index) or in the book of Felsenthal & Machover (1998).

## API
* `create_weighted_voting_game` Create a weigthed voting game.
* `create_simple_voting_game` Creates a simple voting game. A simple voting game is a weighted voting game with weights = 1 for all voters.
* `compute_bz_score` For a voting game this function computes the Bz score; i.e. the number of times a voter is critical.
* `compute_bz_index` Bz index is the Bz score normalised by the sum of the Bz scores.
* `compute_bz_power` The Bz power is the Bz score devided by 2^(n-1) where n is the number of voters. It corresponds to the probability a voter is critical.

## Versioning
This package uses [Semantic Versioning 2.0](http://semver.org/). 

## References

Felsenthal, Dan S; Machover, Moshé (1998), The measurement of voting power theory and practice, problems and paradoxes, Cheltenham: Edward Elgar
