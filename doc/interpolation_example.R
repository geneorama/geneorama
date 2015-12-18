
## Example contour data
grid <- list(x = c(-87.727, -87.723, -87.719, -87.715, -87.711), 
             y = c(41.836, 41.839, 41.843, 41.847, 41.851), 
             z = (matrix(data = c(-3.428, -3.722, -3.061, -2.554, -2.362, 
                                  -3.034, -3.925, -3.639, -3.357, -3.283, 
                                  -0.152, -1.688, -2.765, -3.084, -2.742, 
                                  1.973,  1.193, -0.354, -1.682, -1.803, 
                                  0.998,  2.863,  3.224,  1.541, -0.044), 
                         nrow = 5, ncol = 5)))

## Example values to look up by x and y:

df <- data.frame(x = c(-87.723, -87.712, -87.726, -87.719, -87.722, -87.722), 
                 y = c(41.84, 41.842, 41.844, 41.849, 41.838, 41.842), 
                 id = c("a", "b", "c", "d", "e", "f"))

## Here is the example visualized:
contour(grid)
points(df$x, df$y, pch=df$id, col="blue", cex=1.2)


## You can find the x intervals and y intervals with this type of formula:

xrng <- range(grid$x)
xbins <- length(grid$x) -1
yrng <- range(grid$y)
ybins <- length(grid$y) -1
df$ix <- trunc( (df$x - min(xrng)) / diff(xrng) * (xbins)) + 1
df$iy <- trunc( (df$y - min(yrng)) / diff(yrng) * (ybins)) + 1

## Simplistic interpolation on the z values in grid:
df$z <- with(df, (grid$z[cbind(ix, iy)] + 
                      grid$z[cbind(ix + 1, iy)] +
                      grid$z[cbind(ix, iy + 1)] + 
                      grid$z[cbind(ix + 1, iy + 1)]) / 4)

contour(grid, xlim = range(c(grid$x, df$x)), ylim = range(c(grid$y, df$y)))
points(df$x, df$y, pch=df$id, col="blue", cex=1.2)
text(df$x + .001, df$y, lab=round(df$z, 2), col="blue", cex=1)

findInterval(df$x[2], grid$x)
findInterval(df$y[2], grid$y)

