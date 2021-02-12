//
//  Mission.swift
//  Moonshot
//
//  Created by Vayu Moreira on 2/9/21.
//

import Foundation

struct Mission: Codable, Identifiable {
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        if let launchDate = launchDate {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter.string(from: launchDate)
        } else {
            return "N/A"
        }
    }
    
    var crewMembers: String {
        var crewMembers: [String] = []
        
        for member in crew {
            crewMembers.append(member.name.capitalizingFirstLetter())
        }
        
        return crewMembers.map{String($0)}.joined(separator: ", ")
    }
}
