# generates a matrix distributed independent normal
# takes n, p, mean vector, and sd vector representing the diagonal of the
# covariance matrix
#' Normal matrix
#'
#' @param n sample size
#' @param p number of variables
#' @param mu mean vector
#' @param sd diagonal of the covariance matrix
#'
#' @return normal matrix
#' @export
#'
#' @examples norm_mat(1e2, 3, -1:1, 1:3)
norm_mat <- function(n = 1, p = 1, mu = rep(0, p), sd = rep(1, p)){

  res <- matrix(NA, n, p)

  for(j in 1:p){
    res[ , j] <- rnorm_n(n, mu[j], sd[j])
  }

  return(res)

}

#' Title
#'
#' @return
#' @export
#'
#' @examples
norm_mat_par <- function(){

  nworkers <- parallel::detectCores() - 1

  cl <- parallel::makeCluster(nworkers)

  doParallel::registerDoParallel(cl)

  x <- foreach::`%dopar%`(
    foreach::foreach(j = 1:5, .packages = "rnormpar"),
    {
      norm_mat()
    })

  parallel::stopCluster(cl)

  return(x)
}


