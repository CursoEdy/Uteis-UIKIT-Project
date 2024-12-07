//
//  Lista.swift
//  UteisUIKit
//
//  Created by ednardo alves on 06/12/24.
//

import Foundation
import SwiftUI
import UIKit

class Lista: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    
    
    //para carregar a tabela, vamos precisar primeiro chamar o delegate UITableViewDelegate e UITableViewDataSource
    @IBOutlet weak var itensTable: UITableView!
    
    var elements = [
        ["name":"Mercado","item":"30"],
        ["name":"Happy hour","item":"10"],
        ["name":"Almocode domingo","item":"50"]
    ]
    
    override func viewDidLoad() {
        itensTable.delegate = self
        itensTable.dataSource = self
//        informar que esta usando o delegate, caso contrario o teclado nao ira retrair
//        alturaText.delegate = self
//        imageA.image = UIImage(named: "person")
    }
    
    
    // ********* Start config table *********
    //informar o numero de sessoes na tabela
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //informar o numero de linhas
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return elements.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Listas"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "ItemRow"
        let cell: ItemRow = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! ItemRow
        let dictionary = elements[indexPath.row]
        
        cell.titulo.text = dictionary["name"]
        cell.quantidade.text = dictionary["item"]
        
        return cell
    }
    
    // *********  end config table *********
    
}
