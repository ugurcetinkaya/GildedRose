public class GildedRose {
    
    private static let maxQuality = 50
    private static let minQuality = 0
    
    var items:[Item]
    
    required public init(items:[Item]) {
        self.items = items
    }
    
    public func updateQuality() {
        for item in items {
            switch item.name {
            case "Aged Brie":
                updateAgedBrieQuality(with: item)
            case "Sulfuras, Hand of Ragnaros":
                continue
            case "Backstage passes to a TAFKAL80ETC concert":
                updateBackstageQuality(with: item)
            case "Conjured Mana Cake":
                updateConjuredQuality(with: item)
            default:
                updateNormalQuality(with: item)
            }
        }
    }
    
    func updateAgedBrieQuality(with item: Item) {
        item.quality = item.sellIn > 0 ? item.quality + 1 : item.quality + 2
        validateQuality(with: &item.quality)
        
        item.sellIn -= 1
    }

    func updateBackstageQuality(with item: Item) {
        if item.sellIn > 10 {
            item.quality += 1
        }
        if 6...10 ~= item.sellIn {
            item.quality += 2
        }
        if 1...5 ~= item.sellIn {
            item.quality += 3
        }
        if item.sellIn <= 0 {
            item.quality = 0
        }
        validateQuality(with: &item.quality)
        
        item.sellIn -= 1
    }
    
    func updateConjuredQuality(with item: Item) {
        item.quality = item.sellIn > 0 ? item.quality - 2 : item.quality - 4
        validateQuality(with: &item.quality)
        
        item.sellIn -= 1
    }
    
    func updateNormalQuality(with item: Item) {
        item.quality = item.sellIn > 0 ? item.quality - 1 : item.quality - 2
        validateQuality(with: &item.quality)
        
        item.sellIn -= 1
    }
    
    private func validateQuality(with quality: inout Int) {
        if quality > GildedRose.maxQuality {
            quality = GildedRose.maxQuality
        }
        if quality < GildedRose.minQuality {
            quality = GildedRose.minQuality
        }
    }
}
