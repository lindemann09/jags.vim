" Vim syntax file
" Language:	JAGS
" Maintainer:	Oliver Lindemann <oliver.lindemann@cognitive-psychology.eu>
" Last Change:	08 Apr 2015
" Filenames:    *.jags

" ---------------------------------------------------------------------
"  Load Once: {{{1
if version < 600
" For vim-version 5.x: Clear all syntax items
" For vim-version 6.x: Quit when a syntax file was already loaded
    syntax clear
elseif exists("b:current_syntax")
    finish
endif

" ---------------------------------------------------------------------
"  Clusters: {{{1

" ---------------------------------------------------------------------
"  Comment: {{{1
syn match jagsComment /\#.*/

" ---------------------------------------------------------------------
"  Identifier: {{{1
" identifier with leading letter and optional following keyword characters
syn keyword jagsFunction  abs arccos arccosh arcsin arcsinh arctan arctanh cos cosh cloglog equals exp icloglog log ifelse ilogit logfact loggam logit phi pow probit round sin sinh sqrt step tan tanh trunc inprod interp.lin logdet max mean min prod sum sd inverse rank sort 


" ---------------------------------------------------------------------
"  Statement: {{{1
syn keyword jagsStatement   model data break next return
syn keyword jagsConditional if else 
syn keyword jagsRepeat      for in repeat while


" ---------------------------------------------------------------------
"  Constant: {{{1
" string enclosed in double quotes
syn region  jagsString start=/"/ skip=/\\\\\|\\"/ end=/"/
" string enclosed in single quotes
syn region  jagsString start=/'/ skip=/\\\\\|\\'/ end=/'/
" number with no fractional part or exponent
syn match   jagsNumber /\d\+/
" floating point number with integer and fractional parts and optional exponent
syn match   jagsFloat /\d\+\.\d*\([Ee][-+]\=\d\+\)\=/
" floating point number with no integer part and optional exponent
syn match   jagsFloat /\.\d\+\([Ee][-+]\=\d\+\)\=/
" floating point number with no fractional part and optional exponent
syn match   jagsFloat /\d\+[Ee][-+]\=\d\+/
syn match   jagsOperator /[<-]\|[\~]/
syn match   jagsInterval /I(.*)/

" ---------------------------------------------------------------------
"  Special: {{{1
syn match   jagsDelimiter /[,;:\[\]{}()]/
" A bunch of distributions
syn keyword jagsDistribution dbern pbern qbern dbeta pbeta qbeta dbin pbin qbin dchisqr pchisqr qchisqr ddexp pdexp qdexp dexp pexp qexp df pf qf dgamma pgamma qgamma dgen.gamma pgen.gamma qgen.gamma dhyper phyper qhyper dlogis plogis qlogis dlnorm plnorm qlnorm dnegbin pnegbin qnegbin dnchisqr pnchisqr qnchisqr dnorm pnorm qnorm dpar ppar qpar dpois ppois qpois dt pt qt dweib pweib qweib ddirch ddirich dweibull dnbinom dchisq dbinom dinterval dcat dunif

" ---------------------------------------------------------------------
"  Error: {{{1


" ---------------------------------------------------------------------
"  Define The Default Highlighting: {{{1
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_jags_syn_inits")
    if version < 508
	let did_jags_syn_inits = 1
	command -nargs=+ HiLink hi link <args>
    else
	command -nargs=+ HiLink hi def link <args>
    endif
  HiLink jagsComment        Comment
  HiLink jagsConstant       Constant
  HiLink jagsString         String
  HiLink jagsNumber         Number
  HiLink jagsBoolean        Boolean
  HiLink jagsFloat          Float
  HiLink jagsStatement	    Statement
  HiLink jagsOperator       Statement
  HiLink jagsConditional    Conditional
  HiLink jagsRepeat         Repeat
  HiLink jagsDistribution   Type
  HiLink jagsFunction       Function
  HiLink jagsDelimiter      Delimiter
  HiLink jagsInterval       Constant
  
  delcommand HiLink
endif

let b:current_syntax = "jags"

set ts=4 sw=2 expandtab 
