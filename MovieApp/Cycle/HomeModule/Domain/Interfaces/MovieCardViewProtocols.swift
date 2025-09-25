//
//  MovieCardViewDataSource.swift
//  MovieApp
//
//  Created by Diab on 24/09/2025.
//

import Foundation

protocol MovieCardViewDataSource{
    var movieId:Int{get}
    var movieTitle:String{get}
    var movieReleaseDate:String{get}
    var moviePosterImage:String{get}
}

protocol MovieCardViewDelegate:AnyObject{
    func didTap(data:String)
}
