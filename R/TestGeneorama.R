#' @name   TestGeneorama
#' @title  TestGeneorama
#' @author Gene Leynes
#'
#' @description
#' 		Run tests on the geneorama package to make sure the functions are
#' 		working.
#'
#' @details
#' 		Depends on RUnit
#'
#' @examples
#' 		\dontrun{
#' 		library(geneorama)
#' 		TestGeneorama()
#' 		}
#'


TestGeneorama <- function(){
	
	# require(RUnit)
	
	testsuite1 <- defineTestSuite(
		"Geneorama main test suite",
		# dirs = file.path(.path.package(package="RUnit"), "examples"),
		dirs = file.path(".", "RTests"),
		testFileRegexp = "^test.+\\.[rR]",
		testFuncRegexp = "^test.+")
	
	testResult <- runTestSuite(testsuite1)
	printTextProtocol(testResult)
}
