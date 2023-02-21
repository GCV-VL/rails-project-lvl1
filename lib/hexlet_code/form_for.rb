# frozen_string_literal: true

module HexletCode
    def self.form_for(obj, options = {})
        url = options.fetch(:url, '#')

        form_body = if block_given?
            form_fields = FormFields.new(obj)
            yield(form_fields)
            form_fields.to_html

        end
        HexletCode::Tag.build('form', action:url , method: "post") {form_body}
    end

    class FormFields
        def initialize(obj)
        @fields = []
        @obj = obj

        end


        def input(field_name, options = {})
            if options[:as]
                @fields << HexletCode::Tag.build('textarea', name: field_name, cols: (@obj[field_name] || 'cols="20"'), rows: @obj[field_name]) {@obj[field_name]}
            else
                @fields << HexletCode::Tag.build('input', name: field_name, type: 'text', value: @obj[field_name])
            end
        end

        def to_html
            @fields.join
        end


    end

end

