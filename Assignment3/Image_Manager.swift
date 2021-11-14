//
//  Image_Manager.swift
//  Assignment3
//
//  Created by Pruthvi Gandhi on 2021-11-13.
//

import Foundation

class ImageManager {
    
    private var listOfImages = [ImageInfo]()
    
    func addNewImage(ni:ImageInfo){
        listOfImages.append(ni)
    }
    
    func getAllImages() -> [ImageInfo]{
        return listOfImages

    }
    
}
