//
//  VersionsDataSource.swift
//  iOSVersions
//
//  Created by mac on 2020/12/09.
//

import Foundation
import UIKit
import Combine

class VersionsDataSource: NSObject {
    @Published internal var versions = [Version]()
}

extension VersionsDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        versions.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier:"VersionsTableViewCell", for: indexPath)
          as? VersionsTableViewCell {
            cell.bindVersionsTableViewCell(version: versions[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
}
