# http://techn.ology.net/alternatives-to-the-logistic-equation/

iterate <- function( equation, range, x_max ) {
    # Initialize the bucket of x's
    v <- c()

    # For each r, find the x value...
    for ( r in range ) {
        # Start at a low x value
        x <- 0.1
        # Repeat x_max times...
        for ( i in 0 : x_max ) {
            x <- eval( parse( text = equation ) )
            # Hopefully we have stabilized
            if ( i > x_max / 2 ) {
                v <- c( v, x )
            }
        }
    }
    return(v)
}

# Set the range of the r values
r_min <- 1
r_max <- 4

# The logistic equation
# r * x * ( 1 - x )
# Alternatives:
# r - x ** 2
# r ** ( 1 - x )
# r * x ** ( 1 - x )
# r * sin(x)
# r * cos(x) - sin(x)
# r * ( cos(x) - sin(x) )
# r ** sin(x)
# r ** cos( 1 - x )
# r * cos(x) * ( 1 - sin(x) )
# r * exp(x) * ( 1 - exp(x) )
v <- iterate( equation = 'r * x * ( 1 - x )', range = seq( r_min, r_max, 0.01 ), x_max = 30 )

r <- seq( r_min, r_max, length.out = length(v) )

#png(file = 'bifurcation.png')
plot( r, v, type = 'p', cex  = 0.1, xlab = 'r', ylab = 'x' )
#dev.off()
