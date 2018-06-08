LKJCor <- function(eta = NULL, bounds = list(NULL, NULL),
                   trunc  = list(NULL, NULL), k = NULL, r = NULL, param = NULL) {
  Density(
    "LKJCor",
    mget(names(formals()), sys.frame(sys.nframe()))
  )
}

generated.LKJCor <- function(x) {
  stop("LKJCor can only be used as a prior density.")
}

getParameters.LKJCor <- function(x) {
  stop("LKJCor can only be used as a prior density.")
}

is.multivariate.LKJCor <- function(x) { TRUE }

logLike.LKJCor <- function(x) {
  stop("LKJCor can only be used as a prior density.")
}

parameters.LKJCor <- function(x) {
  stop("LKJCor can only be used as a prior density.")
}

prior.LKJCor <- function(x) {
  truncStr <- make_trunc(x, "")
  sprintf("%s%s%s ~ lkj_corr_cholesky(%s) %s;", x$param, x$k, x$r, x$eta, truncStr)
}