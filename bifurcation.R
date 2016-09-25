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
            # Save the last half of computed x's
            if ( i > x_max / 2 ) {
                v <- c( v, x )
            }
        }
    }
    return(v)
}

iterate_plot <- function( equation, r_min, r_max, x_max ) {
    v <- iterate( equation = equation, range = seq( r_min, r_max, 0.01 ), x_max = x_max )

    r <- seq( r_min, r_max, length.out = length(v) )

    plot( r, v, type = 'p', cex  = 0.1, xlab = 'r', ylab = 'x' )
}

# The logistic equation
#iterate_plot( equation = 'r * x * ( 1 - x )', r_min = 1, r_max = 4, x_max = 30 )
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
iterate_plot( equation = 'r * exp(x) * ( 1 - exp(x) )', r_min = 0.5, r_max = 3, x_max = 30 )
