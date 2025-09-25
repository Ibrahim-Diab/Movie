//
//  MovieDetailsDataSource.swift
//  MovieApp
//
//  Created by Diab on 25/09/2025.
//

import Foundation

protocol MovieDetailsDataSource:MovieCardViewDataSource{
   
    var movieOverview:String{get}
    var movieGenere:[Genre]{get}
    var movieRunTime:String{get}
    var movieProductionCompaniesLogo:[String]{get}
    var movieGenereText:String{get}
}
