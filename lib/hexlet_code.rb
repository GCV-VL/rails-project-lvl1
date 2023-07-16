# frozen_string_literal: true

require_relative 'hexlet_code/version'
require_relative 'hexlet_code/tag'
require_relative 'hexlet_code/form_fields'

module HexletCode
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
