//
//  testChalkboardTests.swift
//  testChalkboardTests
//
//  Created by Gerard Riera  on 24/01/2021.
//

import XCTest
@testable import testChalkboard

class testChalkboardTests: XCTestCase {

    func testStrings() {
        XCTAssertEqual("home_vc.title".localized, "Birthdays")
        XCTAssertEqual("detail_vc.title".localized, "Detail")
        XCTAssertEqual("detail.back".localized, "GO BACK")
        XCTAssertEqual("error.generic".localized, "Something went wrong...")
        XCTAssertEqual("error.retry".localized, "Retry")
        XCTAssertEqual("error.ok".localized, "OK")
    }
        
    func testAPIRouter() {
        XCTAssertTrue(APIRouter.birthdays.asURLRequest() != nil)
    }
    
    func testPath() {
        XCTAssertEqual(kBaseURL, "https://randomuser.me")
        XCTAssertEqual(kApiPath, "/api/")
    }

    func testRequestObject() {
        let expectations = self.expectation(description: "Request object performance check")
        
        APIClient.shared.requestObject(router: APIRouter.birthdays) { (result: Result<BirthdaysRoot,Error>) in
            XCTAssertNotNil(result)
            expectations.fulfill()
        }
        
        self.waitForExpectations(timeout: 10) {error in
            if let error = error {
                XCTFail("\(error)")
            }
        }
    }
}
