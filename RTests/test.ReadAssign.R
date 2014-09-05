


test.ReadAssign <- function(){
	require("RUnit")

	##----------------------------------------------------------------------
	## Example of making 60 files, and reloading 10 of them
	##----------------------------------------------------------------------
	fp <- tempdir()
	checkTrue(file.exists(fp), "temp directory not created")

	mat <- matrix(rnorm(6000), 100, 60)
	for(i in 1:ncol(mat)){
		f <-  file.path(fp, paste0("vec", sprintf("%03.f", i),".Rds"))
		saveRDS(mat[,i], f)
	}
	mat_recovered <- sapply(list.files(fp,
									   full.names=T,
									   pattern = "vec04[0-9].Rds"),
							ReadAssign, assignGlobal = F)
	checkEquals(target = head(unname(mat_recovered)),
				current = head(mat[,40:49]),
				msg = "Wrong call value",
				tolerance = .00001)

	## Clean Up
	unlink(fp)
	rm(mat, mat_recovered)

	invisible(NULL)
}
