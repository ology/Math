library(numbers)

prime_gaps <- function(limit) {
    primes <- Primes(limit)
    gaps <- primes[ 2 : length(primes) ] - primes[ 1 : length(primes) - 1 ]
    return(gaps)
}

geom_series <- function( base, max ) {
    base ^ ( 0 : floor( log( max, base ) ) )
}

for ( limit in geom_series( base = 10, max = 1000000 ) ) {
    if (limit < 10) {
        next
    }
    print( paste( 'Computing gaps for limit', limit, '...' ) )
    gaps <- prime_gaps(limit)
    plot( density(gaps), xlab = 'prime gaps', main = paste( 'Below', limit ) )
    readline( prompt = 'Enter to proceed' )
}
