## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## Creates special "matrix" object that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setInverse<- function(inverse) m <<- inverse
  getInverse <- function() m
  list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}


## Write a short comment describing this function

## Computes inverse of special "matrix" returned by makeCacheMatrix above
## If the inverse has already been calculated, retrieves inverse from the cache
cacheInverse <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getInverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- Inverse(data, ...)
  x$setInverse(m)
  m
}
