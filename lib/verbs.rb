require './lexicon/verb_lexicon'

class Verbs
  def self.include?(word)
    VerbLexicon.keys.include?(word.to_sym)
  end
end
