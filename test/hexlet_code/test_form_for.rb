# frozen_string_literal: true

require "test_helper"

class TestFormFor < Minitest::Test
    class User < Struct.new(:name, :job, :job2, :gender, keyword_init: true)
    end

    def test_form_for
        user = User.new name: 'rob'
        assert_equal '<form action="#" method="post"></form>', HexletCode.form_for(user)
        assert_equal '<form action="/users" method="post"></form>', HexletCode.form_for(user, url: '/users')
        assert_equal '<form action="/groups" method="post"></form>', HexletCode.form_for(user, url: '/groups')
    end

    def test_form_for_fields
        user = User.new name: 'rob', job: 'hexlet', gender: 'm'
        form_tag = HexletCode.form_for(user) do |f|
            f.input :name
            f.input :job, as: :text
        end

        assert_equal '<form action="#" method="post"><input name="name" type="text" value="rob"><textarea name="job" cols="20" rows="40">hexlet</textarea></form>',
        form_tag

    end

    def test_form_for_fields_with_class
        user = User.new name: 'rob', job: 'hexlet', gender: 'm'
        form_tag = HexletCode.form_for(user) do |f|
            f.input :name, class: 'user-input'
            f.input :job, as: :text
        end

        assert_equal '<form action="#" method="post"><input name="name" type="text" value="rob"><textarea name="job" cols="20" rows="40">hexlet</textarea></form>',
        form_tag

    end

    def test_form_for_fields_with_defaults
        user = User.new name: 'rob', job: 'hexlet', gender: 'm'
        form_tag = HexletCode.form_for(user) do |f|
            f.input :job, as: :text, rows: 50, cols: 50
        end
        assert_equal '<form action="#" method="post"><textarea name="job" cols="50" rows="50">hexlet</textarea></form>',
        form_tag

    end

    def test_should_raise_exeption
        user = User.new name: 'rob', job: 'hexlet', gender: 'm'
        assert_raises(StandardError) do
          HexletCode.form_for user, url: '/users' do |f|
            f.input :name
            f.input :job, as: :text
            f.input :age
          end
        end
    end
end