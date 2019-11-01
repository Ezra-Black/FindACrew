//
//  PersonController.swift
//  FindACrew
//
//  Created by Joseph Rogers on 10/31/19.
//  Copyright © 2019 Joseph Rogers. All rights reserved.
//

import Foundation

//used to control and manage the people we get from the API. it holds the models

class PersonController {
    
    //MARK: Properties
    
    var people: [Person] = []
    
    
    
    //MARK: Networking
    
    let baseURL = URL(string: "http swapi.co/api/people")! //unwrap this later
    
    //MARK: Neworking Actions
    
     //pull together requiremenets for the request. fetch data from the ENDPOINT.
    func searchForPeopleWith(searchTerm: String, completion: @escaping () -> Void) {
       
        //allows us to build up a longer URL based on different pieces.
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        //this is accessing what the items paramaters are in the api. the value is what you need on the other side of the = sign.
        let searchTermQueryItem = URLQueryItem(name: "search", value: searchTerm)
        //query item equals the search term
        urlComponents?.queryItems = [searchTermQueryItem]
        //if were able to get a URL, we are going to be able to use it in the following of our code. this is where the URL is finalized.
        guard let requestURL = urlComponents?.url else {
            //so we can see what happened. requests should look like http swapi.co/api/people/?search=[searchTerm]
            print("request URL is nil")
            //informs our UI that we our done
            completion()
            //return so we stop continuing. we exit the scope.
            return
        }
        //this makes our url request. so we can specify what kind of request we are making.
        var request = URLRequest(url: requestURL)
        request.httpMethod =
    }
    
}
