library(shiny)
library(shiny.fluent)
library(modules)
library(config)
library(sass)
library(fixtuRes)

consts <- config::get(file = "constants/constants.yaml")

sass(
  sass::sass_file(consts$sass$input),
  options = sass_options(output_style = consts$sass$style),
  cache = FALSE,
  output = consts$sass$output
)
