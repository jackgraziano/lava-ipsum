require 'json'

file = File.read('paragraphs.json')
data = JSON.parse(file)

contagem = 0
endings = Hash.new(0)
data.each do |key, sentence|
  sentence.split(" ").each do |word|
    if word.class == String && word.length > 5
      ending = word[-2] + word[-1]
      endings[ending] = endings[ending] + 1
      contagem = contagem + 1
    end
  end
end


p endings.sort_by{ |key, value| value}.to_h
puts contagem
