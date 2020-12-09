//
//  IosVersionsViewController.swift
//  iOSVersions
//
//  Created by mac on 2020/12/09.
//

import UIKit

class VersionsViewController: UIViewController {
    
    @IBOutlet fileprivate weak var versionsTableView: UITableView?
    fileprivate lazy var dataSource = VersionsDataSource()
    fileprivate var viewModel: VersionsViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    fileprivate func setupTableView() {
        title = "iOS Versions"
        
        if let versionsTableView = versionsTableView {
            versionsTableView.delegate = self
            versionsTableView.dataSource = dataSource
            versionsTableView.decelerationRate = UIScrollView.DecelerationRate.fast
            versionsTableView.tableFooterView = UIView(frame: CGRect(x: 0,
                                                                     y: 0,
                                                                     width: 0,
                                                                     height: 0))
        }
        
        viewModel = VersionsViewModel(dataSource: dataSource)
        viewModel?.getIosVersions(reload: {
            self.versionsTableView?.reloadData()
        })
    }
}

extension VersionsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.selectedVersion = dataSource.versions[indexPath.row]
        performSegue(withIdentifier: "VersionsToVersionDetail", sender: self)
    }
}

extension VersionsViewController {
  // MARK: Prepare for segue delegate
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "VersionsToVersionDetail" {
      if let versionDetailVc = segue.destination as? VersionDetailViewController {
        versionDetailVc.viewModel = viewModel
      }
    }
  }
}
