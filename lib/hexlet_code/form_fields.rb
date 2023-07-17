# frozen_string_literal: true

module HexletCode
  class FormFields
    attr_reader :fields

    def initialize(model)
      @fields = []
      @model = model
    end

    def input(field_name, input_options = {})
      options = input_options.dup
      options[:name] = field_name
      as = options.delete(:as)

      if as
        build_textarea(field_name, options)
      else
        build_input(field_name, options)
      end
    end

    def build_textarea(field_name, input_options)
      options = { cols: '20', rows: '40' }.merge(input_options)
      @fields << { tag: 'textarea', options: options, body: @model.public_send(field_name), label: true }
    end

    def build_input(field_name, input_options)
      options = { type: 'text', value: @model.public_send(field_name) }.merge(input_options)
      @fields << { tag: 'input', options: options, body: nil, label: true }
    end

    def submit(value = 'Save')
      @fields << { tag: 'input', options: { type: 'submit', value: value }, body: nil, label: false }
    end
  end
end
