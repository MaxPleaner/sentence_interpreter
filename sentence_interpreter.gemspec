Gem::Specification.new do |s|
  s.files         = `git ls-files -z`.split("\x0")
  s.require_paths = ['lib', 'lib/sentence_interpreter', 'lib/lexicon']
  s.name        = 'sentence_interpreter'
  s.version     = '0.0.6'
  s.date        = '2016-07-03'
  s.summary     = "Parses a sentence into verb-noun phrases"
  s.description = ""
  s.authors     = ["Max Pleaner"]
  s.email       = 'maxpleaner@gmail.com'
  s.homepage    =
    'http://github.com/maxpleaner/sentence_interpreter'
  s.license       = 'MIT'
end
