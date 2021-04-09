//
//  BusinessViewModal.swift
//  Staqo
//
//  Created by SHAILY on 06/03/21.
//

import Foundation

class BusinessViewModal: ViewModelType {
    
    
    var delegate: ViewModelDelegate?
    private var dataSource:BusinessDataSourceDelegate?
    init(dataSource:BusinessDataSourceDelegate) {
        self.dataSource = dataSource
    }
    func bootstrap() {
    }
    func getTextReader(value:String){
        delegate?.willLoadData()
        dataSource?.getTextReader(value: value, completion: { [weak self] result in
            guard let ws = self else{return}
            switch result {
            
            case .success(let baseModel):
                print(baseModel)
                ws.delegate?.didLoadData()
            case .failure(let error):
                ws.delegate?.didFail(error: error)
            }
            
        })
    }
}