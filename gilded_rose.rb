class GildedRose

NAMES = {
  'DEXTERITY': '+5 Dexterity Vest',
  'AGED_BRIE': 'Aged Brie',
  'BACKSTAGE_PASS': 'Backstage passes to a TAFKAL80ETC concert',
  'SULFURAS': 'Sulfuras, Hand of Ragnaros',
  'ELIXIR': 'Elixir of the Mongoose',
  'CONJURED': 'Conjured Mana Cake'
}.freeze

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      if item.name != NAMES[:AGED_BRIE] && item.name != NAMES[:BACKSTAGE_PASS]
        item.quality -= 1 if item.quality > 0 && item.name != NAMES[:SULFURAS]
      else
        if item.quality < 50
          item.quality += 1
          if item.name == NAMES[:BACKSTAGE_PASS]
            item.quality += 1 if item.sell_in < 11 && item.quality < 50
            item.quality += 1 if item.sell_in < 6 && item.quality < 50
          end
        end
      end
      item.sell_in -= 1 if item.name != NAMES[:SULFURAS]
      if item.sell_in < 0
        if item.name != NAMES[:AGED_BRIE]
          if item.name != NAMES[:BACKSTAGE_PASS]
            item.quality -= 1 if item.quality > 0 && item.name != NAMES[:SULFURAS]
          else
            item.quality = item.quality - item.quality
          end
        else
          item.quality += 1 if item.quality < 50
        end
      end
    end
  end
end
