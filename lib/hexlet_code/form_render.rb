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
          f = FormFields.new(@model)
          @block.call(f)
          FormFieldsRender.new(f).to_html
        end
      end
    end
  end
end