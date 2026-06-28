//
//  SupabaseDataManager.swift
//  Notavil
//
//  Created by Julio Sampaio on 27/06/26.
//

import Foundation

@Observable @MainActor

final class SupabaseDataManager{
    private let service: SupabaseDataServices
    var error: Error?
    var currentUser: UserModel?
    // var authStatus: AuthState = .notDetermined
    
    init(service: SupabaseDataServices){
        self.service = service
    }
    
    func fetchUserData() async {
        do{
            let userData: UserModel = try await service.fetchUserData()
            self.currentUser = userData
        } catch{
            self.error = error
            print("Failed to fetch user data: \(error)")
           
        }
    }
    
}
