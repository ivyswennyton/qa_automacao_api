require "cucumber"
require 'rspec'
require 'yaml'
require "httparty"

CONFIG = YAML.load_file("./features/support/data/urls.yml")
