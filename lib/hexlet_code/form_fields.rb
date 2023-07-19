# frozen_string_literal: true

module HexletCode
  class FormFields
    attr_reader :fields

    FIELD_TYPES = { text: FieldTextarea }.freeze

    def initialize(model)
      @fields = []
      @model = model
    end

    def input(field_name, input_options = {})
      options = input_options.dup
      options[:name] = field_name
      as = options.delete(:as)

      if FIELD_TYPES[as.to_sym]
        @fields << FIELD_TYPES[as.to_sym].new(@model, field_name, options).build
      else
        @fields << FieldInput.new(@model, field_name, options).build
      end
    end

    def submit(value = 'Save')
      @fields << { tag: 'input', options: { type: 'submit', value: value }, body: nil, label: false }
    end
  end
end
