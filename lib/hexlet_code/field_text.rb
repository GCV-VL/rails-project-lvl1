# frozen_string_literal: true

require 'hexlet_code/field_base'

class FieldText < FieldBase
  def build
    options = { cols: '20', rows: '40' }.merge(input_options)
    { tag: 'textarea', options:, body: value, label: true }
  end
end
