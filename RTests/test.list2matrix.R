


test.list2matrix <- function(){
	ex_list <- list(ShopperNo1 = c("tomatoes", "apples", "oranges", "apples"),
					ShopperNo2 = c("watermellons", "apples", "mangos",
								   "mangos", "mangos"),
					ShopperNo3 = c("carrots", "watermellons"),
					ShopperNo4 = c("mangos", "mangos", "mangos", "mangos"),
					ShopperNo5 = c("mangos"))


	expected_result1 <- structure(
		c(1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1, 0,
		  1, 1, 0, 0, 1,
		  0, 0),
		.Dim = 5:6,
		.Dimnames = list(c("ShopperNo1", "ShopperNo2", "ShopperNo3",
						   "ShopperNo4", "ShopperNo5"),
						 c("tomatoes", "apples", "oranges",
						   "watermellons", "mangos", "carrots")))
	expected_result2 <- structure(
		c(1, 0, 0, 0, 0, 2, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 3, 0,
		  4, 1, 0, 0, 1, 0, 0),
		.Dim = 5:6,
		.Dimnames = list(c("ShopperNo1", "ShopperNo2", "ShopperNo3",
						   "ShopperNo4", "ShopperNo5"),
						 c("tomatoes", "apples", "oranges",
						   "watermellons", "mangos", "carrots")))

	checkTrue(identical(list2matrix(ex_list), expected_result1),
			  "list2matrix test with default settings")
	checkTrue(identical(list2matrix(ex_list, count=TRUE), expected_result2),
			  "list2matrix test with full counting setting")
	invisible(NULL)

}

