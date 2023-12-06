HeunSystemNATable<-function(
    Fxyt = function(x, y, t){},
    Gxyt = function(x, y, t){},
    Hxyt = function(x, y, t){},
    Ixyt = function(x, y, t){},
    Jxyt = function(x, y, t){},
    Kxyt = function(x, y, t){},
    Lxyt = function(x, y, t){},
    Mxyt = function(x, y, t){},
    Nxyt = function(x, y, t){},
    Oxyt = function(x, y, t){},
    Pxyt = function(x, y, t){},
    Qxyt = function(x, y, t){},
    x10, y10, x20, y20, x30, y30, a, b, n) {
    x <- 0
    y <- 0
    t <- seq(a, b, by = (b - a) / (n - 1))
    x1[1] <- x10
    x2[1] <- x20
    x3[1] <- x30
    y1[1] <- y10
    y2[1] <- y20
    y3[1] <- y30
    
    for (i in 2:n){
        x1_temp <- x1[i - 1] + Fxyt(x1[i - 1], y1[i - 1], t[i - 1]) * (b - a) / (n - 1)
        y1_temp <- y1[i - 1] + Gxyt(x1[i - 1], y1[i - 1], t[i - 1]) * (b - a) / (n - 1)
        x2_temp <- x2[i - 1] + Fxyt(x2[i - 1], y2[i - 1], t[i - 1]) * (b - a) / (n - 1)
        y2_temp <- y2[i - 1] + Gxyt(x2[i - 1], y2[i - 1], t[i - 1]) * (b - a) / (n - 1)
        x3_temp <- x3[i - 1] + Fxyt(x3[i - 1], y3[i - 1], t[i - 1]) * (b - a) / (n - 1)
        y3_temp <- y3[i - 1] + Gxyt(x3[i - 1], y3[i - 1], t[i - 1]) * (b - a) / (n - 1)
        x1[i] <- x1[i - 1] + (Fxyt(x1[i - 1], y1[i - 1], t[i - 1]) + Fxyt(x1_temp, y1_temp, t[i])) * (b - a) / (2 * (n - 1))
        y1[i] <- y1[i - 1] + (Gxyt(x1[i - 1], y1[i - 1], t[i - 1]) + Gxyt(x1_temp, y1_temp, t[i])) * (b - a) / (2 * (n - 1))
        x2[i] <- x2[i - 1] + (Fxyt(x2[i - 1], y2[i - 1], t[i - 1]) + Fxyt(x2_temp, y2_temp, t[i])) * (b - a) / (2 * (n - 1))
        y2[i] <- y2[i - 1] + (Gxyt(x2[i - 1], y2[i - 1], t[i - 1]) + Gxyt(x2_temp, y2_temp, t[i])) * (b - a) / (2 * (n - 1))
        x3[i] <- x3[i - 1] + (Fxyt(x3[i - 1], y1[i - 1], t[i - 1]) + Fxyt(x3_temp, y3_temp, t[i])) * (b - a) / (2 * (n - 1))
        y3[i] <- y3[i - 1] + (Gxyt(x3[i - 1], y3[i - 1], t[i - 1]) + Gxyt(x3_temp, y3_temp, t[i])) * (b - a) / (2 * (n - 1))
    }
    plot(x, y, col = "red", pch = 20, cex = 1.5)
    points(x[1], y[1], col = "blue", pch = 20, cex = 2.5)
    recordPlot()
    table <- data.frame(t, x, y)
    return(table)
}