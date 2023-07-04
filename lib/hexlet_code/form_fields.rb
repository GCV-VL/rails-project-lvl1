# frozen_string_literal: true

module HexletCode
  class FormFields
    def initialize(model)
      @tags = []
      @model = model
    end

    def input(field_name, input_options = {})
      input_options[:name] = field_name

      @tags << HexletCode::Tag.build('label', for: field_name) { field_name.capitalize }

      if input_options.delete(:as)
        build_textarea(field_name, input_options)
      else
        build_input(field_name, input_options)
      end
    end

    def build_textarea(field_name, input_options)
      input_options = { cols: '20', rows: '40' }.merge(input_options)
      @tags << HexletCode::Tag.build('textarea', input_options.sort.to_h) { @model.public_send(field_name) }
    end

    def build_input(field_name, input_options)
      input_options[:type] = 'text'
      input_options[:value] = @model.public_send(field_name)
      @tags << HexletCode::Tag.build('input', input_options.sort.to_h)
    end

    def submit(value = 'Save')
      @tags << HexletCode::Tag.build('input', type: 'submit', value: value)
    end

    def to_html
      @tags.join
    end
  end
end
