#' @title  makeCacheMatrix
#' 
#' @description Create an object which store a matrix and its inverse
#'              
#' @author Javier Gonzalez <javier.gonzalez.grandez@gmail.com>
#' 
#' @method set(x) Default method. create a makeCacheMatrix with
#'                the matrix passed as argument
#' @method get    Returns the matrix
#' @method setInverse(y) Store the inverse of matrix
#' @method getInverse()  Returns the inverse of matrix x
#' 
#' @note 
#'         We don't check if matrix is squared
#'         neither invertible
#' @example 
#'        
#'         m1 = matrix(c(1,2,-1,2, 2,2,-1,1, -1,-1,1,-1, 2,1,-1,2), nrow=4, ncol=4, byrow=T)         
#'         cm = makeCacheMatrix(m1)
#'         
makeCacheMatrix <- function(x = matrix()) {
  invm <- NULL
  set <- function(y) {
    x <<- y
    invm <<- NULL
  }
  get <- function() x
  setInverse <- function(y) invm <<- y
  getInverse <- function() invm
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
  
}


#' @title  cacheSolve
#' 
#' @description Returns the inverse of a matrix stored as a makeCacheMatrix object
#'              This inverse matrix is cached, so calculus are done once
#'              
#' @author Javier Gonzalez <javier.gonzalez.grandez@gmail.com>
#' 
#' @usage   cacheSolve(x)
#'         Where x is a makeCacheMatrix object   

cacheSolve <- function(x, ...) {
  inv <- x$getInverse()
  if (!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data)
  x$setInverse(inv)
  return (inv)
}

