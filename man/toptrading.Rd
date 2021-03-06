% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/toptradingcycle.R
\name{toptrading}
\alias{toptrading}
\title{Compute the top trading cycle algorithm}
\usage{
toptrading(utils = NULL, pref = NULL)
}
\arguments{
\item{utils}{is a matrix with cardinal utilities of all individuals in the
market. If there are \code{n} individuals, then this matrix will be of
dimension \code{n} by \code{n}. The \code{i,j}th element refers to the
payoff that individual \code{j} receives from being matched to individual
\code{i}.}

\item{pref}{is a matrix with the preference order of all individuals in the
market. This argument is only required when \code{utils} is not provided.
If there are \code{n} individuals, then this matrix will be of dimension
\code{n} by \code{n}. The \code{i,j}th element refers to \code{j}'s
\code{i}th most favorite partner. Preference orders can either be specified
using R-indexing (starting at 1) or C++ indexing (starting at 0).}
}
\value{
A vector of length \code{n} corresponding to the matchings being
  made, so that e.g. if the \code{4}th element is \code{6} then agent
  \code{4} was matched to agent \code{6}.
}
\description{
This package implements the top trading cycle algorithm.
}
\details{
The top trading algorithm solves the following problem: A set of \code{n} agents
each currently own their own home, and have preferences over the homes of other
agents. The agents may trade their homes in some way, the problem is to identify
a set of trades between agents so that no subset of agents can defect from the
rest of the group, and by trading within themselves improve their own payoffs.

Roughly speaking, the top trading cycle proceeds by identifying cycles of
agents, then eliminating those cycles until no agents remain. A cycle is a
sequence of agents such that each agent most prefers the next agent's home
(out of the remaining unmatched agents), and the last agent in the sequence
most prefers the first agent in the sequence's home.

The top trading cycle is guaranteed to produce a unique outcome, and that
outcome is the unique outcome in the core, meaning there is no other outcome
with the stability property described above.
}
\examples{
# example using cardinal utilities
utils = matrix(c(-1.4, -0.66, -0.45, 0.03,
                 0.72, 1.71, 0.59, 0.07,
                 0.44, 1.76, 1.71, -0.27,
                 0.26, 2.18, 1.4, 0.12), byrow = TRUE, nrow = 4)
utils
results = toptrading(utils = utils)
results

# example using ordinal preferences
pref = matrix(c(2, 4, 3, 4,
                3, 3, 4, 2,
                4, 2, 2, 1,
                1, 1, 1, 3), byrow = TRUE, nrow = 4)
pref
results = toptrading(pref = pref)
results
}
