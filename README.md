### sentence_interpreter gem

#### Installation

`gem install sentence_interpreter`

#### Usage

```ruby
require 'sentence_interpreter'
VerbLexicon[:print] = true 
NounLexicon[:hello] = true
SentenceInterpreter.interpret("print hello")
# => [ { verb: :print, nouns: ["hello"] } ]
```

In the `VerbLexicon` and `NounLexicon` hashes, the values can be any truthy value so the word is considered "defined". For example, it could be a proc which can be evaluated:

```ruby
class Symbol
  def eval_noun
    NounLexicon[self].call
  end
end

VerbLexicon[:print] = ->(*nouns) { print nouns.map(&:eval_noun).join(" ") }
NounLexicon[:hello] = ->() { "hello" }
SentenceInterpreter.interpret("print hello").each do |cmd|
  cmd[:verb].call(*cmd[:nouns])
end
# => "hello"
```
The following rules will explain the functionality a little clearer:

- a "phrase" is considered a verb followed by any number of nouns.
- verbs and nouns are defined as the keys of the `NounLexicon` or `VerbLexicon` hashes.
- All words other than the verbs and nouns are ignored

Some more examples:

```ruby
VerbLexicon[:visit] = true
NounLexicon[:website] = true
NounLexicon[:github] = true

SentenceInterpreter.interpret("visit website github")
# => [{ verb: :visit, nouns: ["website", "github"] }]

begin
  SentenceInterpreter.interpret("github visit")
rescue NounBeforeVerbError => e
  puts "error"
  # This error was called because the noun (github) comes before the verb (visit)
end

SentenceInterpreter.interpret("visit website github and visit github website")
# => [{verb: :visit, nouns: ["website", "github"]}, {verb: :visit, nouns: ["github", "website"]}]

```
