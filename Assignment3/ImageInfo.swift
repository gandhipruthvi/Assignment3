//
//  ImageInfo.swift
//  Assignment3
//
//  Created by Pruthvi Gandhi on 2021-11-13.
//

import Foundation

class ImageInfo {
    var title : String = ""
    var url : URL!
    
    init(n: String, u: URL) {
        title = n
        url = u
}
}
