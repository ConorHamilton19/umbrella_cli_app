
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "Umbrella/version"

Gem::Specification.new do |spec|
  spec.name          = "umbrella_cli_app"
  spec.version       = Umbrella::VERSION
  spec.authors       = ["Conor Hamilton"]
  spec.email         = ["conhamil19@gmail.com"]

  spec.summary       = "CLI app to tell if you need an Umbrella today"
  spec.homepage      = "https://github.com/ConorHamilton19/umbrella-cli-app/blob/master/Umbrella/lib/Umbrella.rb"
  spec.license       = "MIT"



  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "bin"
  spec.executables   = ["umbrella_cli"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"
  
  spec.add_dependency "nokogiri" 
end
