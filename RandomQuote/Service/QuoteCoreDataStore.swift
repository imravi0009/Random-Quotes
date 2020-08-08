//
//  QuoteCoreDataStore.swift
//  RandomQuote
//
//  Created by Ravi kumar on 08/08/20.
//  Copyright © 2020 Ravi kumar. All rights reserved.
//

import Foundation
import CoreData
class QuoteCoreDataStore {
    var context:NSManagedObjectContext
    init(context:NSManagedObjectContext) {
        self.context = context
    }
    func addQuote(quoteJson:[String:String]) -> Quote? {
        if let recentQuote = fetchRecentQoute(){
            if !recentQuote.isFavourite {
                delete(quote: recentQuote)
            }
            else{
                recentQuote.isRecentQuote = false
            }
        }
        guard let id = quoteJson["id"], let text = quoteJson["en"], let author = quoteJson["author"] else { return nil}
        let newQuote = createNewQuote(id: id, text: text, authorName: author)
        saveChanges()
        return newQuote
    }
    
    // Creates a new Entity
   private func createNewQuote(id: String, text: String, authorName: String) -> Quote {
        
        let newQuote = NSEntityDescription.insertNewObject(forEntityName: "Quote", into: context) as! Quote
        newQuote.id = id
        newQuote.qoute = text
        newQuote.author = authorName
        newQuote.isRecentQuote = true
        
        return newQuote
    }
    
    func updateQuoteFavouriteStatus(id:String, isFav:Bool) -> Quote? {
        if let quote = fetchtQoute(id: id){
            quote.isFavourite = isFav
            saveChanges()
            return quote
        }
        return nil
    }
    
    
    
    func fetchAllFavourites() -> [Quote] {
        do {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Quote")
            fetchRequest.predicate = NSPredicate(format: "isFavourite = %d", true)
            
            
            do {
                let response = try context.fetch(fetchRequest)
                return response as! [Quote]
                
            } catch let error as NSError {
                // failure
                print(error)
                return [Quote]()
            }
        }
    }
    
    
    func delete(quote:Quote)  {
        context.delete(quote)
        saveChanges()
    }
    
    func saveChanges() {
        do {
            try context.save()
        } catch _ {
            // error handling
        }
    }

    func fetchRecentQoute() -> Quote? {
        do {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Quote")
            fetchRequest.fetchLimit = 1
            fetchRequest.predicate = NSPredicate(format: "isRecentQuote = %d", true)
            do {
                let response = try context.fetch(fetchRequest)
                return response.first as? Quote
                
            } catch let error as NSError {
                // failure
                print(error)
                return nil
            }
        }
    }
    
    func fetchtQoute(id:String) -> Quote? {
        do {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Quote")
            fetchRequest.fetchLimit = 1
            fetchRequest.predicate = NSPredicate(format: "id = %@", id)
            do {
                let response = try context.fetch(fetchRequest)
                return response.first as? Quote
                
            } catch let error as NSError {
                // failure
                print(error)
                return nil
            }
        }
    }
}
