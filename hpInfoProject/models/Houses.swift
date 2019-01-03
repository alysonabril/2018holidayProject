//
//  Houses.swift
//  hpInfoProject
//
//  Created by Alyson Abril on 1/2/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct House: Codable {
    let name: String
    let mascot: String
    let headOfHouse: String
    let houseGhost: String
    let founder: String
    let values: [String]
    let colors: [String]
}
