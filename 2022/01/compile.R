library(rmarkdown)

main <- "AKES_newsletter_2022_01.Rmd"
articles <- c("chokecherry_midge.Rmd", "corrections.Rmd", "Miller_Creek_inventory.Rmd")

rmarkdown::render(input = main, output_format = "all")

for (this_article in articles){
  rmarkdown::render(input = this_article, output_format = "all")
}

