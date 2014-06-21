## Cachine Matrix Example:

# Create a small wrapper around a matrix to cache it's operations
#
# Params:
#   x : defaults to an empty matrix, assumed to be invertible
# Returns:
#   A list with set and get operations for the matrix and it's inverse
makeCacheMatrix <- function(x = matrix()) {
  # Set the matrix and nullify the inverse
  # once the matrix has changed the inverse
  # will need to be recalculated on demand
  set <- function(y) {
    x       <<- y
    inverse <<- NULL
  }

  get <- function() x

  setInverse     <- function(inv) inverse <<- inv
  getInverse     <- function() inverse
  missingInverse <- function() is.null(inverse)

  #initialze with the matrix provided
  set(x)

  list( set = set,
        get = get,
        setInverse = setInverse,
        getInverse = getInverse,
        missingInverse = missingInverse)
}


# A caching solve function for matrices.
#
# Params:
#   x   : A matrix, assumed to be invertible
#   ... : pass through parameters
# Returns:
#   The inverse of the provided matrix
cacheSolve <- function(x, ...) {
    if( x$missingInverse() ){
      message("Cache not warmed, running solve")
      x$setInverse( solve( x$get() , ... ) )
    } else {
      message("Retrieving Data From Cache")
    }

  x$getInverse()
}
