# Write-up: https://ology.github.io/2016/03/11/alternatives-to-the-logistic-equation/

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

iterate_plot <- function( r_min, r_max, equation ) {
    v <- iterate( equation = equation, range = seq( r_min, r_max, 0.01 ), x_max = 30 )

    r <- seq( r_min, r_max, length.out = length(v) )

    plot( r, v, type = 'p', cex = 0.1, xlab = 'r', ylab = 'x' )
}

# The logistic equation
#iterate_plot( r_min = 1, r_max = 4, equation = 'r * x * ( 1 - x )' )
# Alternatives:
#iterate_plot( r_min = 1, r_max = 4, equation = 'r ** ( 1 - x )' )
#iterate_plot( r_min = 1, r_max = 4, equation = 'r * x ** ( 1 - x )' )
#iterate_plot( r_min = 1, r_max = 3, equation = 'r * sin(x)' )
#iterate_plot( r_min = -3, r_max = 3, equation = 'r * cos(x) - sin(x)' )
#iterate_plot( r_min = 0, r_max = 3, equation = 'r * ( cos(x) - sin(x) )' )
#iterate_plot( r_min = -0.1, r_max = 4, equation = 'r ** sin(x)' )
#iterate_plot( r_min = 2, r_max = 8, equation = 'r ** cos( 1 - x )' )
#iterate_plot( r_min = 0, r_max = 5, equation = 'r * cos(x) * ( 1 - sin(x) )' )
#iterate_plot( r_min = 0.5, r_max = 3, equation = 'r * exp(x) * ( 1 - exp(x) )' )
#iterate_plot( r_min = 0, r_max = 2, equation = 'r - x ** 2' )
#iterate_plot( r_min = 2.4, r_max = 4, equation = 'r * x * ( 1 - x * r )' )
iterate_plot( r_min = 1, r_max = 3, equation = 'r * x * exp( 1 - x ** r )' )
