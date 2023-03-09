# frozen_string_literal: true

require "test_helper"

class TestFormFor < Minitest::Test
  User = Struct.new(:name, :job, :job2, :gender, keyword_init: true)

  def test_form_for
    user = User.new name: "rob"
    assert_equal '<form action="#" method="post"></form>', 
      HexletCode.form_for(user)
    assert_equal '<form action="/users" method="post"></form>', 
      HexletCode.form_for(user, url: "/users")
    assert_equal '<form action="/groups" method="post"></form>', 
      HexletCode.form_for(user, url: "/groups")
    assert_equal '<form action="#" method="get"></form>', 
      HexletCode.form_for(user, method: "get")
    assert_equal '<form action="#" class="hexlet-form" method="get"></form>', 
      HexletCode.form_for(user, method: "get", class: 'hexlet-form')
  end

  def test_form_for_fields
    user = User.new name: "rob", job: "hexlet", gender: "m"
    form_tag = HexletCode.form_for(user) do |f|
      f.input :name
      f.input :job, as: :text
    end

    assert_equal '<form action="#" method="post"><label for="name">Name</label><input name="name" type="text" value="rob"><label for="job">Job</label><textarea cols="20" name="job" rows="40">hexlet</textarea></form>',
                 form_tag
  end

  def test_form_for_fields_with_class
    user = User.new name: "rob", job: "hexlet", gender: "m"
    form_tag = HexletCode.form_for(user) do |f|
      f.input :name, class: "user-input"
      f.input :job, as: :text
    end

    assert_equal '<form action="#" method="post"><label for="name">Name</label><input class="user-input" name="name" type="text" value="rob"><label for="job">Job</label><textarea cols="20" name="job" rows="40">hexlet</textarea></form>',
                 form_tag
  end

  def test_form_for_fields_with_defaults
    user = User.new name: "rob", job: "hexlet", gender: "m"
    form_tag = HexletCode.form_for(user) do |f|
      f.input :job, as: :text, rows: 50, cols: 50
    end
    assert_equal '<form action="#" method="post"><label for="job">Job</label><textarea cols="50" name="job" rows="50">hexlet</textarea></form>',
                 form_tag
  end

  def test_should_raise_exeption
    user = User.new name: "rob", job: "hexlet", gender: "m"
    assert_raises(StandardError) do
      HexletCode.form_for user, url: "/users" do |f|
        f.input :name
        f.input :job, as: :text
        f.input :age
      end
    end
  end

  def test_form_for_fields_submit
    user = User.new name: "rob", job: "hexlet", gender: "m"
    form_tag = HexletCode.form_for user do |f|
      f.input :name
      f.input :job, as: :text
      f.submit 
    end

    assert_equal '<form action="#" method="post"><label for="name">Name</label><input name="name" type="text" value="rob"><label for="job">Job</label><textarea cols="20" name="job" rows="40">hexlet</textarea><input type="submit" value="Save"></form>',
                 form_tag
  end


  def test_form_for_fields_submit_wow
    user = User.new name: "rob", job: "hexlet", gender: "m"
    form_tag = HexletCode.form_for user do |f|
      f.input :name
      f.input :job, as: :text
      f.submit "WoW"
    end

    assert_equal '<form action="#" method="post"><label for="name">Name</label><input name="name" type="text" value="rob"><label for="job">Job</label><textarea cols="20" name="job" rows="40">hexlet</textarea><input type="submit" value="WoW"></form>', form_tag
  end
end
