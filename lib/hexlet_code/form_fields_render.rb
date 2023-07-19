# frozen_string_literal: true

module HexletCode
  class FormFieldsRender
    def initialize(form_fields)
      @form_fields = form_fields
    end

    def to_html
      @form_fields.fields.map do |field|
        result = ''
        field_name = field[:options][:name]
        result += HexletCode::Tag.build('label', for: field_name) { field_name.capitalize } if field[:label]
        result += HexletCode::Tag.build(field[:tag], field[:options].sort.to_h) { field[:body] }
        result
      end.join('')
    end
  end
end
