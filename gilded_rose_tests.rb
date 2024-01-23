require 'minitest/autorun'
require_relative 'gilded_rose'

class TestGildedRose < Minitest::Test
  def test_foo
    item_name = 'foo'
    items = [Item.new(item_name, 0, 0)]
    GildedRose.new(items).update_quality()
    assert_equal item_name, items[0].name
  end
end
