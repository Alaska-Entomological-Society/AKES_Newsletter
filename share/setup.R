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

options(knitr.table.format = "pipe",
        knitr.kable.NA = "")

# Set up table formatting.
if(knitr::is_latex_output()) {out_format <- "latex"} 
if(knitr::is_html_output()) {out_format <- "html"}

format_table <- function(x, format = "html"){
  if(format == "html"){
    for (this_col in 1:ncol(x)){
      x[,this_col] <- gsub("<em>", "*", x[,this_col])
      x[,this_col] <- gsub("</em>", "*", x[,this_col])
      x[,this_col] <- gsub("<strong>", "**", x[,this_col])
      x[,this_col] <- gsub("</strong>", "**", x[,this_col])
      names(x) <- gsub("X\\.", ".", names(x))
      names(x) <- gsub("\\.\\.em\\.", "*", names(x))
      names(x) <- gsub("\\.em\\.", "*", names(x))
    }
  }
  if(format == "latex"){
    for (this_col in 1:ncol(x)){
      x[,this_col] <- gsub("<em>", "\\\\textit\\{", x[,this_col])
      x[,this_col] <- gsub("</em>", "\\}", x[,this_col])
      x[,this_col] <- gsub("<strong>", "\\\\textbf\\{", x[,this_col])
      x[,this_col] <- gsub("</strong>", "\\}", x[,this_col])
      x[,this_col] <- gsub("<u>", "\\\\underline\\{", x[,this_col])
      x[,this_col] <- gsub("</u>", "\\}", x[,this_col])
      x[,this_col] <- gsub("<sub>", "\\\\textsubscript\\{", x[,this_col])
      x[,this_col] <- gsub("</sub>", "\\}", x[,this_col])
      names(x) <- gsub("X\\.", ".", names(x))
      names(x) <- gsub("\\.\\.em\\.", "\\}", names(x))
      names(x) <- gsub("\\.em\\.", "\\\\textit\\{", names(x))
    }
  }
  x    
}

pream <- readLines("../../share/preamble_Rmd_pre_sub.tex")
issueinfo <- paste0("Volume ", params$volume, ", Issue ", params$issue, ", ", format(Sys.time(), '%B %Y'))
pream <- gsub("issueinfo", issueinfo, pream)
write(pream, file = "../../share/preamble_Rmd.tex")
