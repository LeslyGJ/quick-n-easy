//
//  RecipeCall.swift
//  Description: RecipeCall is able to retrieve json data from the quickneasy recipe endpoints.
//
//  Created on 12/24/16.
//  Copyright © 2016 LEA. All rights reserved.
//

import Foundation
import Alamofire

class RecipeCall {
    
    // Returns json data from a request to the getRecipeInformation endpoint.
    func getRecipeInformation(pathParameters: [String:AnyObject],
                              queryParameters: [String:AnyObject]?,
                              completionHandler: (Any) -> Void) {
        
        if let url = RecipeUrl.prepareRecipeInformationUrl(pathParameters) {
            let request = Alamofire.request(.GET, url, parameters: queryParameters)
            completeRequest(request, completionHandler: completionHandler)
        }
    }
    
    // Return json data from a request to the findByIngredients endpoint.
    func findByIngredients(pathParameters: [String:AnyObject],
                           queryParameters: [String:AnyObject]?,
                           completionHandler: (Any) -> Void ) {
        
        if let url = RecipeUrl.prepareFindByIngredientsUrl(pathParameters) {
            let request = Alamofire.request(.GET, url, parameters: queryParameters)
            completeRequest(request, completionHandler: completionHandler)
        }
    }
    
    // Returns the json data from an Alamofire request
    private func completeRequest(request: Request,
                                 completionHandler: (Any) -> Void ) {
        
        request.responseJSON { response in
            switch response.result {
            case .Success(let value):
                completionHandler(value)
            case .Failure(let error):
                print("Resulted in an error: \(error)")
            }
        }
    }
}
