//
//  MainIssueTableViewCell.swift
//  IssueTimeLine
//
//  Created by SolChan Ahn on 2018. 6. 16..
//  Copyright © 2018년 SolChan Ahn. All rights reserved.
//

import UIKit

class MainIssueTableViewCell: UITableViewCell {
    @IBOutlet weak var mainIssueView: UIView!
    
    @IBOutlet weak var mainIssueImageView: UIImageView!
    
    @IBOutlet weak var mainIssueTitleLabel: UILabel!
    @IBOutlet weak var mainIssueContentLabel: UILabel!
    
    var issueData: Issue!{
        didSet{
            self.mainIssueImageView.loadImageUsingCacheWithUrl(urlString: issueData
                .image) { (success) in }
            print(issueData.image)
            self.mainIssueTitleLabel.text = issueData.title
            self.mainIssueContentLabel.text = issueData.description
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layoutIfNeeded()
        mainIssueView.layer.cornerRadius = 10
        mainIssueView.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
