library(kableExtra)

knitr::opts_chunk$set(
  comment = "#>", 
  echo = FALSE,
  message=FALSE, 
  warning=FALSE,
  fig.align='center',
  out.width='50%',
  fig.pos = "ht", 
  out.extra = ""
)

options(knitr.table.format = "pipe")

pream <- readLines("../../share/preamble_Rmd_pre_sub.tex")
issueinfo <- paste0("Volume ", params$volume, ", Issue ", params$issue, ", ", format(Sys.time(), '%B %Y'))
pream <- gsub("issueinfo", issueinfo, pream)
write(pream, file = "../../share/preamble_Rmd.tex")
