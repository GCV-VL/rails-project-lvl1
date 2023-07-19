class FieldInput < FieldBase
  def build
    options = { type: 'text', value: @model.public_send(field_name) }.merge(input_options)
    { tag: 'input', options: options, body: nil, label: true }
  end
end