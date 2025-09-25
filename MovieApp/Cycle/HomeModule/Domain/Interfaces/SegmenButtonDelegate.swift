//
//  SegmenButtonDelegate.swift
//  MovieApp
//
//  Created by Diab on 24/09/2025.
//

import Foundation

@MainActor
protocol SegmenButtonDelegate:AnyObject{
    func didChoiceSegment(id:Int)
}
