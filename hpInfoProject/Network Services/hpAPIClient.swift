//
//  hpAPIClient.swift
//  hpInfoProject
//
//  Created by Alyson Abril on 1/2/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

final class HPAPIClient {
    static func searchHPCharacter(keyword: String, completionHandler: @escaping (AppError?, [HPCharacter]?) -> Void) {
        //query the iTunes Search API for the podcast
        NetworkHelper.shared.performDataTask(endpointURLString: "https://www.potterapi.com/v1/characters?key=$2a$10$asYLW6KE.mifSQw4w5ktxOM4q.YYYEAmrrB3H0bIYiZjGqSLsz7pq", httpMethod: "GET", httpBody: nil) { (appError, data, httpResponse) in
            if let appError = appError {
                completionHandler(appError, nil)
            }
            guard let response = httpResponse,
                (200...299).contains(response.statusCode) else {
                    let statusCode = httpResponse?.statusCode ?? -999
                    completionHandler(AppError.badStatusCode(String(statusCode)), nil)
                    return
            }
            if let data = data {
                do {
                    let hpChar = try JSONDecoder().decode([HPCharacter].self, from: data)
                    dump(hpChar)
                    completionHandler(nil, hpChar)
                } catch {
                    completionHandler(AppError.decodingError(error), nil)
                }
            }
        }
    }
    
    static func searchHPHouse(keyword: String, completionHandler: @escaping (AppError?, [House]?) -> Void) {
        //query the iTunes Search API for the podcast
        NetworkHelper.shared.performDataTask(endpointURLString: "https://www.potterapi.com/v1/houses?key=$2a$10$asYLW6KE.mifSQw4w5ktxOM4q.YYYEAmrrB3H0bIYiZjGqSLsz7pq", httpMethod: "GET", httpBody: nil) { (appError, data, httpResponse) in
            if let appError = appError {
                completionHandler(appError, nil)
            }
            guard let response = httpResponse,
                (200...299).contains(response.statusCode) else {
                    let statusCode = httpResponse?.statusCode ?? -999
                    completionHandler(AppError.badStatusCode(String(statusCode)), nil)
                    return
            }
            if let data = data {
                do {
                    let house = try JSONDecoder().decode([House].self, from: data)
                    dump(house)
                    completionHandler(nil, house)
                } catch {
                    completionHandler(AppError.decodingError(error), nil)
                }
            }
        }
    }
}
