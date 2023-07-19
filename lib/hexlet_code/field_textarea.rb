class FieldTextarea < FieldBase
  def build
    options = { cols: '20', rows: '40' }.merge(input_options)
    { tag: 'textarea', options: options, body: @model.public_send(field_name), label: true }
  end
end