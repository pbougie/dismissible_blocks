$:.push File.expand_path('../lib', __FILE__)

require 'dismissible_blocks/version'

Gem::Specification.new do |s|
  s.name        = 'dismissible_blocks'
  s.version     = DismissibleBlocks::VERSION
  s.authors     = ['Patrick Bougie']
  s.email       = ['hello@patrickbougie.com']
  s.summary     = 'Dismissible HTML blocks for Ruby on Rails'
  s.description = 'Dismiss HTML blocks and save state in the database. Engine for Ruby on Rails.'
  s.homepage    = 'https://github.com/pbougie/dismissible_blocks'
  s.license     = 'MIT'

  s.files = Dir['{app,config,lib}/**/*', 'Gemfile', 'Rakefile', 'README.markdown', 'LICENSE.text']
  s.test_files = Dir['test/**/*']

  s.add_runtime_dependency 'rails', '>= 3.2'
  s.add_runtime_dependency 'jquery-rails'

  s.add_development_dependency 'bundler'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'selenium-webdriver'
end
