module HexletCode
    class Tag
        def self.build(tag, options = {}) 
            if tag == 'br'
                '<br>'
            elsif tag == 'img'
                "<img scr=\"#{options[:scr]}\">"
            elsif tag == 'input'
                "<input type=\"#{options[:type]}\" value=\"#{options[:value]}\">"
            elsif tag == 'label'
                "<label>#{options[:email]}</label>"
            elsif tag == 'div'
                "<div></div>"
            end
        end
    end
end