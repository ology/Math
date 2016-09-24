library(numbers)

prime_gaps <- function(limit) {
    primes <- Primes(limit)

    # Compute the difference between the next prime and the prime itself.
    gaps <- primes[ 2 : length(primes) ] - primes[ 1 : length(primes) - 1 ]

    return(gaps)
}

geom_series <- function( base, max ) {
    base ^ ( 0 : floor( log( max, base ) ) )
}

gap_density <- function( base_limit, max_limit ) {
    for ( limit in geom_series( base = base_limit, max = max_limit ) ) {
        if ( limit < 10 ) {
            next
        }

        print( paste( 'Computing gaps for limit', limit, '...' ) )

        gaps <- prime_gaps(limit)

        plot( density(gaps), xlab = 'prime gaps', main = paste( 'Below', limit ) )

        readline( prompt = 'Enter to proceed' )
    }
}

gap_density( 2, 10000000 )
