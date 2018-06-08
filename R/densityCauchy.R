Cauchy <- function(mu = NULL, sigma  = NULL, bounds = list(NULL, NULL),
                     trunc  = list(NULL, NULL), k = NULL, r = NULL, param = NULL) {
  Density(
    "Cauchy",
    mget(names(formals()), sys.frame(sys.nframe()))
  )
}

generated.Cauchy <- function(x) {
  sprintf("if(zpred[t] == %s) ypred[t] = cauchy_rng(mu%s%s, sigma%s%s);", x$k, x$k, x$r, x$k, x$r)
}

getParameters.Cauchy <- function(x) {
  return(list(mu = eval(x$mu), sigma = eval(x$sigma)))
}

is.multivariate.Cauchy <- function(x) { FALSE }

logLike.Cauchy <- function(x) {
  subindStr <- make_subindex(x)
  sprintf("loglike%s[t] = cauchy_lpdf(y[t] | mu%s%s, sigma%s%s);", subindStr, x$k, x$r, x$k, x$r)
}

parameters.Cauchy <- function(x) {
  muBoundsStr    <- make_bounds(x, "mu")
  sigmaBoundsStr <- make_bounds(x, "sigma")

  sprintf(
    "real%s mu%s%s;\nreal%s sigma%s%s;",
    muBoundsStr, x$k, x$r,
    sigmaBoundsStr, x$k, x$r
  )
}

prior.Cauchy <- function(x) {
  truncStr <- make_trunc(x, "")
  sprintf("%s%s%s ~ cauchy(%s, %s) %s;", x$param, x$k, x$r, x$mu, x$sigma, truncStr)
}