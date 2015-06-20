context("bz")

test_that("bz scores are correct for svgs.", {
  svg <- create_simple_voting_game(3, 4)
  result <- compute_bz_score(svg)
  expect_that(result, is_equivalent_to(c(3, 3, 3, 3)))
})

test_that("bz indexes are correct for svgs.", {
  svg <- create_simple_voting_game(3, 4)
  result <- compute_bz_index(svg)
  expect_that(result, is_equivalent_to(c(1 / 4, 1 / 4, 1 / 4, 1 / 4)))
})

test_that("bz power is correct for svgs.", {
  svg <- create_simple_voting_game(3, 4)
  result <- compute_bz_power(svg)
  expect_that(result, is_equivalent_to(rep.int(3 / 8, 4)))
})


test_that("bz  are correct for wvgs.", {
  svg <- create_weighted_voting_game(4, c(3, 2, 1, 1))
  result <- compute_bz_score(svg)
  expect_that(result, is_equivalent_to(c(6, 2, 2, 2)))
})

test_that("bz indexes are correct for wvgs.", {
  svg <- create_weighted_voting_game(4, c(3, 2, 1, 1))
  result <- compute_bz_index(svg)
  expect_that(result, is_equivalent_to(c(1 / 2, 1 / 6, 1 / 6, 1 / 6)))
})

test_that("bz power is correct for wvgs.", {
  wvg <- create_weighted_voting_game(4, c(3, 2, 1, 1))
  result <- compute_bz_power(wvg)
  expect_that(result, is_equivalent_to(c(3/4, 1/4, 1/4, 1/4)))
})

