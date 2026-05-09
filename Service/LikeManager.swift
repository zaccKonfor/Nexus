//
//  LikeManager.swift
//  Nexus
//
//  Created by Zacc Konfor on 5/9/26.
//

import UIKit

class LikeManager {
    static let shared = LikeManager()
        private let key = "user_liked_ids"

        // Save a like/unlike
        func setLiked(id: String, isLiked: Bool) {
            var likedIDs = getLikedIDs()
            if isLiked {
                likedIDs.insert(id)
            } else {
                likedIDs.remove(id)
            }
            UserDefaults.standard.set(Array(likedIDs), forKey: key)
        }

        // Retrieve the state
        func getLikedIDs() -> Set<String> {
            let array = UserDefaults.standard.stringArray(forKey: key) ?? []
            return Set(array)
        }
    
    // Clear on logout
       func clearAll() {
           UserDefaults.standard.removeObject(forKey: key)
       }
}
