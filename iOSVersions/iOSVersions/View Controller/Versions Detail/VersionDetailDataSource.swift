//
//  VersionDetailDataSource.swift
//  iOSVersions
//
//  Created by mac on 2020/12/09.
//

import Foundation
import UIKit
import Combine

class VersionDetailDataSource: NSObject {
    @Published internal var version: Version?
}

extension VersionDetailDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier:"VersionDetailTableViewCell", for: indexPath)
          as? VersionDetailTableViewCell {
            cell.bindVersionDetailTableViewCell(version: version)
            return cell
        }
        return UITableViewCell()
    }
}
