//
//  IosVersionDetailViewController.swift
//  iOSVersions
//
//  Created by mac on 2020/12/09.
//

import UIKit

class VersionDetailViewController: UIViewController {
    
    @IBOutlet fileprivate weak var versionDetailTableView: UITableView?
    internal lazy var dataSource = VersionDetailDataSource()
    internal var viewModel: VersionsViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    fileprivate func setupTableView() {
        title = "Version detail"
        
        dataSource.version = viewModel?.selectedVersion

        if let versionDetailTableView = versionDetailTableView {
            versionDetailTableView.delegate = self
            versionDetailTableView.dataSource = dataSource
            versionDetailTableView.decelerationRate = UIScrollView.DecelerationRate.fast
            versionDetailTableView.tableFooterView = UIView(frame: CGRect(x: 0,
                                                                          y: 0,
                                                                          width: 0,
                                                                          height: 0))
        }
    }
}

extension VersionDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
