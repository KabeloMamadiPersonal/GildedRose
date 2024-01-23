require 'rspec'

require File.join(File.dirname(__FILE__), 'gilded_rose')
require File.join(File.dirname(__FILE__), 'item')

describe GildedRose do
  it "does not change the name" do
    item_name = 'foo'
    items = [Item.new(item_name, 0, 0)]
    GildedRose.new(items).update_quality()
    expect(items[0].name).to eq item_name
  end
end
