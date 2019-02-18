$:.push File.expand_path('../lib', __FILE__)

require 'dismissible_blocks/version'

Gem::Specification.new do |s|
  s.name        = 'dismissible_blocks'
  s.version     = DismissibleBlocks::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Patrick Bougie']
  s.email       = ['hello@patrickbougie.com']
  s.summary     = 'Dismissible HTML blocks for Ruby on Rails'
  s.description = 'Dismiss HTML blocks and save state in the database. Engine for Ruby on Rails.'
  s.homepage    = 'https://github.com/pbougie/dismissible_blocks'
  s.license     = 'MIT'
  s.metadata    = {
    'bug_tracker_uri' => 'https://github.com/pbougie/dismissible_blocks/issues',
    'changelog_uri'   => 'https://github.com/pbougie/dismissible_blocks/blob/master/CHANGELOG.md',
    'homepage_uri'    => 'https://github.com/pbougie/dismissible_blocks',
    'source_code_uri' => 'https://github.com/pbougie/dismissible_blocks',
  }

  s.files = Dir[
    '{app,config,lib}/**/*',
    'dismissible_blocks.gemspec',
    'README.md',
    'CHANGELOG.md',
    'LICENSE.txt'
  ]

  s.post_install_message = 'DismissibleBlocks 2+ removed jQuery as a dependency. See README.'

  s.add_runtime_dependency 'rails', '>= 3.2'

  s.add_development_dependency 'bundler'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'sqlite3', '>= 1.3.0', '< 1.4.0'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'listen'
  s.add_development_dependency 'puma'
end
