% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pbWald.R
\name{pbWald}
\alias{pbWald}
\title{Parametric bootstrap Wald test}
\usage{
pbWald(mod, mod_null, B = 1000)
}
\arguments{
\item{mod}{an object of class \code{bbdml}}

\item{mod_null}{an object of class \code{bbdml}, should be nested within \code{mod}}

\item{B}{Integer. Defaults to \code{1000}. Number of bootstrap iterations.}
}
\value{
P-value from parametric bootstrap Wald test.
}
\description{
Parametric bootstrap Wald test
}
\examples{
\dontrun{
data(soil_phylo)
soil <- soil_phylo \%>\%
phyloseq::subset_samples(DayAmdmt \%in\% c(11,21)) \%>\%
tax_glom("Phylum")
mod1 <- bbdml(formula = OTU.1 ~ DayAmdmt,
phi.formula = ~ DayAmdmt,
data = soil)

mod2 <- bbdml(formula = OTU.1 ~ 1,
phi.formula = ~ 1,
data = soil)
pbWald(mod1, mod2, B = 100)
}
}
