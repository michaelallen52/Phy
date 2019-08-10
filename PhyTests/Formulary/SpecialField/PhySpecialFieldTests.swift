//  Created by dasdom on 04.08.19.
//  
//

import XCTest
@testable import Phy

class PhySpecialFieldTests: XCTestCase {

    func test_decode_whenTitleAndFormulaSections_decodes() {
        let formulaDict = ["imageName":"baz.png","title":"Baz"]
        let formulaSectionDict: [String:Any] = ["title":"Bar","formulas":[formulaDict]]
        let specialFieldDict: [String:Any] = ["title":"Foo","formulaSections":[formulaSectionDict]]
        let data = try! JSONSerialization.data(withJSONObject: specialFieldDict, options: [])

        let result = try! JSONDecoder().decode(PhySpecialField.self, from: data)

        let formula = PhyFormula(imageName: "baz.png", title: "Baz")
        let formulaSection = PhyFormulaSection(title: "Bar", formulas: [formula])
        let expected = PhySpecialField(title: "Foo", formulaSections: [formulaSection])
        XCTAssertEqual(expected, result)
    }

}