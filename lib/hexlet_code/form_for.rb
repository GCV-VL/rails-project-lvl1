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
                default_values = {cols: '20', rows: '40'}
                options = options.reject {|k,v| k == :as}
                merged_params = default_values.merge(options)

                build_line = ({name: field_name}).merge(merged_params)
                @fields << HexletCode::Tag.build('textarea', build_line) {@obj[field_name]}
            else
                @fields << HexletCode::Tag.build('input', name: field_name, type: 'text', value: @obj[field_name])
            end
        end

        def to_html
            @fields.join
        end

        def submit(value = 'Save')
            @fields << Elements::Submit.new(value)
        end


        def submit(value = 'Save', **attrs)
            @elements << Elements::InputElement.new(value, type: 'submit', **attrs)
        end

   end

end

