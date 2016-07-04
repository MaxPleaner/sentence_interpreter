require './lib/sentence_interpreter/phrases'

class SentenceInterpreter
  
  def self.interpret(sentence='')
    Phrases.new(sentence)
  end
  
  def self.IO # Run when this script is called directly
    sentence = ARGV.join(" ")
    puts Phrases.new(sentence)
  end
  
end

if __FILE__ == $0
  SentenceInterpreter.IO()
end