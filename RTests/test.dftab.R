



test.dftab <- function(){

	## Generate example data
	# set.seed(10)
	# df <- data.frame(column1 = sample(c(rep(NA, 5), rpois(25, 7))),
	# 				 column2 = sample(letters[1:5], replace=TRUE),
	# 				 column3 = sample(letters[1:5], replace=TRUE))
	df <- structure(list(column1 = c(3L, 10L, 6L, 6L, 4L, 8L, NA, NA, 6L, 8L,
									 6L, 8L, 4L, 5L, 8L, NA, 5L, NA, 7L, 6L,
									 NA, 5L, 6L, 7L, 6L, 10L, 6L, 9L, 5L, 7L),
						 column2 = structure(c(2L, 2L, 2L, 1L, 2L, 2L, 2L, 2L,
						 					  1L, 2L, 2L, 2L, 2L, 1L, 2L, 2L,
						 					  2L, 2L, 1L, 2L, 2L, 2L, 2L, 1L,
						 					  2L, 2L, 2L, 2L, 1L, 2L),
						 					class = "factor",
						 					.Label = c("b", "c")),
						 column3 = structure(c(1L, 1L, 3L, 2L, 4L, 1L, 1L, 3L,
						 					  2L, 4L, 1L, 1L, 3L, 2L, 4L, 1L,
						 					  1L, 3L, 2L, 4L, 1L, 1L, 3L, 2L,
						 					  4L, 1L, 1L, 3L, 2L, 4L),
						 					class = "factor",
						 					.Label = c("a", "b", "c", "e"))),
					.Names = c("column1", "column2", "column3"),
					row.names = c(NA, -30L),
					class = "data.frame")



	## Tablulate first column of example
	actual_result  <- dftab(df$column1)

	## expected result (for some reason the row names don't work)
	expected_count <- c(1L,1L,2L,2L,3L,4L,4L,5L,8L,30L)
	expected_rownames <- c("3","9","4","10","7","5","8","NA","6","TOTAL")
	# expected_result <- data.frame(count = expected_count,
	# 							  row.names = expected_rownames)

	## Compare actual to expected
	checkTrue(all(rownames(actual_result) == expected_rownames), "rownames not ok")
	checkTrue(all(actual_result$count == expected_count), "table values not ok")
	# checkTrue(all.equal(actual_result, expected_result, check.attributes = F),
	# 		  msg="dftab for column 1 failed")
	invisible(NULL)
}


