#' @name   cleanput
#' @title  dput with saner quotes and line breaks
#' @author Gene Leynes
#'
#' @param dat data to be put
#'
#' @description
#' 		Write a representation of an object to a temp file and print it to the
#' 		screen. Really handy for easy conversion of objects to a representation
#' 		for StackOverflow for making your reproducable examples.
#'
#' @details
#' 		Requires that your system has cat, which is easy on Windows if you have
#' 		mysys32 installed, which comes with git.  Install git for Windows from
#' 		https://git-scm.com. You probably need to let it put the Linux commands
#' 		onto your path, but come on let's be real.  Unless your a Windows batch
#' 		file commando this won't affect you, and if you are that person, you're
#' 		not reading this. Actually, I'd be happy if anyone ever reads this.
#'
#' @seealso
#' 	\code{\link{cat}}, \code{\link{.deparseOpts}}, \code{\link{tempfile}}
#'
#'
#' @examples
#'
#' require(geneorama)
#'
#' ## Let's say you need an example, and you choose a modified verion of mtcars
#' dt <- data.table(carname = rownames(mtcars[1:4,]),
#' 				 carbrand = as.factor(sapply(strsplit(rownames(mtcars[1:4,]), " "), `[[`, 1)),
#' 				 mtcars[1:4,])
#' dt
#' #           carname carbrand  mpg cyl disp  hp drat    wt  qsec vs am gear carb
#' # 1:      Mazda RX4    Mazda 21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
#' # 2:  Mazda RX4 Wag    Mazda 21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
#' # 3:     Datsun 710   Datsun 22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
#' # 4: Hornet 4 Drive   Hornet 21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
#'
#' ## This is hard to read, so maybe you want to represent it directly
#' dput(dt)
#' # structure(list(carname = c("Mazda RX4", "Mazda RX4 Wag", "Datsun 710",
#' # "Hornet 4 Drive"), carbrand = structure(c(3L, 3L, 1L, 2L), .Label = c("Datsun",
#' # "Hornet", "Mazda"), class = "factor"), mpg = c(21, 21, 22.8,
#' # 21.4), cyl = c(6, 6, 4, 6), disp = c(160, 160, 108, 258), hp = c(110,
#' # 110, 93, 110), drat = c(3.9, 3.9, 3.85, 3.08), wt = c(2.62, 2.875,
#' # 2.32, 3.215), qsec = c(16.46, 17.02, 18.61, 19.44), vs = c(0,
#' # 0, 1, 1), am = c(1, 1, 1, 0), gear = c(4, 4, 4, 3), carb = c(4,
#' # 4, 1, 1)), .Names = c("carname", "carbrand", "mpg", "cyl", "disp",
#' # "hp", "drat", "wt", "qsec", "vs", "am", "gear", "carb"), row.names = c(NA,
#' # -4L), class = c("data.table", "data.frame"), .internal.selfref = <pointer: 0x074324a0>)
#'
#' ## That looks nice, buy when you paste it into R Studio, it becomes 547 columns wide!!
#' structure(list(carname = c("Mazda RX4", "Mazda RX4 Wag", "Datsun 710",
#' 						   "Hornet 4 Drive"), carbrand = structure(c(3L, 3L, 1L, 2L), .Label = c("Datsun",
#' 						   																	  "Hornet", "Mazda"), class = "factor"), mpg = c(21, 21, 22.8,
#' 						   																	  											   21.4), cyl = c(6, 6, 4, 6), disp = c(160, 160, 108, 258), hp = c(110,
#' 						   																	  											   																 110, 93, 110), drat = c(3.9, 3.9, 3.85, 3.08), wt = c(2.62, 2.875,
#' 						   																	  											   																 													  2.32, 3.215), qsec = c(16.46, 17.02, 18.61, 19.44), vs = c(0,
#' 						   																	  											   																 													  														   0, 1, 1), am = c(1, 1, 1, 0), gear = c(4, 4, 4, 3), carb = c(4,
#' 						   																	  											   																 													  														   															 4, 1, 1)), .Names = c("carname", "carbrand", "mpg", "cyl", "disp",
#' 						   																	  											   																 													  														   															 					  "hp", "drat", "wt", "qsec", "vs", "am", "gear", "carb"), row.names = c(NA,
#' 						   																	  											   																 													  														   															 					  																	   -4L), class = c("data.table", "data.frame"), .internal.selfref = <pointer: 0x074324a0>)
#' ## cleanput attempts to fix the line breaks
#' cleanput(dt)
#' # structure(list(carname = c('Mazda RX4', 'Mazda RX4 Wag', 'Datsun 710', 'Hornet 4 Drive'),
#' #  carbrand = structure(c(3L, 3L, 1L, 2L),
#' #  .Label = c('Datsun', 'Hornet', 'Mazda'),
#' #  class = 'factor'),
#' #  mpg = c(21, 21, 22.8, 21.4),
#' #  cyl = c(6, 6, 4, 6),
#' #  disp = c(160, 160, 108, 258),
#' #  hp = c(110, 110, 93, 110),
#' #  drat = c(3.9, 3.9, 3.85, 3.08),
#' #  wt = c(2.62, 2.875, 2.32, 3.215),
#' #  qsec = c(16.46, 17.02, 18.61, 19.44),
#' #  vs = c(0, 0, 1, 1),
#' #  am = c(1, 1, 1, 0),
#' #  gear = c(4, 4, 4, 3),
#' #  carb = c(4, 4, 1, 1)),
#' #  .Names = c('carname', 'carbrand', 'mpg', 'cyl', 'disp', 'hp', 'drat', 'wt', 'qsec', 'vs', 'am', 'gear', 'carb'),
#' #  row.names = c(NA, -4L),
#' #  class = c('data.table', 'data.frame'),
#' #  .internal.selfref = <pointer: 0x074324a0>)
#'
#' ## When you paste into R Studio this becomes:
#'
#' # structure(list(carname = c('Mazda RX4', 'Mazda RX4 Wag', 'Datsun 710', 'Hornet 4 Drive'),
#' # 			   carbrand = structure(c(3L, 3L, 1L, 2L),
#' # 			   					 .Label = c('Datsun', 'Hornet', 'Mazda'),
#' # 			   					 class = 'factor'),
#' # 			   mpg = c(21, 21, 22.8, 21.4),
#' # 			   cyl = c(6, 6, 4, 6),
#' # 			   disp = c(160, 160, 108, 258),
#' # 			   hp = c(110, 110, 93, 110),
#' # 			   drat = c(3.9, 3.9, 3.85, 3.08),
#' # 			   wt = c(2.62, 2.875, 2.32, 3.215),
#' # 			   qsec = c(16.46, 17.02, 18.61, 19.44),
#' # 			   vs = c(0, 0, 1, 1),
#' # 			   am = c(1, 1, 1, 0),
#' # 			   gear = c(4, 4, 4, 3),
#' # 			   carb = c(4, 4, 1, 1)),
#' # 		  .Names = c('carname', 'carbrand', 'mpg', 'cyl', 'disp', 'hp', 'drat', 'wt', 'qsec', 'vs', 'am', 'gear', 'carb'),
#' # 		  row.names = c(NA, -4L),
#' # 		  class = c('data.table', 'data.frame'),
#' # 		  .internal.selfref = <pointer: 0x074324a0>)
#'
#' ## Which can be easily converted to this:
#'
#' data.table(carname = c('Mazda RX4', 'Mazda RX4 Wag', 'Datsun 710', 'Hornet 4 Drive'),
#' 		   carbrand = structure(c(3L, 3L, 1L, 2L),
#' 		   					 .Label = c('Datsun', 'Hornet', 'Mazda'),
#' 		   					 class = 'factor'),
#' 		   mpg = c(21, 21, 22.8, 21.4),
#' 		   cyl = c(6, 6, 4, 6),
#' 		   disp = c(160, 160, 108, 258),
#' 		   hp = c(110, 110, 93, 110),
#' 		   drat = c(3.9, 3.9, 3.85, 3.08),
#' 		   wt = c(2.62, 2.875, 2.32, 3.215),
#' 		   qsec = c(16.46, 17.02, 18.61, 19.44),
#' 		   vs = c(0, 0, 1, 1),
#' 		   am = c(1, 1, 1, 0),
#' 		   gear = c(4, 4, 4, 3),
#' 		   carb = c(4, 4, 1, 1))
#'


cleanput <- function(df){
    tmp <- tempfile()
    dput(df, tmp, control = c("keepNA", "keepInteger", "showAttributes"))
    txt <- readLines(tmp)
    txt <- gsub("^ +", "", txt)
    txt <- paste(txt, collapse = "")
    txt <- gsub("\\\"", "'", txt)
    txt <- strsplit(txt, "),")[[1]]
    txt <- rev(c(rev(txt)[1], paste0(rev(txt)[-1], "),")))
    unlink(tmp)
    writeLines(txt, tmp)
    system(paste("cat ", tmp))
}
