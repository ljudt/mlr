#' Create control structures for tuning.
#' 
#' The following tuners are available:
#' \describe{
#'   \item{makeTuneControlGrid}{Grid search. All kinds of parameter types can be handled, but you have discretize them yourself by always using \code{\link[ParamHelpers]{makeDiscreteParam}} in the \code{par.set} passed to \code{\link{tuneParams}}.}
#'   \item{makeTuneControlRandom}{Random search. All kinds of parameter types can be handled.}
#'   \item{makeTuneControlOptim}{Tuning with \code{\link[stats]{optim}}. Can handle numeric(vector) and integer(vector) hyperparameters. For integers the internally proposed numeric values are automatically rounded.}
#'   \item{makeTuneControlCMAES}{CMA Evolution Strategy with method \code{\link[cmaes]{cma_es}}. Can handle numeric(vector) and integer(vector) hyperparameters. For integers the internally proposed numeric values are automatically rounded.}
#'   \item{makeTuneControlIrace}{Tuning with iterated F-Racing with method \code{\link[irace]{irace}}. All kinds of parameter types can be handled.}
#' }
#' 
#' Dependent parameters can currently only be handled by random search and irace.
#' 
#' Some notes on irace: For resampling you have to pass a \code{\link[mlr]{ResampleDesc}}, not a \code{\link[mlr]{ResampleInstance}}. 
#' The resampling strategy is randomly instantiated \code{n.instances} times and these are the instances in the sense of irace
#' (\code{instances} element of \code{tunerConfig} in \code{\link[irace]{irace}}). Also note that irace will always 
#' store its tuning results in a file on disk, see the package documentation for details on this and how to change the file path.
#' 
#' @param same.resampling.instance [\code{logical(1)}]\cr
#'   Should the same resampling instance be used for all evaluations to reduce variance?
#'   Default is \code{TRUE}.
#' @param start [\code{numeric}]\cr
#'   Named list of initial parameter values.
#' @param n.instances [\code{integer(1)}]\cr
#'   Number of random resampling instances for irace, see details.
#'   Default is 100.
#' @param maxit [\code{integer(1)}]\cr
#'   Number of iterations for random search.
#'   Default is 100.
#' @param show.irace.output [\code{logical(1)}]\cr
#'   Show console output of irace while tuning?
#'   Default is \code{FALSE}.
#' @param ... [any]\cr
#'   Further control parameters passed to the \code{control} argument of \code{\link[stats]{optim}},
#'   the \code{control} argument of \code{\link[cmaes]{cma_es}}, \code{tunerConfig} argument of \code{\link[irace]{irace}}. 
#' @return [\code{\link{TuneControl}}]. The specific subclass is one of
#'   \code{\link{TuneControlGrid}}, \code{\link{TuneControlRandom}}, \code{\link{TuneControlOptim}}, \code{\link{TuneControlCMAES}}, \code{\link{TuneControlIrace}}.
#' @name TuneControl
#' @rdname TuneControl
#' @aliases TuneControlGrid TuneControlRandom TuneControlOptim TuneControlCMAES TuneControlIrace
NULL

makeTuneControl = function(same.resampling.instance, start, ..., cl) {
  checkArg(same.resampling.instance, "logical", len=1, na.ok=FALSE)
  checkArg(start, "list")
  if (!isProperlyNamed(start))
    stop("'start' must be a properly named list!")
	x = makeOptControl(same.resampling.instance=same.resampling.instance, ...)
  x$start = start       
  class(x) = c(cl, "TuneControl", class(x))
  return(x)
}

#' @S3method print TuneControl
print.TuneControl = function(x, ...) {
  catf("Tune control: %s", class(x)[1])
  catf("Same resampling instance: %s", x$same.resampling.instance)
  catf("Start: %s", convertToShortString(x$start))
  catf("Further arguments: %s", convertToShortString(x$extra.args))
}