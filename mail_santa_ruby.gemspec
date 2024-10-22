# frozen_string_literal: true

require_relative "lib/mail_santa_ruby/version"

Gem::Specification.new do |spec|
  spec.name = "mail_santa_ruby"
  spec.version = MailSantaRuby::VERSION
  spec.authors = ["Polina Stamenova"]
  spec.email = ["polina.stamenova@gmail.com"]

  spec.summary = "Fetch data from the MailSanta API"
  spec.homepage = "https://github.com/PolinaStamenova/mail_santa_ruby"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  # Add gem metadata for public display
  spec.metadata["source_code_uri"] = "https://github.com/PolinaStamenova/mail_santa_ruby"
  spec.metadata["changelog_uri"] = "https://github.com/PolinaStamenova/mail_santa_ruby/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end  
  # spec.bindir = "exe"
  # spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Register a new dependency of the gem
  spec.add_dependency "faraday"
  spec.add_dependency "json"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
