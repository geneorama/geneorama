# rollave <- function(var, window){
# 	ave <- rep(NA, length(var))
# 	tot <- 0  ## Update a rolling total rather than average
# 	for(i in 1:length(var)){
# 		tot <- tot + var[i]
# 		cat(c(i,tot,"\n"))
# 		if(i < window) {
# 			ave[i] <- NA
# 		} else {
# 			ave[i] <- tot / window
# 			tot <- tot - var[i - window + 1]
# 		}
# 	}
# 	return(ave)
# }


