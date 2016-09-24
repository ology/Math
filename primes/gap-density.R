library(numbers)

prime_gaps <- function(limit) {
    primes <- Primes(limit)
    gaps <- c()
    n <- 1
    while ( n < length(primes) - 1 ) { 
        gaps[n] <- primes[n + 1] - primes[n]
        n <- n + 1
    }
    return(gaps)
}

geom_series <- function( base, max ) {
    base ^ ( 0:floor( log( max, base ) ) )
}

for ( limit in geom_series( base = 10, max = 1000000 ) ) {
    print( paste( 'Computing gaps for limit', limit, '...' ) )
    gaps <- prime_gaps(limit)
    png( file = paste( 'gap-density-', limit, '.png', sep = '' ) )
    plot( density(gaps), xlab = 'prime gaps', main = paste( 'Below', limit ) )
    dev.off()
}
