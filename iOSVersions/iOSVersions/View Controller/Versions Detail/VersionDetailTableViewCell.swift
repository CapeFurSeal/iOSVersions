//
//  VersionDetailTableViewCell.swift
//  iOSVersions
//
//  Created by mac on 2020/12/09.
//

import UIKit
import Kingfisher

class VersionDetailTableViewCell: UITableViewCell {
    
    @IBOutlet fileprivate weak var versionNameLabel: UILabel?
    @IBOutlet fileprivate weak var versionLabel: UILabel?
    @IBOutlet fileprivate weak var releaseDateLabel: UILabel?
    @IBOutlet fileprivate weak var versionImageView: UIImageView?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupVersionDetailTableViewCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    private func setupVersionDetailTableViewCell() {
        versionNameLabel?.textColor =  UIColor.black
        versionNameLabel?.font = UIFont.systemFont(ofSize: 15, weight:.regular)
        versionNameLabel?.numberOfLines = 0
        versionNameLabel?.textAlignment = .left
        versionNameLabel?.lineBreakMode = .byTruncatingTail
        
        versionLabel?.textColor =  UIColor.black
        versionLabel?.font = UIFont.systemFont(ofSize: 15, weight:.regular)
        versionLabel?.numberOfLines = 0
        versionLabel?.textAlignment = .left
        versionLabel?.lineBreakMode = .byTruncatingTail
        
        releaseDateLabel?.textColor =  UIColor.black
        releaseDateLabel?.font = UIFont.systemFont(ofSize: 15, weight:.regular)
        releaseDateLabel?.numberOfLines = 0
        releaseDateLabel?.textAlignment = .left
        releaseDateLabel?.lineBreakMode = .byTruncatingTail
    }
    
    internal func bindVersionDetailTableViewCell(version: Version?) {
        if let versionName = version?.name {
            versionNameLabel?.text = versionName
        }
        
        if let versionVersion = version?.version {
            versionLabel?.text = versionVersion
        }
        
        if let released = version?.released {
            releaseDateLabel?.text = released
        }
        
        guard let thumbnailUrl = version?.returnUrlFromString(image:version?.image) else {
            return
        }
        versionImageView?.kf.setImage(with: ImageResource(downloadURL: thumbnailUrl))
    }

}
