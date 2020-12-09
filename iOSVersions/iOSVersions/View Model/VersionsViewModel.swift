//
//  VersionsViewModel.swift
//  iOSVersions
//
//  Created by mac on 2020/12/09.
//

import Foundation
import Combine

class VersionsViewModel: ObservableObject {
    private var webService = WebService()
    private var cancellableSet: Set<AnyCancellable> = []
    internal weak var dataSource: VersionsDataSource?
    internal var selectedVersion: Version?

    init(dataSource: VersionsDataSource?) {
      self.dataSource = dataSource
    }
    
    func getIosVersions(reload: @escaping () -> ())  {
        webService
            .getIosVersions()?
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { status in
                print(status)
            }) { [self] (iosVersions) in
                guard let versions = iosVersions.versions else {
                    return
                }
                self.dataSource?.versions = versions
                reload()
            }.store(in: &self.cancellableSet)
    }
}

