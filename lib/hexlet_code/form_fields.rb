# frozen_string_literal: true

require 'hexlet_code/field_input'
require 'hexlet_code/field_text'

module HexletCode
  class FormFields
    attr_reader :fields

    FIELD_TYPES = { text: FieldText }.freeze

    def initialize(model)
      @fields = []
      @model = model
    end

    def input(field_name, input_options = {})
      options = input_options.dup
      options[:name] = field_name
      as = options.delete(:as) || ''

      value = @model.public_send(field_name)

      @fields << if FIELD_TYPES[as.to_sym]
                   FIELD_TYPES[as.to_sym].new(field_name, value, options).build
                 else
                   FieldInput.new(field_name, value, options).build
                 end
    end

    def submit(value = 'Save')
      @fields << { tag: 'input', options: { type: 'submit', value: }, body: nil, label: false }
    end
  end
end
