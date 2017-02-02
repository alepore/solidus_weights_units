# encoding: UTF-8
$:.push File.expand_path('../lib', __FILE__)
require 'solidus_weights_units/version'

Gem::Specification.new do |s|
  s.name        = 'solidus_weights_units'
  s.version     = SolidusWeightsUnits::VERSION
  s.summary     = "Add units to solidus product's weights"
  s.description = s.summary
  s.license     = 'BSD-3-Clause'

  s.author    = 'Alessandro Lepore'
  s.email     = 'a.lepore@freegoweb.it'
  # s.homepage  = 'http://www.example.com'

  s.files = Dir["{app,config,db,lib}/**/*", 'LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'solidus_core', '~> 2.0'
  s.add_dependency 'deface', '~> 1.0'
  s.add_dependency 'ruby-units', '~> 2.1'

  s.add_development_dependency 'capybara'
  s.add_development_dependency 'poltergeist'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_girl'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'rubocop', '0.37.2'
  s.add_development_dependency 'rubocop-rspec', '1.4.0'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'rake', '< 11.0'
  s.add_development_dependency 'launchy'
end
