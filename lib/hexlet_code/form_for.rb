# frozen_string_literal: true

module HexletCode
  def self.form_for(model, options = {})
    merged_options = options
    method = options.fetch(:method, 'post')
    url = options.fetch(:url, "#")


    form_body = if block_given?
                  form_fields = FormFields.new(model)
                  yield(form_fields)
                  form_fields.to_html

                end
    HexletCode::Tag.build("form", action: url, method: method) { form_body }
  end

  class FormFields
    def initialize(model)
      @tags = []
      @model = model
    end

    def input(field_name, options = {})
      merged_options = options
      merged_options[:name] = field_name

      if options.delete(:as)
        merged_options = { cols: "20", rows: "40" }.merge(merged_options)
        @tags << HexletCode::Tag.build("label", for: field_name) { field_name.capitalize }
        @tags << HexletCode::Tag.build("textarea", merged_options) { @model.public_send(field_name) }
      else
        @tags << HexletCode::Tag.build("label", for: field_name) { field_name.capitalize }
        merged_options[:type] = "text"
        merged_options[:value] = @model.public_send(field_name)
        merged_options[:class] = "hexlet-form"
        @tags << HexletCode::Tag.build("input", merged_options)
      end
    end

    def submit(value = 'Save')
      @tags << HexletCode::Tag.build("input", type: "submit", value: value)
    end

    def to_html
      @tags.join
    end
  end
end
