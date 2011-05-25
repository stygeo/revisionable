# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{revisionable}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jeffrey Wilcke"]
  s.date = %q{2011-05-25}
  s.description = %q{Revision control for Rails' ActiveRecord models}
  s.email = %q{stygeo@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     ".infinity_test",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "lib/revisionable.rb",
     "lib/revisionable/active_record.rb",
     "lib/revisionable/control.rb",
     "lib/revisionable/engine.rb",
     "spec/active_record_spec.rb",
     "spec/control_spec.rb",
     "spec/factories/revisionable_test_factory.rb",
     "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/stygeo/revisionable}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Revision control for ActiveRecord models}
  s.test_files = [
    "spec/active_record_spec.rb",
     "spec/control_spec.rb",
     "spec/factories/revisionable_test_factory.rb",
     "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<thoughtbot-shoulda>, [">= 0"])
    else
      s.add_dependency(%q<thoughtbot-shoulda>, [">= 0"])
    end
  else
    s.add_dependency(%q<thoughtbot-shoulda>, [">= 0"])
  end
end

