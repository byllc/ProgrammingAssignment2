# A test runner for cachematrix

source("cachematrix.R")

testMatrix        <- matrix( c(4,7,2,6) , nrow = 2, ncol = 2)
testMatrix2       <- matrix( c(5,8,3,7), nrow = 2, ncol = 2)
testMatrixInverse <- solve(testMatrix)
testMatrixInverse2 <- solve(testMatrix2)


testMatrixCache <- makeCacheMatrix(testMatrix)

print("Run cacheSolve on Matrix 1: Should Not be cached")
cacheSolve(testMatrixCache)

print("Run cacheSolve again on Matrix 1: Should be cached")
cacheSolve(testMatrixCache)

print("Does the cache contain the proper inverse?")
print( ifelse(testMatrixCache$getInverse() == testMatrixInverse, "√", "x"))

testMatrixCache$set(testMatrix2)
print("Run cacheSolve again on Matrix 2: Should Not be cached")
cacheSolve(testMatrixCache)

print("Run cacheSolve again on Matrix 2: Should be cached")
cacheSolve(testMatrixCache)

print("Does the cache contain the proper inverse?")
print( ifelse(testMatrixCache$getInverse() == testMatrixInverse2, "√", "x"))
