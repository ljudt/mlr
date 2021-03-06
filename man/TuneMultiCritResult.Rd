% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/TuneMultiCritResult.R
\name{TuneMultiCritResult}
\alias{TuneMultiCritResult}
\title{Result of multi-criteria tuning.}
\description{
Container for results of hyperparameter tuning.
Contains the obtained pareto set and front
and the optimization path which lead there.

Object members:
\describe{
\item{learner [\code{\link{Learner}}]}{Learner that was optimized.}
\item{control [\code{\link{TuneControl}}]}{Control object from tuning.}
\item{x [\code{list}]}{List of lists of non-dominated hyperparameter settings in pareto set.
  Note that when you have trafos on some of your params, \code{x} will always be
  on the TRANSFORMED scale so you directly use it.}
\item{y [\code{matrix}]}{Pareto front for \code{x}.}
\item{opt.path [\code{\link[ParamHelpers]{OptPath}}]}{Optimization path which lead to \code{x}.
  Note that when you have trafos on some of your params, the opt.path always contains the
  UNTRANSFORMED values on the original scale. You can simply call \code{trafoOptPath(opt.path)} to
  transform them, or, \code{as.data.frame{trafoOptPath(opt.path)}}}
}
}

