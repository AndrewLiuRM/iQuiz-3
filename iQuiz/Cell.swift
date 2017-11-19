//
//  Cell.swift
//  iQuiz
//
//  Created by 刘睿铭 on 11/5/17.
//  Copyright © 2017 Andrew Liu. All rights reserved.
//

import Foundation

class Cell {
    public var title:String;
    public var description:String;
    public var image:String?;
    
    init(title: String, description: String, image: String?) {
        self.title = title
        self.description = description
        self.image = image
    }
}
