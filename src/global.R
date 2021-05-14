library(shiny)
library(shiny.fluent)
library(modules)
library(config)
library(sass)
library(fixtuRes)
library(reactable)
library(magrittr)
library(markdown)

consts <- config::get(file = "constants/constants.yaml")
autocompleter <- list(
  "type", "numeric", "integer", "boolean", "set", "min", "max",
  "unique", "length", "pattern", "string", "set_type", "set_size",
  "start", "distribution", "distribution_type", "custom",
  "custom_generator", "custom_column_generator", "calculated",
  "formula"
)

sass(
  sass::sass_file(consts$sass$input),
  options = sass_options(output_style = consts$sass$style),
  cache = FALSE,
  output = consts$sass$output
)

init_fake_data_configuration <- yaml::read_yaml("constants/init_data_configuration.yaml")

data_preview <- modules::use("modules/data_preview.R")
yaml_editor <- modules::use("modules/yaml_editor.R")
download <- modules::use("modules/download.R")
about <- modules::use("modules/about.R")
help <- modules::use("modules/help.R")
