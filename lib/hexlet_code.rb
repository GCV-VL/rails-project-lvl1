# frozen_string_literal: true

module HexletCode
  autoload(:VERSION, 'hexlet_code/version')
  autoload(:Tag, 'hexlet_code/tag')
  autoload(:FormFields, 'hexlet_code/form_fields')

  def self.form_for(model, form_options = {})
    options = form_options.dup
    options[:action] = form_options.fetch(:url, '#')
    options[:method] = form_options.fetch(:method, 'post')
    options.delete(:url)

    form_body = if block_given?
                  form_fields = FormFields.new(model)
                  yield(form_fields)
                  form_fields.to_html

                end

    HexletCode::Tag.build('form', options.sort.to_h) { form_body }
  end
end
