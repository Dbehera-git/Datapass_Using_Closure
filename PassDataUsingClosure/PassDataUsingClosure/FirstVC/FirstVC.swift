//
//  ViewController.swift
//  PassDataUsingClosure
//
//  Created by Loyltwo3ks on 16/12/24.
//

import UIKit

class FirstVC: UIViewController {
    
    @IBOutlet weak var studentTV: UITableView!
    @IBOutlet weak var nextBtn: UIButton!
    var stdArray = [FirstVCModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.nextBtn.layer.cornerRadius = self.nextBtn.bounds.height/2
        self.studentTV.delegate = self
        self.studentTV.dataSource = self
        self.studentTV.register(UINib(nibName: "FirstVCTVCell", bundle: nil), forCellReuseIdentifier: "FirstVCTVCell")
    }
    override func viewWillAppear(_ animated: Bool) {
        self.studentTV.reloadData()
    }

    @IBAction func didTapNextBtn(_ sender: UIButton) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "SecondVC") as? SecondVC {
            vc.passData = { [weak self] stdName in
                self?.stdArray.append(FirstVCModel(name: stdName))
            }
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension FirstVC: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stdArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FirstVCTVCell", for: indexPath) as? FirstVCTVCell
        guard let cell else {
            fatalError("")
        }
        cell.nameLbl.text = stdArray[indexPath.row].name
        return cell
    }
}

struct FirstVCModel {
    let name: String
}

