//
//  ApiCalls.swift
//  Radius
//
//  Created by KCD on 28/06/23.
//

import Foundation
import SwiftUI


class ApiCalls{
    func getApi(endpoint : String, completionHandler : @escaping (_ data : Data?) -> ()){
        let url = URL(string: Endpoint.baseUrl + endpoint)
        let data : Data = """
{
        "facilities": [
        {
        "facility_id": "1",
        "name": "Property Type",
        "options": [
        {
        "name": "Apartment",
        "icon": "apartment",
        "id": "1"
        },
        {
        "name": "Condo",
        "icon": "condo",
        "id": "2"
        },
        {
        "name": "Boat House",
        "icon": "boat",
        "id": "3"
        },
        {
        "name": "Land",
        "icon": "land",
        "id": "4"
        }
        ]
        },
        {
        "facility_id": "2",
        "name": "Number of Rooms",
        "options": [
        {
        "name": "1 to 3 Rooms",
        "icon": "rooms",
        "id": "6"
        },
        {
        "name": "No Rooms",
        "icon": "no-room",
        "id": "7"
        }
        ]
        },
        {
        "facility_id": "3",
        "name": "Other facilities",
        "options": [
        {
        "name": "Swimming Pool",
        "icon": "swimming",
        "id": "10"
        },
        {
        "name": "Garden Area",
        "icon": "garden",
        "id": "11"
        },
        {
        "name": "Garage",
        "icon": "garage",
        "id": "12"
        }
        ]
        }
        ],
        "exclusions": [
        [
        {
        "facility_id": "1",
        "options_id": "4"
        },
        {
        "facility_id": "2",
        "options_id": "6"
        }
        ],
        [
        {
        "facility_id": "1",
        "options_id": "3"
        },
        {
        "facility_id": "3",
        "options_id": "12"
        }
        ],
        [
        {
        "facility_id": "2",
        "options_id": "7"
        },
        {
        "facility_id": "3",
        "options_id": "12"
        }
        ]
        ]
    }
""".data(using: .utf8)!
        completionHandler(data)

//        let call = URLSession.shared.dataTask(with: url!){ data, response, error in
//            guard let data = data,
//                error == nil,
//                let res = response as? HTTPURLResponse,
//                (res.statusCode >= 200 && res.statusCode < 300) else {
//                    print("statusCode should be 2xx, but is")
//                    return completionHandler(data)
//                }
//            completionHandler(data)
//        }
//        call.resume()
    }
}
