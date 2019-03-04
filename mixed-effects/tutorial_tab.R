### tutorial_tab ----
tutorial_tab <- tabItem(
  tabName = "tutorial_tab",
  h3("Tutorial"),
  p("Experimental designs with crossed random effects (that sample both subjects and stimuli) require analyses that account for both sources of random variation. Although such datasets are best analyzed with linear mixed-effects models (Baayen, Davidson, & Bates, 2008), many researchers continue using ANOVA instead because they are not confident in specifying and interpreting mixed-effects models. The tutorial will explain how to analyze and interprete data with crossed random effects through data simulation in R. The focus will be on interpreting the model output in light of the simulated parameters and comparing the results to ANOVA-based analyses. The tutorial will also link to a Shiny app that demonstrates the core concepts interactively."),
  h4("What's wrong with aggregating data?"),
  p("Imagine you want to find out if women born on an even-numbered day are taller than women born on an odd-numbered day. You have a group of 50 women born on even-numbered days and 50 women born on odd-numbered days. ")
)

library(tidyverse)
stim_n <- 50
# https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0018962
height_m <- 155.8
height_sd <- 7.2

stim <- tibble(
  stim_id = 1:(stim_n*2),
  birthday = rep(c("odd", "even"), stim_n),
  height = rnorm(stim_n*2, )
)