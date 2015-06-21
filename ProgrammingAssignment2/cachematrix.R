## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

        inverse <- NULL

        set <- function(inputMatrix) {
                 x <<- inputMatrix
                 inverse <<- NULL
        }

        get <- function() x

        setinverse <- function(solve) inverse <<- solve

        getinverse <- function() inverse

        list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {

        inverse <- x$getinverse()

        if(!is.null(inverse)){
                return(inverse)
        }

        inputMatrix <- x$get()

        inverse <- solve(inputMatrix)

        x$setinverse(inverse)
        
        inverse
}
