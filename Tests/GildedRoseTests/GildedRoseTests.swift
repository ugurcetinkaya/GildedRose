import XCTest
import class Foundation.Bundle
@testable import GildedRose

class GildedRoseTests: XCTestCase {

    func testAgedBrieIncreaseQuality() {
        let item = Item(name: "Aged Brie", sellIn: 2, quality: 0)
        let app = GildedRose(items: [item])
        app.updateQuality()
        
        XCTAssertEqual(app.items.first?.sellIn, 1)
        XCTAssertEqual(app.items.first?.quality, 1)
    }
    
    func testAgedBrieIncreaseTwiceQuality() {
        let item = Item(name: "Aged Brie", sellIn: -1, quality: 0)
        let app = GildedRose(items: [item])
        app.updateQuality()
        
        XCTAssertEqual(app.items.first?.sellIn, -2)
        XCTAssertEqual(app.items.first?.quality, 2)
    }
    
    func testNormalItemDegradeQuality() {
        let item = Item(name: "+5 Dexterity Vest", sellIn: 10, quality: 20)
        let app = GildedRose(items: [item])
        app.updateQuality()
        
        XCTAssertEqual(app.items.first?.sellIn, 9)
        XCTAssertEqual(app.items.first?.quality, 19)
    }
    
    func testNormalItemDegradeTwiceQuality() {
        let item = Item(name: "+5 Dexterity Vest", sellIn: -1, quality: 20)
        let app = GildedRose(items: [item])
        app.updateQuality()
        
        XCTAssertEqual(app.items.first?.sellIn, -2)
        XCTAssertEqual(app.items.first?.quality, 18)
    }
    
    func testSulfurasQuality() {
        let item = Item(name: "Sulfuras, Hand of Ragnaros", sellIn: 0, quality: 80)
        let app = GildedRose(items: [item])
        app.updateQuality()
        
        XCTAssertEqual(app.items.first?.sellIn, 0)
        XCTAssertEqual(app.items.first?.quality, 80)
    }
    
    func testBackstageQualityForMoreThan10Days() {
        let item = Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 15, quality: 21)
        let app = GildedRose(items: [item])
        app.updateQuality()
        
        XCTAssertEqual(app.items.first?.sellIn, 14)
        XCTAssertEqual(app.items.first?.quality, 22)
    }
    
    func testBackstageQualityForBetween6to10Days() {
        let item = Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 10, quality: 11)
        let app = GildedRose(items: [item])
        app.updateQuality()
        
        XCTAssertEqual(app.items.first?.sellIn, 9)
        XCTAssertEqual(app.items.first?.quality, 13)
    }
    
    func testBackstageQualityForBetween1to5Days() {
        let item = Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 5, quality: 10)
        let app = GildedRose(items: [item])
        app.updateQuality()
        
        XCTAssertEqual(app.items.first?.sellIn, 4)
        XCTAssertEqual(app.items.first?.quality, 13)
    }
    
    func testBackstageQualityForLessThan1Day() {
        let item = Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 0, quality: 22)
        let app = GildedRose(items: [item])
        app.updateQuality()
        
        XCTAssertEqual(app.items.first?.sellIn, -1)
        XCTAssertEqual(app.items.first?.quality, 0)
    }
    
    func testConjuredDegradeQuality() {
        let item = Item(name: "Conjured Mana Cake", sellIn: 10, quality: 20)
        let app = GildedRose(items: [item])
        app.updateQuality()
        
        XCTAssertEqual(app.items.first?.sellIn, 9)
        XCTAssertEqual(app.items.first?.quality, 18)
    }
    
    func testConjuredDegradeTwiceQuality() {
        let item = Item(name: "Conjured Mana Cake", sellIn: -1, quality: 20)
        let app = GildedRose(items: [item])
        app.updateQuality()
        
        XCTAssertEqual(app.items.first?.sellIn, -2)
        XCTAssertEqual(app.items.first?.quality, 16)
    }
    
    func testMaxQuality() {
        let item = Item(name: "Aged Brie", sellIn: -1, quality: 49)
        let app = GildedRose(items: [item])
        app.updateQuality()
        
        XCTAssertEqual(app.items.first?.sellIn, -2)
        XCTAssertEqual(app.items.first?.quality, 50)
    }
    
    func testMinQuality() {
        let item = Item(name: "+5 Dexterity Vest", sellIn: -1, quality: 1)
        let app = GildedRose(items: [item])
        app.updateQuality()
        
        XCTAssertEqual(app.items.first?.sellIn, -2)
        XCTAssertEqual(app.items.first?.quality, 0)
    }
    
    static var allTests : [(String, (GildedRoseTests) -> () throws -> Void)] {
        return [
            ("testAgedBrieIncreaseQuality", testAgedBrieIncreaseQuality),
            ("testAgedBrieIncreaseTwiceQuality", testAgedBrieIncreaseTwiceQuality),
            ("testNormalItemDegradeQuality", testNormalItemDegradeQuality),
            ("testNormalItemDegradeTwiceQuality", testNormalItemDegradeTwiceQuality),
            ("testSulfurasQuality", testSulfurasQuality),
            ("testBackstageQualityForMoreThan10Days", testBackstageQualityForMoreThan10Days),
            ("testBackstageQualityForBetween6to10Days", testBackstageQualityForBetween6to10Days),
            ("testBackstageQualityForBetween1to5Days", testBackstageQualityForBetween1to5Days),
            ("testBackstageQualityForLessThan1Day", testBackstageQualityForLessThan1Day),
            ("testMaxQuality", testMaxQuality),
            ("testMinQuality", testMinQuality),
            ("testConjuredDegradeQuality", testConjuredDegradeQuality),
            ("testConjuredDegradeTwiceQuality", testConjuredDegradeTwiceQuality)
        ]
    }
}
