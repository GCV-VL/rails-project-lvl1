# frozen_string_literal: true

require "test_helper"

class TestFormFor < Minitest::Test
    class User < Struct.new(:name, :job, keyword_init: true)
    end

    def test_form_for
        user = User.new name: 'rob'
        assert_equal '<form action="#" method="post"></form>', HexletCode.form_for(user)
        assert_equal '<form action="/users" method="post"></form>', HexletCode.form_for(user, url: '/users')
        assert_equal '<form action="/groups" method="post"></form>', HexletCode.form_for(user, url: '/groups')
    end

    def test_form_for_fields
        user = User.new name: 'rob', job: 'hexlet', gender: 'm'
        asssert_equal '<form action="#" method="post"> <input name="name" type="text" value="rob"> <textarea name="job" cols="20" rows="40">hexlet</textarea> </form>', HexletCode.form_for(user)

    end


end
