//
//  RecipeUrl.swift
//  Description: RecipeUrlBuilder is able to construct urls for the quickneasy endpoints.
//  The created urls include only path parameters (query parameters are handled elsewhere).
//
//  Created on 12/24/16.
//  Copyright © 2016 LEA. All rights reserved.
//

import Foundation

class RecipeUrl {
    private static var host = "https://quick-n-easy.herokuapp.com"
    private static var getRecipeInformationPath = "/recipes/{id}/information"
    private static var findByIngredientsPath = "/recipes/findByIngredients"
    
    static func prepareRecipeInformationUrl(parameters: [String:AnyObject]) -> String? {
        let url = prepareUrl(getRecipeInformationPath, parameters: parameters)
        return url
    }
    
    static func prepareFindByIngredientsUrl(parameters: [String:AnyObject]) -> String? {
        let url = prepareUrl(findByIngredientsPath, parameters:parameters)
        return url
    }
    
    static func prepareUrl(path: String, parameters: [String:AnyObject]) -> String? {
        var url = host + path
        for (key, value) in parameters {
            url = url.stringByReplacingOccurrencesOfString("{" + key + "}", withString: "\(value)")
        }
        
        return url
    }
}