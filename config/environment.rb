require "bundler/inline"

gemfile(true) do
  source "https://rubygems.org"
  gem "language_pack", "278", github: "heroku/heroku-buildpack-ruby", tag: "v278"
end

require "language_pack"

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "bootboot_buildpack"
