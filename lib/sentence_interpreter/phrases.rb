require './lib/sentence_interpreter/verbs'
require './lib/sentence_interpreter/nouns'

class NounBeforeVerbError < StandardError
end

class Phrases
  def self.new(sentence='')
    sentence.downcase.split(" ").reduce([]) do |phrases, word|
      phrases.tap do |phrases|
        if Verbs.include?(word)
          phrases << {verb: word}
        elsif Nouns.include?(word)
          unless phrases[-1].is_a?(Hash) && phrases[-1][:verb].is_a?(String)
            raise(NounBeforeVerbError, "This word needs a verb before it: #{word}")
          end
          phrases[-1][:nouns] ||= []
          phrases[-1][:nouns] << word
        end
      end
    end
  end
end
