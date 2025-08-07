test_that("is_attached detects attached packages", {
  expect_true(is_attached("stats"))
})

test_that("is_loading_for_tests detects environment variable", {
  expect_false(is_loading_for_tests())
})
