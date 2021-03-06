% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bbdml.R
\name{bbdml}
\alias{bbdml}
\title{Maximum Likelihood for the Beta-binomial Distribution}
\usage{
bbdml(
  formula,
  phi.formula,
  data,
  link = "logit",
  phi.link = "logit",
  method = "trust",
  control = list(maxit = 1000, reltol = 1e-14),
  numerical = FALSE,
  nstart = 1,
  inits = NULL,
  ...
)
}
\arguments{
\item{formula}{an object of class \code{formula}: a symbolic description of the model to be fitted to the abundance}

\item{phi.formula}{an object of class \code{formula} without the response: a symbolic description of the model to be fitted to the dispersion}

\item{data}{a data frame or \code{phyloseq} object containing the variables in the models}

\item{link}{link function for abundance covariates, defaults to \code{"logit"}}

\item{phi.link}{link function for dispersion covariates, defaults to \code{"logit"}}

\item{method}{optimization method, defaults to \code{"trust"}, or see \code{\link{optimr}} for other options}

\item{control}{optimization control parameters (see \code{\link{optimr}})}

\item{numerical}{Boolean. Defaults to \code{FALSE}. Indicator of whether to use the numeric Hessian (not recommended).}

\item{nstart}{Integer. Defaults to \code{1}. Number of starts for optimization.}

\item{inits}{Optional initializations as rows of a matrix. Defaults to \code{NULL}.}

\item{...}{Optional additional arguments for \code{\link{optimr}} or \code{\link{trust}}}
}
\value{
An object of class \code{bbdml}.
}
\description{
Maximum Likelihood for the Beta-binomial Distribution
}
\examples{
\dontrun{
# phyloseq example
data(soil_phylo)
soil <- soil_phylo \%>\%
phyloseq::subset_samples(DayAmdmt \%in\% c(11,21)) \%>\%
phyloseq::tax_glom("Phylum")
bbdml(formula = OTU.1 ~ DayAmdmt,
phi.formula = ~ DayAmdmt,
data = soil)

# data frame example
seq_depth <- rpois(20, lambda = 10000)
my_counts <- rbinom(20, size = seq_depth, prob = 0.001) * 10
my_covariate <- cbind(rep(c(0,1), each = 10))
colnames(my_covariate) <- c("X1")
example_data <- data.frame("W" = my_counts, "M" = seq_depth, my_covariate)
bbdml(formula = cbind(W, M - W) ~ X1,
phi.formula = ~ X1,
data = example_data)
}

}
