test.comma <- function(){
	
	vec <- c(8987.35672, 8962.97978, 8998.06814, 8960.67199, 8997.08384,
			 9040.95974, 8984.53862, 9017.97732, 8943.0501, 9003.01559)
	comma(vec)
	comma(vec, 0)
	result1 <- c("8,987.36", "8,962.98", "8,998.07", "8,960.67", "8,997.08",
				 "9,040.96", "8,984.54", "9,017.98", "8,943.05", "9,003.02")
	result2 <- c("8,987", "8,963", "8,998", "8,961", "8,997", "9,041", "8,985",
				 "9,018", "8,943", "9,003")
	checkIdentical(comma(vec), result1, "comma test 1 failed")
	checkIdentical(comma(vec, 0), result2, "comma test 2 failed")
	
	invisible(NULL)
}

