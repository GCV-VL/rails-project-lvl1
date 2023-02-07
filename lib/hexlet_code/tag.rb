# frozen_string_literal: true

module HexletCode
  class Tag
    SINGLE_TAGS = %w[br input img].freeze

    def self.build(tag, options = {})
      body = (yield if block_given?)

      options_string = options.keys.map do |key|
        "#{key}=\"#{options[key]}\""
      end.join(" ")

      options_string = " #{options_string}" unless options_string.empty?
      if SINGLE_TAGS.include? tag
        "<#{tag}#{options_string}>"
      else
        "<#{tag}#{options_string}>#{body}</#{tag}>"
      end
    end
  end
end
