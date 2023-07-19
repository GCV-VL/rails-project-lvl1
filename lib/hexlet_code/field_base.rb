# frozen_string_literal: true

class FieldBase
  attr_reader :field_name, :input_options

  def initialize(field_name, input_options)
    @field_name = field_name
    @input_options = input_options
  end
end
