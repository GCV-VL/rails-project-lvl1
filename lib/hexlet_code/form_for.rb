# frozen_string_literal: true

module HexletCode
    def self.form_for(obj, options = {})
        url = options.fetch(:url, '#')
        HexletCode::Tag.build('form', action:url , method: "post")
    end
end
