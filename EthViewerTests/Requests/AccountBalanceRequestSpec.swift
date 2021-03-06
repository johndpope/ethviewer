//
//  AccountBalanceRequest.swift
//  EthViewerTests
//
//  Created by Elliott Minns on 16/01/2018.
//  Copyright © 2018 Elliott Minns. All rights reserved.
//

import Quick
import Nimble
@testable import EthViewer

class AccountBalanceRequestSpec: QuickSpec {
  override func spec() {
    describe("the account balance request") {
      let request = AccountBalanceRequest(address: "0xmm")
      
      it("should have the correct path") {
        expect(request.path) == "/api"
      }
      
      it("should have the correct baseUrl") {
        expect(request.baseUrl?.absoluteString) == "https://api.etherscan.io"
      }
      
      describe("the build params") {
        let params = request.buildParameters()
        
        it("should have the correct value for address") {
          expect(params["address"] as? String) == "0xmm"
        }
        
        it("should have the correct value for module") {
          expect(params["module"] as? String) == "account"
        }
        
        it("should have the correct value for action") {
          expect(params["action"] as? String) == "balance"
        }
        
        it("should have the correct value for api key") {
          expect(params["apikey"] as? String) == Configuration.main.etherscanApiKey
        }
      }
    }
  }
}
