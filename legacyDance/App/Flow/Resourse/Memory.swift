//
//  Memory.swift


import Foundation
class Memory {
    
    static let shared = Memory()
    
    let defaults = UserDefaults.standard
    
    var userName: String? {
        get {
            return defaults.string(forKey: "userName")
        }
        set {
            defaults.set(newValue, forKey: "userName")
        }
    }
    
    var userID: Int {
          get {
              return defaults.integer(forKey: "userID", defaultValue: 1)
          }
          set {
              defaults.set(newValue, forKey: "userID")
          }
      }
    
    var incorrectAnswer: Int {
          get {
              return defaults.integer(forKey: "incorrectAnswer", defaultValue: 0)
          }
          set {
              defaults.set(newValue, forKey: "incorrectAnswer")
          }
      }
    
    var completeTigerTrail: Bool {
        get {
            return defaults.bool(forKey: "completeTigerTrail")
        }
        set {
            defaults.set(newValue, forKey: "completeTigerTrail")
        }
    }
    
    var connoisseur: Bool {
        get {
            return defaults.bool(forKey: "connoisseur")
        }
        set {
            defaults.set(newValue, forKey: "connoisseur")
        }
    }
    
    var dealing: Bool {
        get {
            return defaults.bool(forKey: "dealing")
        }
        set {
            defaults.set(newValue, forKey: "dealing")
        }
    }
    
    var useknowledge: Bool {
        get {
            return defaults.bool(forKey: "useknowledge")
        }
        set {
            defaults.set(newValue, forKey: "useknowledge")
        }
    }
    
    var misuseknowledge: Bool {
        get {
            return defaults.bool(forKey: "misuseknowledge")
        }
        set {
            defaults.set(newValue, forKey: "misuseknowledge")
        }
    }
    
    var elapsedTime: TimeInterval {
        get {
            return defaults.double(forKey: "elapsedTime")
        }
        set {
            defaults.set(newValue, forKey: "elapsedTime")
        }
    }
    
    var deathsGame: Int {
          get {
              return defaults.integer(forKey: "deathsGame", defaultValue: 0)
          }
          set {
              defaults.set(newValue, forKey: "deathsGame")
          }
      }
    
    var choices: Int {
          get {
              return defaults.integer(forKey: "choices", defaultValue: 0)
          }
          set {
              defaults.set(newValue, forKey: "choices")
          }
      }
}

extension UserDefaults {
    func integer(forKey key: String, defaultValue: Int) -> Int {
        return self.object(forKey: key) as? Int ?? defaultValue
    }
}
