require 'json'

def latinize_string(string)
  string.split(" ").map{|word| latinize_word(word)}.join(" ")
end


def latinize_word(word)
  if word.length >= 4
    ending = word[-2] + word[-1]

    if ['do', 'de'].include? ending
      return word[0..-3] + ["dus", "dum", "dorum"].sample
    elsif ['as'].include? ending
      return word[0..-3] + ["arum", "am", "ae"].sample
    elsif ['da'].include? ending
      return word[0..-2] + ["arum", "am", "ae"].sample
    elsif ['uz'].include? ending
      return word[0..-3] + ["ux"].sample
    elsif ['io', 'ro'].include? ending
      return word[0..-2] + ["us"].sample
    elsif ['to'].include? ending
      return word[0..-2] + ["us"].sample
    elsif ['va'].include? ending
      return word[0..-2] + ["am"].sample
    elsif ['al', 'or', 'ar'].include? ending
      return word + ["is"].sample
    elsif ['ca'].include? ending
      return word + ["m", 'e', 'rum'].sample
    elsif ['mo'].include? ending
      return word[0..-2] + ['us'].sample
    elsif ['os'].include? ending
      return word[0..-2] + ['rum'].sample
    elsif ['no'].include? ending
      return word[0..-2] + ['us'].sample
    else
      return word
    end
  else
    return word
  end
end

file = File.read('paragraphs.json')
data = JSON.parse(file)


transformed = {}
data.each do |k,v|
  transformed[k] = latinize_string(v)
end

p transformed
puts transformed.class
