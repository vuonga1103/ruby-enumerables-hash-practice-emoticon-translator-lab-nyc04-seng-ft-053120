require "yaml"
require "pry"

# load_library loads a file in the following format:
# {
#     'happy' => {
#        :english => ":)",
#        :japanese => "(＾ｖ＾)"
#     }
#  }
def load_library(file)

  emoticons = YAML.load_file(file)

  # emoticons = YAML.load_file(file) loads the following...
  # {
  #   "angel"=>["O:)", "☜(⌒▽⌒)☞"],
  #   "angry"=>[">:(", "ヽ(ｏ`皿′ｏ)ﾉ"],
  #   ...
  # }

  result = {}

  # Loop through emoticons, and assign keys and values to result
  emoticons.each do |expression, emoticon_array|

    # Set expression (i.e. "angry" as key, and value to empty array )
    result[expression] = {} # example: result = { "angry" => {} }

    # For each expression, give key either :english or :japanese, and set value as the 0th or 1st index element from emotion_array
    result[expression][:english] = emoticon_array[0]
    # example: { "angry" => { :english => "O:)" } }
    result[expression][:japanese] = emoticon_array[1]
    # example: { "angry" => { :english => "O:)", :japanese => "☜(⌒▽⌒)☞" } }
  end

  result
end


# get_japanese_emoticon should returns the given english emoticon translated into the corresponding japanese emoticon
def get_japanese_emoticon(file, english_emoticon)
  load_library(file).each do |expression, emoticon_hash|

    # load_library(file) looks like...
    # {"angel"=>{:english=>"O:)", :japanese=>"☜(⌒▽⌒)☞"},
    #   "angry"=>{:english=>">:(", :japanese=>"ヽ(ｏ`皿′ｏ)ﾉ"},
    #   ...
    # }

    return emoticon_hash[:japanese] if emoticon_hash[:english] == english_emoticon
  end

  # Explicit return this if the above was not found/returned
  "Sorry, that emoticon was not found"

end


# get_english_meaning should return the english expression (i.e. "angel", "angry", etc.) given a japanese emoticon
def get_english_meaning(file, japanese_emoticon)
  load_library(file).each do |expression, emoticon_hash|
    # load_library(file) looks like...
    # {"angel"=>{:english=>"O:)", :japanese=>"☜(⌒▽⌒)☞"},
    #   "angry"=>{:english=>">:(", :japanese=>"ヽ(ｏ`皿′ｏ)ﾉ"},
    #   ...
    # }

    return expression if emoticon_hash[:japanese] == japanese_emoticon
  end

  # Explicit return this if the above was not found/returned
  "Sorry, that emoticon was not found"

end
