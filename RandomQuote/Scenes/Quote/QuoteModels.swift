//
//  QuoteModels.swift
//  RandomQuote
//
//  Created by Ravi kumar on 07/08/20.
//  Copyright (c) 2020 Ravi kumar. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum RandomQuote
{
    // MARK: Fetch and updating quote
    
    enum Fetch
    {
        struct Request
        {
        }
        struct UpdateFavouriteRequest
        {
            var id: String
            var isFav: Bool?
        }
        struct Response
        {
            var err:Error?
            var quote:Quote?
        }
        struct ViewModel
        {
            var id: String?
            var quote: String?
            var author: String?
            var isFavourite: Bool?
            var isRecentQuote: Bool?
            var errorMessage: String?
        }
    }
    
    // MARK: Model to handle if Favourites option needed to show
    
    enum ShowFavouriteOption {
        struct Request{}
        struct Response
        {
            var hideFavourites:Bool
            var id:String
        }
        struct ViewModel
        {
            var hideFavourites:Bool
            var id:String
        }
    }
}

