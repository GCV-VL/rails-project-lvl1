# frozen_string_literal: true

require 'hexlet_code/field_base'

class FieldInput < FieldBase
  def build
    options = { type: 'text', value: @model.public_send(field_name) }.merge(input_options)
    { tag: 'input', options:, body: nil, label: true }
  end
end
