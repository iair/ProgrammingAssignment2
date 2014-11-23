## 

## this function is a constructor wich use a cuadratic matrix as a input 
makeCacheMatrix <- function(x = matrix()) {
        inv<-NULL               ## create the variable inv as NULL
        set<-function(y){       ##takes an input vector
                x<<-y           ##saves the imput vector using superassigment
                inv<<- NULL     ##resets the inv to NULL 
        }
        get<-function() {
                x               ##returns the value of the original vector
        }
        setinverse<-function(InverseMatrix) {
                inv<<-InverseMatrix  
                ##set the value of InverseMatrix to inv and
                ##store the value using superassigment
        }
        getinverse<-function(){
                inv            ##returns the inverse matrix
        }
        list(set=set, get=get,setinverse=setinverse,getinverse=getinverse)
}

## use the cache to Return the inverse of the "x" matrix,if value of "x"  
## has changed since the last time, then recalculate the inverse of "x" and
## save it in the variable "inv" and return it
cacheSolve <- function(x, ...) {
        
        inv<-x$getinverse()
        if(!is.null(inv)){
                message("getting cached inverse matrix")
                return(inv)        
        }    
        message("calculating inverse matrix and save it on variable inv")
        mx<- x$get()
        inv<-solve(mx)          ## recalculate the inverse of the matrix
        x$setinverse(inv)       ## save it on the variable inv 
        inv                     ## and return it as a result of the cachesolve function
}