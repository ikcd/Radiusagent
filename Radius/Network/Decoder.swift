//
//  decoder.swift
//  Radius
//
//  Created by KCD on 28/06/23.
//

import Foundation


class decoder{
    func decodeJson(data : Data, completetionHandler : @escaping (_ data: Radius.model?) -> ()){
        do {
            let decoder = JSONDecoder()
            let responseObject = try decoder.decode(model.self, from: data)
            completetionHandler(responseObject)
        }catch{
            print("Json parse error\(error)\n\(error._code)\n\(error._domain)\n\(error.localizedDescription)")
        }
    }
}
