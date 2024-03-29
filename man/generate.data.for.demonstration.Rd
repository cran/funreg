% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/GenerateDataForDemonstration.r
\name{generate.data.for.demonstration}
\alias{generate.data.for.demonstration}
\title{Generate data for some demonstration examples}
\usage{
generate.data.for.demonstration(
  nsub = 400,
  b0.true = -5,
  b1.true = 0,
  b2.true = +1,
  b3.true = -1,
  b4.true = +1,
  nobs = 500,
  observe.rate = 0.1
)
}
\arguments{
\item{nsub}{The number of subjects in the simulated dataset.}

\item{b0.true}{The true value of the intercept.}

\item{b1.true}{The true value of the first covariate.}

\item{b2.true}{The true value of the second covariate.}

\item{b3.true}{The true value of the third covariate.}

\item{b4.true}{The true value of the fourth covariate.}

\item{nobs}{The total number of possible observation times.}

\item{observe.rate}{The average proportion of those possible
times at which any given subject is observed.}
}
\value{
Returns a \code{data.frame} representing \code{nobs}
 measurements for each subject. The rows of this \code{data.frame}
 tell the values of two time-varying covariates on a dense grid
 of \code{nobs} observation times. It also contains an
 \code{id} variable, four subject-level covariates
  (\code{s1}, ..., \code{s4}) and one subject-level
response (\code{y}), which are replicated for each observation.
 For each observation, there is also its observation 
 time \code{time}, there are both the smooth latent value of the covariates 
(\code{true.x1} and \code{true.x2}) and 
versions observed with error (\code{x1} and \code{x2}), and there are 
also the local values of the functional regression coefficients 
(\code{true.betafn1} and \code{true.betafn2}).  Lastly, 
each row has a random value for \code{include.in.subsample},
telling whether it should be considered as an observed data
point (versus an unobserved moment in the simulated subject's life).
\code{include.in.subsample} is simply generated as a Bernoulli random variable with 
success probability \code{observe.rate}.
}
\description{
Simulates a dataset with two functional covariates, four 
subject-level scalar covariates, and a binary outcome.
}
\note{
\code{nobs} is the number of simulated data rows per
simulated subject.  It  
should be selected to be large because \code{x} covariates are conceptually
 supposed to be smooth functions of time. However, in the
simulated data analyses we actually only use a small random
subset of the generated time points, because this is more
realistic for many behavioral and medical science datasets.
Thus, the number of possible observation times per subject
is \code{nobs}, and the mean number of actual observation
times per subject is \code{nobs} times \code{observe.rate}. 
This smaller 'observed' dataset can be obtained by 
deleting from the dataset those observations having 
\code{include.in.subsample==FALSE}.
}
