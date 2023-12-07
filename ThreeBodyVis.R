heun_system_na_table <- function(
    fvx1 = function(v, t) {

    },
    fpx1 = function(x1, y1, x2, y2, x3, y3, t) {

    },
    fvy1 = function(v, t) {

    },
    fpy1 = function(x1, y1, x2, y2, x3, y3, t) {

    },
    fvx2 = function(v, t) {

    },
    fpx2 = function(x1, y1, x2, y2, x3, y3, t) {

    },
    fvy2 = function(v, t) {

    },
    fpy2 = function(x1, y1, x2, y2, x3, y3, t) {

    },
    fvx3 = function(v, t) {

    },
    fpx3 = function(x1, y1, x2, y2, x3, y3, t) {

    },
    fvy3 = function(v, t) {

    },
    fpy3 = function(x1, y1, x2, y2, x3, y3, t) {

    },
    x10,
    y10,
    x20,
    y20,
    x30,
    y30,
    vx10,
    vy10,
    vx20,
    vy20,
    vx30,
    vy30,
    a,
    b,
    n) {
    # initialize vector values
    x1 <- 0
    y1 <- 0
    x2 <- 0
    y2 <- 0
    x3 <- 0
    y3 <- 0
    vx1 <- 0
    vy1 <- 0
    vx2 <- 0
    vy2 <- 0
    vx3 <- 0
    vy3 <- 0

    # initialize time
    t <- seq(a, b, by = (b - a) / (n - 1))

    # initialize first values for each vector
    x1[1] <- x10
    x2[1] <- x20
    x3[1] <- x30
    y1[1] <- y10
    y2[1] <- y20
    y3[1] <- y30
    vx1[1] <- vx10
    vx2[1] <- vx20
    vx3[1] <- vx30
    vy1[1] <- vy10
    vy2[1] <- vy20
    vy3[1] <- vy30

    # calculate Heun's method for each vector
    for (i in 2:n){
        # Eulers method for body 1
        # x-velocity, x-position, y-velocity, y-position
        vx1_temp <- vx1[i - 1]
            + fvx1(vx1[i - 1], t[i - 1]) * (b - a) / (n - 1)
        x1_temp <- x1[i - 1]
            + fpx1(x1[i - 1], y1[i - 1],
                x2[i - 1], y2[i - 1],
                x3[i - 1], y3[i - 1],
                t[i - 1]) * (b - a) / (n - 1)
        vy1_temp <- vy1[i - 1]
            + fvy1(vy1[i - 1], t[i - 1]) * (b - a) / (n - 1)
        y1_temp <- y1[i - 1]
            + fpy1(y1[i - 1], x1[i - 1],
                y2[i - 1], x2[i - 1],
                y3[i - 1], x3[i - 1],
                t[i - 1]) * (b - a) / (n - 1)

        # Eulers method for body 2
        # x-velocity, x-position, y-velocity, y-position
        vx2_temp <- vx2[i - 1]
            + fvx1(vx2[i - 1], t[i - 1]) * (b - a) / (n - 1)
        x2_temp <- x2[i - 1]
            + fpx2(x2[i - 1], y2[i - 1],
                x1[i - 1], y1[i - 1],
                x3[i - 1], y3[i - 1],
                t[i - 1]) * (b - a) / (n - 1)
        vy2_temp <- vy2[i - 1]
            + fvy2(vy2[i - 1], t[i - 1]) * (b - a) / (n - 1)
        y2_temp <- y2[i - 1]
            + fpy2(y2[i - 1], x2[i - 1],
                y1[i - 1], x1[i - 1],
                y3[i - 1], x3[i - 1],
                t[i - 1]) * (b - a) / (n - 1)

        # Eulers method for body 3
        # x-velocity, x-position, y-velocity, y-position
        vx3_temp <- vx3[i - 1]
            + fvx3(vx3[i - 1], t[i - 1]) * (b - a) / (n - 1)
        x3_temp <- x3[i - 1]
            + fpx3(x3[i - 1], y3[i - 1],
                x2[i - 1], y2[i - 1],
                x1[i - 1], y1[i - 1],
                t[i - 1]) * (b - a) / (n - 1)
        vy3_temp <- vy3[i - 1]
            + fvy3(vy3[i - 1], t[i - 1]) * (b - a) / (n - 1)
        y3_temp <- y3[i - 1]
            + fpy3(y3[i - 1], x3[i - 1],
                y2[i - 1], x2[i - 1],
                y1[i - 1], x1[i - 1],
                t[i - 1]) * (b - a) / (n - 1)

        # Heuns method for body 1
        # x-velocity, x-position, y-velocity, y-position
        vx1[i] <- vx1[i - 1]
            + (fvx1(vx1[i - 1], t[i - 1])
            + fvx1(vx1_temp, t[i])) * (b - a) / (2 * (n - 1))
        x1[i] <- x1[i - 1]
            + (fpx1(x1[i - 1], y1[i - 1],
                    x2[i - 1], y2[i - 1],
                    x3[i - 1], y3[i - 1],
                    t[i - 1])
            + fpx1(x1_temp, y1_temp,
                    x2_temp, y2_temp,
                    x3_temp, y3_temp,
                    t[i])) * (b - a) / (2 * (n - 1))
        vy1[i] <- vy1[i - 1]
            + (fvy1(vy1[i - 1], t[i - 1])
            + fvy1(vy1_temp, t[i])) * (b - a) / (2 * (n - 1))
        y1[i] <- y1[i - 1]
            + (fpy1(y1[i - 1], x1[i - 1],
                    y2[i - 1], x2[i - 1],
                    y3[i - 1], x3[i - 1],
                    t[i - 1])
            + fpy1(y1_temp, x1_temp,
                    y2_temp, x2_temp,
                    y3_temp, x3_temp,
                    t[i])) * (b - a) / (2 * (n - 1))


        # Heuns method for body 2
        # x-velocity, x-position, y-velocity, y-position
        vx2[i] <- vx2[i - 1]
            + (fvx2(vx2[i - 1], t[i - 1])
            + fvx2(vx2_temp, t[i])) * (b - a) / (2 * (n - 1))
        x2[i] <- x2[i - 1]
            + (fpx2(x2[i - 1], y2[i - 1],
                    x1[i - 1], y1[i - 1],
                    x3[i - 1], y3[i - 1],
                    t[i - 1])
            + fpx2(x2_temp, y2_temp,
                    x1_temp, y1_temp,
                    x3_temp, y3_temp,
                    t[i])) * (b - a) / (2 * (n - 1))
        vy2[i] <- vy2[i - 1]
            + (fvy2(vy2[i - 1], t[i - 1])
            + fvy2(vy2_temp, t[i])) * (b - a) / (2 * (n - 1))
        y2[i] <- y2[i - 1]
            + (fpy2(y2[i - 1], x2[i - 1],
                    y1[i - 1], x1[i - 1],
                    y3[i - 1], x3[i - 1],
                    t[i - 1])
            + fpy2(y2_temp, x2_temp,
                    y1_temp, x1_temp,
                    y3_temp, x3_temp,
                    t[i])) * (b - a) / (2 * (n - 1))

        # Heuns method for body 1
        # x-velocity, x-position, y-velocity, y-position
        vx3[i] <- vx3[i - 1]
            + (fvx3(vx3[i - 1], t[i - 1])
            + fvx3(vx3_temp, t[i])) * (b - a) / (2 * (n - 1))
        x3[i] <- x3[i - 1]
            + (fpx3(x3[i - 1], y3[i - 1],
                    x2[i - 1], y2[i - 1],
                    x1[i - 1], y1[i - 1],
                    t[i - 1])
            + fpx3(x3_temp, y3_temp,
                    x2_temp, y2_temp,
                    x1_temp, y1_temp,
                    t[i])) * (b - a) / (2 * (n - 1))
        vy3[i] <- vy3[i - 1]
            + (fvy3(vy3[i - 1], t[i - 1])
            + fvy3(vy3_temp, t[i])) * (b - a) / (2 * (n - 1))
        y3[i] <- y3[i - 1]
            + (fpy3(y3[i - 1], x3[i - 1],
                    y2[i - 1], x2[i - 1],
                    y1[i - 1], x1[i - 1],
                    t[i - 1])
            + fpy3(y3_temp, x3_temp,
                    y2_temp, x2_temp,
                    y1_temp, x1_temp,
                    t[i])) * (b - a) / (2 * (n - 1))
    }
    plot(x1, y1, col = "red", pch = 20, cex = 2.5)
    points(x2, y2, col = "green", pch = 20, cex = 2.5)
    points(x3, y3, col = "blue", pch = 20, cex = 2.5)
    recordPlot()
    table <- data.frame(t, x1, y1, x2, y2, x3, y3)
    return(table)
}

velocity <- function(v, t) {
    v
}

position <- function(x1, y1, x2, y2, x3, y3, t) {
    -(x1 - x2 / ((x1 - x2)^2 + (y1 - y2)^2)^(3 / 2))
    - (x1 - x3 / ((x1 - x3)^2 + (y1 - y3)^2)^(3 / 2))
}

heun_table <- heun_system_na_table(velocity, position,
                    velocity, position,
                    velocity, position,
                    velocity, position,
                    velocity, position,
                    velocity, position,
                    1, 1, 2, 2, 3, 3,
                    0, 0, 0, 0, 0, 0,
                    0, 60, 601)