//
//  Game.swift
//  Overwatch
//
//  Created by Forrest Zhao on 10/21/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

struct Game {
    var offenseCharacters: [Hero] = []
    var defenseCharacters: [Hero] = []
    var supportCharacters: [Hero] = []
    var tankCharacters: [Hero] = []
    var heroType: HeroType = .offense
    
    var heroes: [Hero] {
        get {
            return heroesForType()
        }
    }
    
    init() {
        createAllHeroes()
    }
}

extension Game {
    mutating func createAllHeroes() {
        for type in HeroType.allTypes {
            switch type {
            case .offense:
                for hero in HeroName.heroes(with: type) {
                    offenseCharacters.append(Hero(name: hero))
                }
            case .defense:
                for hero in HeroName.heroes(with: type) {
                    defenseCharacters.append(Hero(name: hero))
                }
            case .support:
                for hero in HeroName.heroes(with: type) {
                    supportCharacters.append(Hero(name: hero))
                }
            case .tank:
                for hero in HeroName.heroes(with: type) {
                    tankCharacters.append(Hero(name: hero))
                }
            }
        }
    }
    
    func heroesForType() -> [Hero] {
        switch heroType {
        case .offense:
            return offenseCharacters
        case .defense:
            return defenseCharacters
        case .support:
            return supportCharacters
        case .tank:
            return tankCharacters
        }
    }
    
}
