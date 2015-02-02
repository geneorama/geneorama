


library(data.table)
library(ggplot2)
# library(reshape2)

## set melt and dcast rather than use reshape 2
## it's faster and works roughly the same
melt <- data.table:::melt.data.table
dcast <- dcast.data.table

?scale_colour_brewer

N = 1e3

dat = data.table(
    loc = sample(letters[1:6], N, replace=T),
    year = rep(1999:2003, length.out=N),
    mag = rpois(N, lambda=5),
    x = 1:N,
    matrix(rnorm(N*10), N, 10))
dat

dm <- melt(
    data = dat[loc %in% letters[1:15]],
    id.vars = c("loc", "year", "mag"),
    measure.vars = c("V1", "V2", "V7"))
dm = as.data.table(dm)
dm

mycolors = c(
    'red','red','darkred','darkred','darkred','red','red',
    'goldenrod','yellow','goldenrod',
    'green','green','darkgreen','darkgreen','darkgreen','green','green')

ggplot(dm[value>.53 | value < .47]) +
    aes(x = year, 
        y = value, 
        size = mag, 
        shape = loc,
        colour = value) +
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

##==============================================================================
## Color blind friendly example
## http://www.cookbook-r.com/Graphs/Colors_%28ggplot2%29/
##==============================================================================

## The palette with grey:
# cbPalette <- c("#999999", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")

## The palette with black:
cbPalette <- c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")

## To use for fills, add
# scale_fill_manual(values=cbPalette)

## To use for line and point colors, add
# scale_colour_manual(values=cbPalette)

ggplot(data = dm[value>.53 | value < .47,
                 list(sum = sum(value),
                      mean_mag = log(mean(mag))-1),
                 by = list(year,
                           loc)]) +
    aes(x = year,
        y = sum, 
        size = mean_mag, 
        colour = loc) +
    geom_line()  +
    xlab("My Custom X Label") +
    ylab("My Custom Y Label") +
    theme(plot.title = element_text(size = 20)) +
    labs(title='My Amazing Plot \n (note the newline --->)\n') +
    #scale_colour_gradientn(colours = mycolors) +
    scale_colour_manual(values=cbPalette )


