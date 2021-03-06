# function 'makeCacheMatrix' creates a special matrix object and can cahce its inverse.
makeCacheMatrix <- function(x = matrix()) {
  s <- NULL
  set <- function(y) {
    x <<- y
    s <<- NULL
  
  }
  get <- function() x
  setsolve <- function(solve) s <<- solve
  getsolve <- function() s
  list(set = set, get = get, setsolve = setsolve,
       getsolve = getsolve)
  
}


# function 'cacheSolve' computes inverse of the 
# special matrix returned by makeCacheMatrix().
# If the inverse has already been calculated
# (and the matrix has not changed), then 
# caceSolve retrieves the inverse from the cache.
cacheSolve <- function(x, ...) {
  s <- x$getsolve()
  if(!is.null(s)) {
    message("getting cached data")
    return(s)
  }
  data <- x$get()
  s <- solve(data, ...)
  x$setsolve(s)
  s
}
