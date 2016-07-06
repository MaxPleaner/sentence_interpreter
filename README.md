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
  require 'sentence_interpreter'
  
  class String
    def eval_noun
     NounLexicon[self.to_sym].call
    end
  end
  
  class Array
    def run_commands
      map { |cmd| VerbLexicon[cmd[:verb].to_sym].call *(cmd[:nouns].map(&:eval_noun)) }
      .join("\n")
    end
  end
  
  VerbLexicon[:print] = ->(*args) { print args.join(" ") }
  NounLexicon[:hello] = ->() { "hello" }
  SentenceInterpreter.interpret("print hello").run_commands
# => "hello"
```
The following rules will explain the functionality a little clearer:

- a "phrase" is considered a verb followed by any number of nouns.
- verbs and nouns are defined as the keys of the `NounLexicon` or `VerbLexicon` hashes.
- All words other than the verbs and nouns are ignored

Some more examples:

```ruby
require 'sentence_interpreter'

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
