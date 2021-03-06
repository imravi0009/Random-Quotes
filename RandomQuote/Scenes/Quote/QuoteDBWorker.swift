//
//  QuoteDBWorker.swift
//  RandomQuote
//
//  Created by Ravi kumar on 08/08/20.
//  Copyright (c) 2020 Ravi kumar. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

class QuoteDBWorker
{
    private  let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    func addQuoteInDB(json:[String:String]) -> Quote? {
        return QuoteCoreDataStore(context: context).addQuote(quoteJson: json)
    }
    
    func updateQuote(id:String, isFav:Bool)-> Quote? {
        return QuoteCoreDataStore(context: context).updateQuoteFavouriteStatus(id: id, isFav: isFav)
    }
    
    func getQuote(id:String)-> Quote? {
        return QuoteCoreDataStore(context: context).fetchtQoute(id: id)
    }
    
    func getRecentCachedQuote()-> Quote? {
        return QuoteCoreDataStore(context: context).fetchRecentQoute()
    }
}
