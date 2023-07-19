# frozen_string_literal: true

class FieldBase
  attr_reader :model, :field_name, :input_options

  def initialize(model, field_name, input_options)
    @model = model
    @field_name = field_name
    @input_options = input_options
  end
end
