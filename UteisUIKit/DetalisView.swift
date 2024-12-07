//
//  Detalis.swift
//  UteisUIKit
//
//  Created by ednardo alves on 07/12/24.
//

import Foundation
import UIKit

class DetailsView: UIViewController {
    
    @IBOutlet weak var descricao: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let label = Global.parametros
        let resultado = label?["resultado"] as? NSDictionary
        let name = resultado?["name"] as? String
        let quantidade = resultado?["item"] as? String
        
        descricao.text = quantidade
        
        self.navigationItem.title = name
    }
}
