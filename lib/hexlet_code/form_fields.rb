# frozen_string_literal: true

module HexletCode
  class FormFields
    def initialize(model)
      @tags = []
      @model = model
    end

    def input(field_name, input_options = {})
      as = input_options[:as]
      options = input_options.except(:as)
      options[:name] = field_name

      @tags << HexletCode::Tag.build('label', for: field_name) { field_name.capitalize }

      if as
        build_textarea(field_name, options)
      else
        build_input(field_name, options)
      end
    end

    def build_textarea(field_name, input_options)
      options = { cols: '20', rows: '40' }.merge(input_options)
      @tags << HexletCode::Tag.build('textarea', options.sort.to_h) { @model.public_send(field_name) }
    end

    def build_input(field_name, input_options)
      options = { type: 'text', value: @model.public_send(field_name) }.merge(input_options)
      @tags << HexletCode::Tag.build('input', options.sort.to_h)
    end

    def submit(value = 'Save')
      @tags << HexletCode::Tag.build('input', type: 'submit', value: value)
    end

    def to_html
      @tags.join
    end
  end
end
