\name{Model utilities}
\alias{MuMIn-model-utils}
\alias{coeffs}
\alias{model.names}
\alias{tTable}
\alias{coefTable}
\alias{coefTable.default}
\alias{coefTable.lme}
\alias{coefTable.gee}
\alias{coefTable.averaging}
\alias{getAllTerms}
\alias{getAllTerms.terms}
\alias{get.response}

\encoding{utf-8}
\newcommand{\href}{#2}

\title{Model utility functions}
\description{
These functions extract or calculate various values from provided fitted model
	objects(s). They are mainly meant for internal use.

\code{coeffs} extracts model coefficients;

\code{getAllTerms} extracts independent variable names from a model object;

\code{coefTable} extracts a table of coefficients, standard errors and
	associated degrees of freedom when possible;

\code{get.response} extracts response variable from fitted model object;

\code{model.names} generates shorthand (alpha)numeric names for one or several
	fitted models.

}

\usage{
coeffs(model)

getAllTerms(x, ...)
\method{getAllTerms}{terms}(x, offset = TRUE, intercept = FALSE, ...)

coefTable(model, ...)
\method{coefTable}{averaging}(model, full = FALSE, adjust.se = TRUE, ...)
\method{coefTable}{lme}(model, adjustSigma, ...)
\method{coefTable}{gee}(model, ..., type = c("naive", "robust"))

get.response(x, ...)

model.names(object, ..., labels = NULL, use.letters = FALSE)

}
\arguments{
  \item{model}{a fitted model object. }
  \item{object}{a fitted model object or a list of such objects. }
  \item{x}{a fitted model object or a \code{formula}. }
  \item{offset}{should \sQuote{offset} terms be included? }
  \item{intercept}{should terms names include the intercept?}
  \item{full, adjust.se}{logical, apply to \code{"averaging"} objects. If \code{full} is 
    \code{TRUE}, the full model averaged coefficients are returned, and 
    subset-averaged ones otherwise.
    If \code{adjust.se} is \code{TRUE}, inflated standard errors are returned. 
    See \sQuote{Details} in \code{\link{par.avg}}.
    }
 
  \item{adjustSigma}{ See \code{\link[nlme]{summary.lme}}. }
  \item{type}{ for \acronym{GEE} models, the type of covariance estimator to calculate
		returned standard errors on. Either \code{"naive"} or \code{"robust"}
		(\sQuote{sandwich}). }

 \item{labels}{optionally, a character vector with names of all the terms,
	e.g. from a global model. \code{model.names} enumerates the model terms in
	order of their appearance in the list and in the models. Therefore changing the
	order of the models leads to different names. Providing \code{labels}
	prevents that. }
    
  \item{\dots}{for \code{model.names}, more fitted model objects.
	For \code{coefTable} arguments that are passed to appropriate \code{\link{vcov}}
	or \code{summary} method (e.g. \code{dispersion} parameter for \code{glm} may
	be used here). In other functions often not used.
  }
  \item{use.letters}{logical, whether letters should be used instead of numeric codes. }
 }

\details{
	The functions \code{coeffs}, \code{getAllTerms} and \code{coefTable} provide
	interface between the model object and \code{model.avg} (and
	\code{dredge}). Custom methods can be written to provide support for
	additional classes of models.
}

\note{

\code{coeffs}'s value is in most cases identical to that returned by
\code{\link{coef}}, the only difference being it returns fixed effects'
coefficients for mixed models, and the value is always a named numeric vector.

Use of \code{tTable} is deprecated in favour of \code{coefTable}.

}

\author{Kamil Barto\enc{ń}{n}}


\keyword{models}
\keyword{manip}
