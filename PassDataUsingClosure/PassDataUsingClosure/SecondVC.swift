//
//  SecondVC.swift
//  PassDataUsingClosure
//
//  Created by Loyltwo3ks on 16/12/24.
//

import UIKit

class SecondVC: UIViewController {
    
    @IBOutlet weak var nameTF: UITextField!
    var passData: ((String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTapSaveBtn(_ sender: UIButton) {
        guard let nameData = nameTF.text else {return}
        self.passData?(nameData)
        self.navigationController?.popViewController(animated: true)
        
    }
    
}
