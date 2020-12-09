//
//  VersionsTableViewCell.swift
//  iOSVersions
//
//  Created by mac on 2020/12/09.
//

import UIKit
import Kingfisher

class VersionsTableViewCell: UITableViewCell {
    
    @IBOutlet fileprivate weak var versionNameLabel: UILabel?
    @IBOutlet fileprivate weak var versionImageView: UIImageView?

    override func awakeFromNib() {
        super.awakeFromNib()
        setupVersionsTableViewCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    private func setupVersionsTableViewCell() {
        versionNameLabel?.textColor =  UIColor.black
        versionNameLabel?.font = UIFont.systemFont(ofSize: 15, weight:.regular)
        versionNameLabel?.numberOfLines = 0
        versionNameLabel?.textAlignment = .left
        versionNameLabel?.lineBreakMode = .byTruncatingTail
    }
    
    internal func bindVersionsTableViewCell(version: Version) {
        if let versionName = version.name {
            versionNameLabel?.text = versionName
        }
        guard let thumbnailUrl = version.returnUrlFromString(image:version.image) else {
            return
        }
        versionImageView?.kf.setImage(with: ImageResource(downloadURL: thumbnailUrl))
    }
}

