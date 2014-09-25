


library(data.table)
library(ggplot2)
library(reshape2)

?scale_colour_brewer

N = 1e3

dat = data.table(
		loc = sample(letters, N, replace=T),
		year = rep(1999:2003, length.out=N),
		mag = rpois(N, lambda=5),
		x = 1:N,
		matrix(rnorm(N*10), N, 10))
dat

dm <- melt(
    dat[loc %in% letters[1:15]],
    id.vars=c("loc", "year", "mag"),
    measure.vars = c("V1", "V2", "V7"))
dm = as.data.table(dm)
dm

mycolors = c(
    'red','red','darkred','darkred','darkred','red','red',
    'goldenrod','yellow','goldenrod',
    'green','green','darkgreen','darkgreen','darkgreen','green','green')

ggplot(dm[value>.53 | value < .47],
       aes(x=as.numeric(year), y=value, size=mag, shape=loc,
           colour=value)) +
    geom_point()  +
    xlab("My Custom X Label (LOG SCALED)") +
    ylab("My Custom Y Label") +
    theme(plot.title = element_text(size = 20)) +
    labs(title='My Amazing Plot \n (note the newline --->)\n') +
    scale_colour_gradientn(colours = mycolors) +
    scale_x_log10() +
    theme(panel.background = element_rect(fill = "gray60", colour = "black")) +
    theme(panel.grid.major = element_line(colour = "gray40")) +
    theme(panel.grid.minor = element_line(colour = "gray70", linetype = "dotted"))






