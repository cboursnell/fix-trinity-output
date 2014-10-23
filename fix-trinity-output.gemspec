Gem::Specification.new do |gem|
  gem.name        = 'fix-trinity-output'
  gem.version     = '1.0.0'
  gem.date        = '2014-10-23'
  gem.summary     = "Fix output fastq files from Trinity"
  gem.description = "See readme"
  gem.authors     = ["Chris Boursnell"]
  gem.email       = 'cmb211@cam.ac.uk'
  gem.files       = `git ls-files`.split("\n")
  gem.executables = ["fix-trinity-output"]
  gem.require_paths = %w( lib )
  gem.homepage    = 'http://rubygems.org/gems/fix-trinity-output'
  gem.license     = 'MIT'

  gem.add_dependency 'trollop', '~> 2.0'

  gem.add_development_dependency 'rake', '~> 10.3', '>= 10.3.2'
  gem.add_development_dependency 'turn', '~> 0.9', '>= 0.9.7'
  gem.add_development_dependency 'simplecov', '~> 0.8', '>= 0.8.2'
  gem.add_development_dependency 'shoulda-context', '~> 1.2', '>= 1.2.1'
end
