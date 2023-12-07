heun_system_na_table <- function(
    fxyt = function(x, y, t) {

    },
    gxyt = function(x, y, t) {

    },
    hxyt = function(x, y, t) {

    },
    ixyt = function(x, y, t) {

    },
    jxyt = function(x, y, t) {

    },
    kxyt = function(x, y, t) {

    },
    lxyt = function(x, y, t) {

    },
    mxyt = function(x, y, t) {

    },
    nxyt = function(x, y, t) {

    },
    oxyt = function(x, y, t) {

    },
    pxyt = function(x, y, t) {

    },
    qxyt = function(x, y, t) {

    },
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
        x1_temp <- x1[i - 1]
            + fxyt(x1[i - 1], y1[i - 1], t[i - 1]) * (b - a) / (n - 1)
        y1_temp <- y1[i - 1]
            + gxyt(x1[i - 1], y1[i - 1], t[i - 1]) * (b - a) / (n - 1)
        x2_temp <- x2[i - 1]
            + hxyt(x2[i - 1], y2[i - 1], t[i - 1]) * (b - a) / (n - 1)
        y2_temp <- y2[i - 1]
            + ixyt(x2[i - 1], y2[i - 1], t[i - 1]) * (b - a) / (n - 1)
        x3_temp <- x3[i - 1]
            + jxyt(x3[i - 1], y3[i - 1], t[i - 1]) * (b - a) / (n - 1)
        y3_temp <- y3[i - 1]
            + kxyt(x3[i - 1], y3[i - 1], t[i - 1]) * (b - a) / (n - 1)
        x1[i] <- x1[i - 1]
            + (fxyt(x1[i - 1], y1[i - 1], t[i - 1])
            + fxyt(x1_temp, y1_temp, t[i])) * (b - a) / (2 * (n - 1))
        y1[i] <- y1[i - 1]
            + (gxyt(x1[i - 1], y1[i - 1], t[i - 1])
            + gxyt(x1_temp, y1_temp, t[i])) * (b - a) / (2 * (n - 1))
        x2[i] <- x2[i - 1]
            + (hxyt(x2[i - 1], y2[i - 1], t[i - 1])
            + hxyt(x2_temp, y2_temp, t[i])) * (b - a) / (2 * (n - 1))
        y2[i] <- y2[i - 1]
            + (ixyt(x2[i - 1], y2[i - 1], t[i - 1])
            + ixyt(x2_temp, y2_temp, t[i])) * (b - a) / (2 * (n - 1))
        x3[i] <- x3[i - 1]
            + (jxyt(x3[i - 1], y1[i - 1], t[i - 1])
            + jxyt(x3_temp, y3_temp, t[i])) * (b - a) / (2 * (n - 1))
        y3[i] <- y3[i - 1]
            + (kxyt(x3[i - 1], y3[i - 1], t[i - 1])
            + kxyt(x3_temp, y3_temp, t[i])) * (b - a) / (2 * (n - 1))
    }
    plot(x, y, col = "red", pch = 20, cex = 1.5)
    points(x1, y1, col = "red", pch = 20, cex = 2.5)
    points(x2[1], y2[1], col = "green", pch = 20, cex = 2.5)
    points(x3[1], y3[1], col = "blue", pch = 20, cex = 2.5)
    recordPlot()
    table <- data.frame(t, x, y)
    return(table)
}