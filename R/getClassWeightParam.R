#' @title Get the class weight parameter of a learner.
#'
#' @template arg_learner
#' @return [\code{numeric \link{LearnerParam}}].\cr
#'   A numeric parameter object, containing the class weight parameter of the
#'   given learner.
#' @family learner
#' @export
getClassWeightParam = function(learner) {
  checkLearnerClassif(learner)
  assertChoice("class.weights", learner$properties)
  learner$par.set$pars[[learner$class.weights.param]]
}
