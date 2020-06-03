require "yaml"

def load_library(file)
  emoticons = YAML.load_file(file)
  result = {}

  emoticons.each { |key, val| result[key] = {} }
  emoticons.each do |key, val|
    val.each_with_index do |ele, idx|
      result[key][:english] = ele if idx == 0
      result[key][:japanese] = ele if idx == 1
    end
  end

  result
end

def get_japanese_emoticon(file, english_emoticon)
  load_library(file).each do |key, val|
    return val[:japanese] if val[:english] == english_emoticon
  end

  "Sorry, that emoticon was not found"

end

def get_english_meaning(file, japanese_emoticon)
  load_library(file).each do |key, val|
    return key.to_s if val[:japanese] == japanese_emoticon
  end

  "Sorry, that emoticon was not found"

end
