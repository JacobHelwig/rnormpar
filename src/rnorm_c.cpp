#include <RcppArmadillo.h>
//[[Rcpp::depends(RcppArmadillo)]]
using namespace Rcpp;

// function to generate a single sample from the standard normal distribution
//[[Rcpp::export]]
double rnorm1() {
  return (double)arma::vec(1, arma::fill::randn)(0, 0);
}

// function to return a vector of n samples from the normal distribution
//[[Rcpp::export]]
arma::vec rnorm_n(int n = 1, double mu = 0, double sd = 1){

  arma::vec res(n);

  for (int j = 0; j < n; j++){
    res(j) = rnorm1();
  }

  res = res * sd + mu;

  return res;
}
