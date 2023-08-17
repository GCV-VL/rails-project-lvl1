class FieldRenderBase
  attr_reader :field_input, :options

  def initialize(field_input)
    @field_input = field_input
    @options = field_input.build
  end

  def to_html
    result = ''
    field_name = field[:options][:name]
    result += HexletCode::Tag.build('label', for: field_name) { field_name.capitalize } if field[:label]
    result += HexletCode::Tag.build(field[:tag], field[:options].sort.to_h) { field[:body] }
    result
  end
end
