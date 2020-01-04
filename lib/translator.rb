require 'yaml'

def load_library(file_path)
  data = YAML.load_file(file_path)
  hash = {}
  hash[:get_meaning] = {}
  hash[:get_emoticon] = {}
  data.each do |name, emoticons|
    hash[:get_meaning][emoticons[1]] = name
    hash[:get_emoticon][emoticons[0]] = emoticons[1]
  end
  hash
end

def get_japanese_emoticon(file_path, emoticon)
  data = load_library(file_path)
  if data[:get_emoticon][emoticon] == nil
    japanese_emoticon = "Sorry, that emoticon was not found"
  else
    japanese_emoticon = data[:get_emoticon][emoticon]
  end
  japanese_emoticon
end

def get_english_meaning(file_path, emoticon)
  data = load_library(file_path)
  if data[:get_meaning][emoticon] == nil 
    english_meaning = "Sorry, that emoticon was not found"
  else
    english_meaning = data[:get_meaning][emoticon]
  end
end