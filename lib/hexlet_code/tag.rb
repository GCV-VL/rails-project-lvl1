module HexletCode
    class Tag
        def self.build(tag, options = {}, &body)
        options_string = options.keys.map do |key|
            "#{key}=\"#{options[key]}\""
        end.join(' ')
        puts options_string
            if tag == 'br'
                '<br>'
            elsif tag == 'img'
                "<img #{options_string}>"
            elsif tag == 'input'
                "<input #{options_string}>"
            elsif tag == 'label'
                if block_given?
                    if options[:for]
                        "<label #{options_string}>#{body.call}</label>"
                    else
                        "<label>#{body.call}</label>"
                    end
                else
                    "<label></label>"
                end
            elsif tag == 'div'
                "<div></div>"
            end
        end
    end
end