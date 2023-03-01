# frozen_string_literal: true

module HexletCode
  def self.form_for(model, options = {})
    url = options.fetch(:url, "#")

    form_body = if block_given?
                  form_fields = FormFields.new(model)
                  yield(form_fields)
                  form_fields.to_html

                end
    HexletCode::Tag.build("form", action: url, method: "post") { form_body }
  end

  class FormFields
    def initialize(model)
      @tags = []
      @model = model
    end

    def input(field_name, options = {})
      default_options = { cols: "20", rows: "40" }
      if options.delete(:as)
        merged_options = default_options.merge(options)
        build_line = { name: field_name }.merge(merged_options)
        @tags << HexletCode::Tag.build("label", for: field_name) { field_name.capitalize }
        @tags << HexletCode::Tag.build("textarea", build_line) { @model[field_name] }
      else
        @tags << HexletCode::Tag.build("label", for: field_name) { field_name.capitalize }
        @tags << HexletCode::Tag.build("input", name: field_name, type: "text", value: @model[field_name])
      end
    end

    def submit
      @tags << HexletCode::Tag.build("input", type: "submit", value: "Save")
    end

    def to_html
      @tags.join
    end
  end
end
