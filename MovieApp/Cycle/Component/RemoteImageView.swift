//
//  RemoteImageView.swift
//  MovieApp
//
//  Created by Diab on 24/09/2025.
//


import SwiftUI
import Kingfisher

struct RemoteImageView: View {
    
    var localImage: Data? = nil
    let remoteURL: String?
    var fitImage:Bool = false

    var body: some View {
            if let localImage,
               let uiImage = UIImage(data: localImage) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFill()
            } else if let remoteURL,
                      let url = URL(string: remoteURL) {
                KFImage(url)
                    .placeholder { ProgressView() }
                    .resizable()
                    .aspectRatio(contentMode: fitImage ? .fit : .fill)
            } else {
                placeholderImage()
            }
        
    }
    
    private func placeholderImage() -> some View {
        Circle()
            .fill(Color.main)
            .frame(width: 50, height: 50)
            .overlay {
                Image("")
                    .resizable()
                    .frame(width: 20, height: 20)
            }
    }
}
