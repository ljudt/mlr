% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/measures.R
\docType{data}
\name{measures}
\alias{G1}
\alias{G2}
\alias{acc}
\alias{auc}
\alias{bac}
\alias{ber}
\alias{brier}
\alias{cindex}
\alias{db}
\alias{dunn}
\alias{f1}
\alias{fdr}
\alias{featperc}
\alias{fn}
\alias{fnr}
\alias{fp}
\alias{fpr}
\alias{gmean}
\alias{gpr}
\alias{hamloss}
\alias{mae}
\alias{mcc}
\alias{mcp}
\alias{meancosts}
\alias{measureACC}
\alias{measureAUC}
\alias{measureBAC}
\alias{measureBrier}
\alias{measureFDR}
\alias{measureFN}
\alias{measureFNR}
\alias{measureFP}
\alias{measureFPR}
\alias{measureGMEAN}
\alias{measureGPR}
\alias{measureHAMLOSS}
\alias{measureMAE}
\alias{measureMCC}
\alias{measureMEDAE}
\alias{measureMEDSE}
\alias{measureMMCE}
\alias{measureMSE}
\alias{measureNPV}
\alias{measurePPV}
\alias{measureRMSE}
\alias{measureSAE}
\alias{measureSSE}
\alias{measureTN}
\alias{measureTNR}
\alias{measureTP}
\alias{measureTPR}
\alias{measures}
\alias{medae}
\alias{medse}
\alias{mmce}
\alias{mse}
\alias{multiclass.auc}
\alias{npv}
\alias{ppv}
\alias{rmse}
\alias{sae}
\alias{silhouette}
\alias{sse}
\alias{timeboth}
\alias{timepredict}
\alias{timetrain}
\alias{tn}
\alias{tnr}
\alias{tp}
\alias{tpr}
\title{Performance measures.}
\format{none}
\usage{
featperc

timetrain

timepredict

timeboth

sse

measureSSE(truth, response)

mse

measureMSE(truth, response)

rmse

measureRMSE(truth, response)

medse

measureMEDSE(truth, response)

sae

measureSAE(truth, response)

mae

measureMAE(truth, response)

medae

measureMEDAE(truth, response)

mmce

measureMMCE(truth, response)

acc

measureACC(truth, response)

ber

multiclass.auc

auc

measureAUC(probabilites, truth, negative, positive)

brier

measureBrier(probabilites, truth, negative, positive)

bac

measureBAC(truth, response, negative, positive)

tp

measureTP(truth, response, positive)

tn

measureTN(truth, response, negative)

fp

measureFP(truth, response, positive)

fn

measureFN(truth, response, negative)

tpr

measureTPR(truth, response, positive)

tnr

measureTNR(truth, response, negative)

fpr

measureFPR(truth, response, negative, positive)

fnr

measureFNR(truth, response, negative, positive)

ppv

measurePPV(truth, response, positive)

npv

measureNPV(truth, response, negative)

fdr

measureFDR(truth, response, positive)

mcc

measureMCC(truth, response, negative, positive)

f1

gmean

measureGMEAN(truth, response, negative, positive)

gpr

measureGPR(truth, response, positive)

hamloss

measureHAMLOSS(truth, response)

cindex

meancosts

mcp

db

dunn

G1

G2

silhouette
}
\arguments{
\item{truth}{[\code{factor}]\cr
Vector of the true class.}

\item{response}{[\code{factor}]\cr
Vector of the predicted class.}

\item{probabilites}{[\code{numeric}]\cr
The probabilites for the positive class.}

\item{negative}{[\code{character(1)}]\cr
The name of the negative class.}

\item{positive}{[\code{character(1)}]\cr
The name of the positive class.}
}
\description{
A performance measure is evaluated after a single train/predict step and returns a single number to assess the quality
of the prediction (or maybe only the model, think AIC).
The measure itself knows whether it wants to be minimized or maximized and for what tasks it is applicable.

All supported measures can be found by \code{\link{listMeasures}} or as a table
in the tutorial appendix: \url{http://mlr-org.github.io/mlr-tutorial/release/html/measures/}.

If you want a measure for a misclassification cost matrix, look at \code{\link{makeCostMeasure}}.
If you want to implement your own measure, look at \code{\link{makeMeasure}}.

Most measures can directly be accessed via the function named after the scheme measureX (e.g. measureSSE).

For clustering measures, we compact the predicted cluster IDs such that they form a continuous series
starting with 1. If this is not the case, some of the measures will generate warnings.
}
\seealso{
Other performance: \code{\link{Measure}},
  \code{\link{makeMeasure}}; \code{\link{makeCostMeasure}};
  \code{\link{makeCustomResampledMeasure}};
  \code{\link{performance}}
}
\keyword{datasets}

