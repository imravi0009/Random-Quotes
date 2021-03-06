//
//  QuotePresenter.swift
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

protocol QuotePresentationLogic
{
    func presentQuoteFavouriteOption(response: RandomQuote.ShowFavouriteOption.Response)
    func presentQuoteFetchFailure(response: RandomQuote.Fetch.Response)
    func presentNewQuote(response: RandomQuote.Fetch.Response)
    func presentUpdatedQuote(response: RandomQuote.Fetch.Response)
}

class QuotePresenter: QuotePresentationLogic
{
    
    weak var viewController: QuoteDisplayLogic?
    
    // MARK: QuotePresentationLogic Methods
    func presentQuoteFavouriteOption(response: RandomQuote.ShowFavouriteOption.Response)
    {
        let viewModel = RandomQuote.ShowFavouriteOption.ViewModel(hideFavourites: response.hideFavourites, id: response.id)
        viewController?.displayFavourite(viewModel: viewModel)
    }
    
    func presentQuoteFetchFailure(response: RandomQuote.Fetch.Response) {
        let viewModel = RandomQuote.Fetch.ViewModel(id: nil, quote: nil, author: nil, isFavourite: false, isRecentQuote: false, errorMessage: response.err.debugDescription)
        viewController?.displayErrorOnFailure(viewModel: viewModel)
    }
    func presentNewQuote(response: RandomQuote.Fetch.Response) {
        let viewModel = RandomQuote.Fetch.ViewModel(id: response.quote?.id, quote: response.quote?.qoute, author: response.quote?.author, isFavourite: response.quote?.isFavourite, isRecentQuote: response.quote?.isRecentQuote, errorMessage: response.err?.localizedDescription)
        viewController?.displayNewQuote(viewModel: viewModel)
    }
    
    func presentUpdatedQuote(response: RandomQuote.Fetch.Response){
        let viewModel = RandomQuote.Fetch.ViewModel(id: response.quote?.id, quote: response.quote?.qoute, author: response.quote?.author, isFavourite: response.quote?.isFavourite, isRecentQuote: response.quote?.isRecentQuote, errorMessage: response.err?.localizedDescription)
        viewController?.displayUpdatedFavouritQuote(viewModel: viewModel)
    }
    
}
