//
//  SegmenButton.swift
//  MovieApp
//
//  Created by Diab on 24/09/2025.
//


import SwiftUI

struct SegmenButtonView: View {
    var item:SegmentButtonModel
    
    weak var delegate:SegmenButtonDelegate?
    
    var body: some View {
        Button(action: {
            delegate?.didChoiceSegment(id: item.id)
        }) {
            HStack(spacing:5){
                    Image(item.icon)
                        .resizable()
                        .frame(width: 30, height: 30)
                        .aspectRatio(contentMode: .fit)
                        .padding(.leading,4)
                    Text(item.name)
                        .textStyle(font: .system(size: 12,weight:.bold), color: item.isSelected ? Color.white : Color.black)
                        .lineLimit(2)
                        .minimumScaleFactor(0.8)
                        .padding(.vertical)
                        
                
            }
        }
        
        .frame(height: 40)
        .frame(maxWidth: .infinity)
        .containerCardBackground( style: item.isSelected ? Theme.colors.primary : Theme.colors.darkWhite )
    }
}
