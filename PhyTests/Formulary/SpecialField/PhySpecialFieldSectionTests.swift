//  Created by dasdom on 21.08.19.
//  
//

import XCTest
@testable import Phy

class PhySpecialFieldSectionTests: XCTestCase {

  func test_decode_whenTitleAndSpecialFields() {
    let formulaDict = ["imageName":"baz.png","title":"Baz"]
    let formulaSectionDict: [String:Any] = ["title":"Bar","formulas":[formulaDict]]
    let specialFieldDict: [String:Any] = ["title":"Foo","formulaSections":[formulaSectionDict]]
    let specialFieldSectionDict = ["title":"Bla","specialFields":[specialFieldDict]] as [String : Any]
    let data = try! JSONSerialization.data(withJSONObject: specialFieldSectionDict, options: [])
    
    let result = try! JSONDecoder().decode(SpecialFieldSection.self, from: data)
    
    let formula = Formula(imageName: "baz.png", title: "Baz")
    let formulaSection = FormulaSection(title: "Bar", formulas: [formula])
    let specialField = SpecialField(title: "Foo", formulaSections: [formulaSection])
    let expected = SpecialFieldSection(title: "Bla", specialFields: [specialField])
    XCTAssertEqual(expected, result)
  }
}
