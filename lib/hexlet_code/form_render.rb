module HexletCode
  class FormRender
    def initialize(model, options, &block)
      @model = model
      @options = options
      @block = block
    end

    def to_html
      HexletCode::Tag.build('form', @options.sort.to_h) do
        if @block
          form_fields = FormFields.new(@model)
          @block.call(form_fields)
          FormFieldsRender.new(form_fields).to_html
        end
      end
    end
  end
end