//
//  AppColors.swift
//  MovieApp
//
//  Created by Diab on 24/09/2025.
//


import SwiftUI

enum ColorName:String{
    case mainBackGround = "MainBackGround"
    case primary = "MainColor"
    case secondry = "SecondryColor"
    case alert = "AlertColor"
    case grayText = "BlueGray"
    case darkWhite = "DarkLight"
    
}



final class AppColors {
    
    static let shared = AppColors()
    private init() {}
    
    
    func createColor(_ name: ColorName) -> Color {
        Color(name.rawValue)
    }
    
    var mainBackGround:Color{
        return createColor(.mainBackGround)
    }
    
    var primary:Color{
        return createColor( .primary)
    }

    var secondry:Color{
        return createColor( .secondry)
    }
    
    var alert:Color{
        return createColor( .alert)
    }
    
    var grayText:Color{
        return createColor( .grayText)
    }
    
    
    var darkWhite:Color{
        return createColor( .darkWhite)
    }
}
