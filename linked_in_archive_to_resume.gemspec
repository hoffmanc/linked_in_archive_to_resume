Gem::Specification.new do |s|
  s.name = "linked_in_archive_to_resume"
  s.version = "1.0.0"
  s.summary = %{LinkedIn Archive to HTML Resume.}
  s.description = %Q{}
  s.author = ["Chris Hoffman"]
  s.email = ["chris.c.hoffman@gmail.com"]
  s.homepage = "http://github.com/hoffmanc/linked_in_archive_to_resume"
  s.license = "MIT"
  s.files = `git ls-files`.split("\n")
  s.executables << "linked_in_archive_to_resume"

  s.add_dependency "haml"
end
