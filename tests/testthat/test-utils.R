test_that("econdataverse packages returns character vector of package names", {
  out <- econdataverse_packages()
  expect_type(out, "character")
  expect_true("econid" %in% out)
})
