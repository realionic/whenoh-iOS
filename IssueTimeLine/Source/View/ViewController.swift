//
//  ViewController.swift
//  IssueTimeLine
//
//  Created by SolChan Ahn on 2018. 6. 16..
//  Copyright © 2018년 SolChan Ahn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainIssueTable: UITableView!
    
    var issueDatas: [Issue]?{
        didSet{
            self.mainIssueTable.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainIssueTable.rowHeight = UITableViewAutomaticDimension
        
        getIssueDatas()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func getIssueDatas() {
        NetworkService.getIssueList(completion: { (result) in
            switch result {
            case .success(let issueDatas):
                self.issueDatas = issueDatas
            case .error(let error):
                print(error)
            }
        })
    }

}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let articleViewController = storyboard.instantiateViewController(withIdentifier: "ArticleViewController") as! ArticleViewController
        present(articleViewController, animated: true, completion: nil)
    }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return issueDatas?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = mainIssueTable.dequeueReusableCell(withIdentifier: "MainIssueTableViewCell", for: indexPath) as! MainIssueTableViewCell
        if let issueData = self.issueDatas?[indexPath.item] {
            cell.issueData = issueData
        }
        
        return cell
    }
    
    
}
