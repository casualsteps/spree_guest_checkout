# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_guest_checkout'
  s.version     = '2.2.2'
  s.summary     = 'improve guest checkout process'
  s.description = '1. add registration form in order complete page \
                   2. make guest can view their order status'
  s.required_ruby_version = '>= 1.9.3'

  s.author    = 'Jonghun Yu'
  s.email     = 'jonghun.yu@luuv.it'
  s.homepage  = 'https://github.com/casualsteps/spree_guest_checkout'

  #s.files       = `git ls-files`.split("\n")
  #s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> 2.3.0'

  s.add_development_dependency 'capybara', '~> 2.1'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_girl', '~> 4.4'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails',  '~> 2.13'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'
end
