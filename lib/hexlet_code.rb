# frozen_string_literal: true

module HexletCode
  autoload(:VERSION, 'hexlet_code/version')
  autoload(:Tag, 'hexlet_code/tag')
  autoload(:FormFields, 'hexlet_code/form_fields')
  autoload(:FormFieldsRender, 'hexlet_code/form_fields_render')
  autoload(:FormRender, 'hexlet_code/form_render')

  def self.form_for(model, form_options = {}, &block)
    options = form_options.dup
    options[:action] = form_options.fetch(:url, '#')
    options[:method] = form_options.fetch(:method, 'post')
    options.delete(:url)

    HexletCode::FormRender.new(model, options, &block).to_html
  end
end
