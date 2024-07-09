## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

# This function creates a special "matrix" object that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL  # This will store the cached inverse
  
  # This function sets the matrix
  set <- function(y) {
    x <<- y  # Assign the new matrix to x
    inv <<- NULL  # Reset the cached inverse because the matrix has changed
  }
  
  # This function gets the matrix
  get <- function() {
    x  # Return the matrix
  }
  
  # This function sets the cached inverse
  setInverse <- function(inverse) {
    inv <<- inverse  # Cache the inverse
  }
  
  # This function gets the cached inverse
  getInverse <- function() {
    inv  # Return the cached inverse
  }
  
  # Return a list of the above functions
  list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}

# This function computes the inverse of the special "matrix" created by makeCacheMatrix
cacheSolve <- function(x, ...) {
  inv <- x$getInverse()  # Try to get the cached inverse
  
  if(!is.null(inv)) {  # If there is a cached inverse
    message("getting cached data")  # Print a message
    return(inv)  # Return the cached inverse
  }
  
  data <- x$get()  # Get the matrix
  inv <- solve(data, ...)  # Compute the inverse
  x$setInverse(inv)  # Cache the inverse
  
  inv  # Return the computed inverse
}

