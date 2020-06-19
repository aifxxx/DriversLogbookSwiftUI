//
//  User.swift
//  DriversLogbookSwiftUI
//
//  Created by Anne Feistauer on 18.06.20.
//  Copyright © 2020 Anne Feistauer. All rights reserved.
//

import SwiftUI

struct User: Hashable, Codable, Identifiable {

    var id: Int
    var firstName: String
    var lastName:  String
    var porscheID: String

}
