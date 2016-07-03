require './lib/phrases.rb'

class SentenceInterpreter
  
  def self.parse(sentece='')
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