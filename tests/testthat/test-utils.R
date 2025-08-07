test_that("econdataverse packages returns character vector of package names", {
  out <- econdataverse_packages()
  expect_type(out, "character")
  expect_true("econid" %in% out)
})

test_that("inform_startup works as expected", {
  expect_silent(inform_startup(NULL))

  old_opt <- getOption("econdataverse.quiet")
  options(econdataverse.quiet = TRUE)
  expect_silent(inform_startup("This should be quiet"))
  options(econdataverse.quiet = FALSE)

  expect_message(inform_startup("Startup message"), "Startup message")

  options(econdataverse.quiet = old_opt)
})

test_that("invert works with named list", {
  input <- list(a = c(1, 2), b = c(2, 3))
  result <- invert(input)

  expect_equal(sort(names(result)), c("1", "2", "3"))
  expect_equal(result$`1`, "a")
  expect_equal(sort(result$`2`), c("a", "b"))
  expect_equal(result$`3`, "b")
})

test_that("invert handles empty input", {
  expect_null(invert(list()))
})

test_that("econdataverse_packages parses import strings correctly", {
  fake_imports <- "dplyr, ggplot2 (>= 3.0.0), tidyr"
  raw <- fake_imports
  imports <- strsplit(raw, ",")[[1]]
  parsed <- gsub("^\\s+|\\s+$", "", imports)
  names <- vapply(strsplit(parsed, "\\s+"), "[[", 1, FUN.VALUE = character(1))

  names_self <- c(names, "econdataverse")
  expect_equal(
    sort(names_self),
    sort(c("dplyr", "ggplot2", "tidyr", "econdataverse"))
  )

  expect_equal(sort(names), sort(c("dplyr", "ggplot2", "tidyr")))
})
