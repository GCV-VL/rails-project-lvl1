# frozen_string_literal: true

module HexletCode
  class Tag
    SINGLE_TAGS = %w[br input img].freeze

    def self.build(tag, options = {})
      body = yield if block_given?

      options_string = options.map do |key, value|
        " #{key}=\"#{value}\""
      end.join('')

      
      return "<#{tag}#{options_string}>" if SINGLE_TAGS.include? tag

      "<#{tag}#{options_string}>#{body}</#{tag}>"
    end
  end
end
