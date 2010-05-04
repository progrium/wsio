# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{wsio}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jeff Lindsay"]
  s.cert_chain = ["/Users/progrium/.gem/gem-public_cert.pem"]
  s.date = %q{2010-05-04}
  s.default_executable = %q{wsio}
  s.description = %q{Web stream input/output tool}
  s.email = %q{jeff.lindsay@twilio.com}
  s.executables = ["wsio"]
  s.extra_rdoc_files = ["README", "bin/wsio", "lib/wsio.rb"]
  s.files = ["README", "Rakefile", "bin/wsio", "lib/wsio.rb", "Manifest", "wsio.gemspec"]
  s.homepage = %q{http://github.com/progrium/wsio}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Wsio", "--main", "README"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{wsio}
  s.rubygems_version = %q{1.3.5}
  s.signing_key = %q{/Users/progrium/.gem/gem-private_key.pem}
  s.summary = %q{Web stream input/output tool}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
