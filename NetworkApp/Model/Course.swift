//
//  Course.swift
//  NetworkApp
//
//  Created by Евгений Волчецкий on 26.12.22.
//

import Foundation

struct Course: Decodable {
    let id: Int?
    let name: String?
    let link: String?
    let imageUrl: String?
    let numberOfLessons: Int?
    let numberOfTests: Int?
}
