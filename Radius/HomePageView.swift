//
//  ContentView.swift
//  Radius
//
//  Created by KCD on 28/06/23.
//

import SwiftUI

struct HomePageView: View {
    
    @State var MainFacilitieOptions : model?
    @State private var selection: String?
    @State private var selection1: String?
    @State private var selection2: String?
    @State var isSelected : Bool = false
    @State var selectedObjectId : String = ""
    @State var selectedObjectId1 : String = ""
    @State var selectedObjectId2 : String = ""
    @State var exclusionList : [Exclusion] = []
    @State var excludedList : [Exclusion] = []
    @State var facilityID : String = ""
    @State var optionsID : String = ""
    @State var showAlert : Bool = false
    let names = [
        "Cyril",
        "Lana",
        "Mallory",
        "Sterling"
    ]
    
    var body: some View {
        NavigationStack{
            List{
                Section(MainFacilitieOptions?.facilities[0].name ?? "") {
                    ForEach(MainFacilitieOptions?.facilities[0].options.indices ?? 0..<0, id: \.self) { j in
                        Button {
                            selectedObjectId = MainFacilitieOptions?.facilities[0].options[j].id ?? ""
                            excludedList = []
                            dummyExclusion(exc: MainFacilitieOptions!.exclusions, selectedFacility: Exclusion(facilityID: "1", optionsID: MainFacilitieOptions?.facilities[0].options[j].id ?? ""))
                        } label: {
                            HStack{
                                Image((MainFacilitieOptions?.facilities[0].options[j].icon)!)
                                Text(MainFacilitieOptions?.facilities[0].options[j].name ?? "")
                                Spacer()
                                Image(systemName: (selectedObjectId == MainFacilitieOptions?.facilities[0].options[j].id ?? "" ? "checkmark" : ""))
                            }
                        }
                    }
                }.headerProminence(.increased)
                
                Section(MainFacilitieOptions?.facilities[1].name ?? "") {
                    ForEach(MainFacilitieOptions?.facilities[1].options.indices ?? 0..<0, id: \.self) { j in
                        Button {
                            selectedObjectId1 = MainFacilitieOptions?.facilities[1].options[j].id ?? ""
                            dummyExclusion(exc: MainFacilitieOptions!.exclusions, selectedFacility: Exclusion(facilityID: "2", optionsID: MainFacilitieOptions?.facilities[1].options[j].id ?? ""))
                        } label: {
                            HStack{
                                Image((MainFacilitieOptions?.facilities[1].options[j].icon)!)
                                Text(MainFacilitieOptions?.facilities[1].options[j].name ?? "")
                                Spacer()
                                Image(systemName: (selectedObjectId1 == MainFacilitieOptions?.facilities[1].options[j].id ?? "" ? "checkmark" : ""))
                            }
                        }
                        .disabled(isDisable(fId: "2", oId: (MainFacilitieOptions?.facilities[1].options[j].id)!))
                    }
                }.headerProminence(.increased)
                    .disabled(selectedObjectId.isEmpty ? true : false)
                
                Section(MainFacilitieOptions?.facilities[2].name ?? "") {
                    ForEach(MainFacilitieOptions?.facilities[2].options.indices ?? 0..<0, id: \.self) { j in
                        Button {
                            selectedObjectId1 = MainFacilitieOptions?.facilities[2].options[j].id ?? ""
                            dummyExclusion(exc: MainFacilitieOptions!.exclusions, selectedFacility: Exclusion(facilityID: "3", optionsID: MainFacilitieOptions?.facilities[2].options[j].id ?? ""))
                        } label: {
                            HStack{
                                Image((MainFacilitieOptions?.facilities[2].options[j].icon)!)
                                Text(MainFacilitieOptions?.facilities[2].options[j].name ?? "")
                                Spacer()
                                Image(systemName: (selectedObjectId2 == MainFacilitieOptions?.facilities[2].options[j].id ?? "" ? "checkmark" : ""))
                            }
                        }
                        .disabled(isDisable(fId: "3", oId: (MainFacilitieOptions?.facilities[2].options[j].id)!))
                    }
                }.headerProminence(.increased)
                    .disabled(selectedObjectId1.isEmpty ? true : false)

                
            }.navigationTitle("Select One From Each")
                .alert("Mis Combination", isPresented: $showAlert) {
                    Text("You Can Select this")
                }
        }.onAppear(){
            ApiCalls().getApi(endpoint: Endpoint.getAssignment){ response in
//                print(type(of: response))
                if response != nil {
                    decoder().decodeJson(data: response!){ decoderResponse in
//                        print(type(of: decoderResponse))
                        MainFacilitieOptions = decoderResponse
                    }
                }
            }
        }
    }
    
    func isDisable(fId : String, oId : String) -> Bool{
//        print(Exclusion(facilityID: fId, optionsID: oId))
        if !excludedList.isEmpty{
            for i in 0..<excludedList.count{
//                print("isDisabled----->\(i)")
//                print(("\(excludedList[i]) == \(Exclusion(facilityID: fId, optionsID: oId))"))
                if ("\(excludedList[i])" == "\(Exclusion(facilityID: fId, optionsID: oId))"){
                    return true
                }
            }
        }
        return false
    }
    
    func dummyExclusion(exc : [[Exclusion]], selectedFacility : Exclusion){
        for i in 0..<exc.count{
            for j in 0..<2{
//                print("\(i)--\(j)")
                if ("\(exc[i][j])" == "\(selectedFacility)"){
                    excludedList.append(exc[i][j == 0 ? 1 : 0])
//                    print("ExcludedList =====>\(excludedList)")
                    return
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
