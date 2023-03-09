# frozen_string_literal: true

module HexletCode
  def self.form_for(model, form_options = {})
    form_options[:action] = form_options.fetch(:url, '#')
    form_options[:method] = form_options.fetch(:method, 'post')
    form_options.delete(:url)

    form_body = if block_given?
                  form_fields = FormFields.new(model)
                  yield(form_fields)
                  form_fields.to_html

                end

    HexletCode::Tag.build('form', form_options.sort.to_h) { form_body }
  end

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
      @tags << HexletCode::Tag.build('input', type: 'submit', value:)
    end

    def to_html
      @tags.join
    end
  end
end
