# Measure voting power in R
[![Build Status](https://travis-ci.org/dirkschumacher/votingpower.r.png?branch=master)](https://travis-ci.org/dirkschumacher/votingpower.r)
[![Coverage Status](https://coveralls.io/repos/dirkschumacher/votingpower.r/badge.svg?branch=master)](https://coveralls.io/r/dirkschumacher/votingpower.r?branch=master)

Have you ever asked yourself if weighted voting is fair? This package implements (or will implement) some of the most popular voting power measurement methods. 

Imagine you are a representative of the country Luxembourg in the European Economic Community of 1958. At that time Germany, France and Italy had 4 votes each, Belgium and the Netherlands 2 and Luxembourg 1 vote. The necessary quota was 12 out of the 17 votes. The problem was however: there exist no situation where the vote of Luxembourg counts; i.e. would change the outcome of a "yes" to "no" - this is called being critical.

This topic is a bit esoteric but quite interesting. A number of algorithms exists both for measuring power and for the inverse problem: designing weights such that a specific voting power is achieved. The currently implemented methods have an exponential running time. However there exist some more advanced methods when dealing with larger voting bodies.

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
# > [1] 10 10 10 6 6 0

# The probability of a voter being critical is a good indicator for power
power <- compute_bz_power(eec)
print(power) 
# > [1] 0.3125 0.3125 0.3125 0.1875 0.1875 0.0000

# The below is the power according to the weights
print(round(eec$weights / sum(eec$weights), 2))
# > [1] 0.24 0.24 0.24 0.12 0.12 0.06
```
More can be found [here](https://en.wikipedia.org/wiki/Banzhaf_power_index) or in the book of Felsenthal & Machover (1998). Below is a plot of the voting power of the EEC members in relation to the quota.

![Voting power in the EEC](https://raw.githubusercontent.com/dirkschumacher/dirkschumacher.github.io/master/images/votingpower_eec.png)

## API
* `create_weighted_voting_game` Create a weighted voting game.
* `create_simple_voting_game` Creates a simple voting game. A simple voting game is a weighted voting game with weights = 1 for all voters.
* `compute_bz_score` For a voting game this function computes the Bz score; i.e. the number of times a voter is critical. 
* `compute_bz_index` Bz index is the Bz score normalised by the sum of the Bz scores.
* `compute_bz_power` The Bz power is the Bz score divided by 2^(n-1) where n is the number of voters. It corresponds to the probability a voter is critical.

## Versioning
This package uses [Semantic Versioning 2.0](http://semver.org/). 

## References
Werner Kirsch: Europa, nachgerechnet, Die Zeit, 9. Juni 2004

Felsenthal, Dan S; Machover, Moshé (1998), The measurement of voting power theory and practice, problems and paradoxes, Cheltenham: Edward Elgar
 
