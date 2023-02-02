# frozen_string_literal: true

require "test_helper"

class TestHexletCode < Minitest::Test
  def test_tag_br
    assert_equal '<br>', HexletCode::Tag.build('br')
  end

  def test_tag_img
    assert_equal '<img scr="path">', HexletCode::Tag.build('img', scr: 'path')
  end

  def test_tag_input
    assert_equal '<input type="submit" value="Save">', HexletCode::Tag.build('input', type: 'submit', value: 'Save')
    assert_equal '<input type="submit">', HexletCode::Tag.build('input', type: 'submit')
  end

  def test_tag_label
    assert_equal '<label>Email</label>', HexletCode::Tag.build('label') { 'Email' }
  end

  def test_tag_label_with_for
    assert_equal '<label for="email">Email</label>', HexletCode::Tag.build('label', for: 'email') { 'Email' }
  end

  def test_tag_div
    assert_equal '<div></div>', HexletCode::Tag.build('div')
  end
end
