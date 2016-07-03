require './lexicon/noun_lexicon'

class Nouns
  def self.include?(word)
    NounLexicon.keys.include?(word.to_sym)
  end
end
