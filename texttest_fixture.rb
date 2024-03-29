#!/usr/bin/ruby -w

require File.join(File.dirname(__FILE__), 'gilded_rose')
require File.join(File.dirname(__FILE__), 'item')

puts "OMGHAI!"
items = [
  Item.new(name=GildedRose::NAMES[:DEXTERITY], sell_in=10, quality=20),
  Item.new(name=GildedRose::NAMES[:AGED_BRIE], sell_in=2, quality=0),
  Item.new(name=GildedRose::NAMES[:ELIXIR], sell_in=5, quality=7),
  Item.new(name=GildedRose::NAMES[:SULFURAS], sell_in=0, quality=80),
  Item.new(name=GildedRose::NAMES[:SULFURAS], sell_in=-1, quality=80),
  Item.new(name=GildedRose::NAMES[:BACKSTAGE_PASS], sell_in=15, quality=20),
  Item.new(name=GildedRose::NAMES[:BACKSTAGE_PASS], sell_in=10, quality=49),
  Item.new(name=GildedRose::NAMES[:BACKSTAGE_PASS], sell_in=5, quality=49),
  # This Conjured item does not work properly yet
  Item.new(name=GildedRose::NAMES[:CONJURED], sell_in=3, quality=6), # <-- :O

]

days = 2
if ARGV.size > 0
  days = ARGV[0].to_i + 1
end

gilded_rose = GildedRose.new items
(0...days).each do |day|
  puts "-------- day #{day} --------"
  puts "name, sellIn, quality"
  items.each do |item|
    puts item
  end
  puts ""
  gilded_rose.update_quality
end
