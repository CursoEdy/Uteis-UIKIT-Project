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
    
    var elements = NSMutableArray()
    
    override func viewDidLoad() {
        itensTable.delegate = self
        itensTable.dataSource = self
        
        let global = Global()
        let database = global.leituraPlist(nome: "Database")
        
        elements = database["listas"] as! NSMutableArray
//        let dicionario = NSMutableDictionary()
//        dicionario["listas"] = elements
//        global.salvaPlist(oDicionario: dicionario, naPlist: "Database")
        
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
    
    // itulo no header da tabela
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Listas"
    }
    
    //retorno linha da tabela
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "ItemRow"
        let cell: ItemRow = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! ItemRow
        let dictionary = elements.object(at: indexPath.row) as? NSDictionary
        
        cell.titulo.text = dictionary?["name"] as? String
        cell.quantidade.text = dictionary?["item"] as? String
        
        return cell
    }
    
    //retorna um titulo no footer da tabela
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "Escolha um item para saber mais"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dictionary = elements[indexPath.row]
        
        //recarrega toda a tabela para que o item selecionado nao fique em foco
        itensTable.reloadData()
        
        //instancia classe global
        let global = Global()
        let detailsView = DetailsView()
        
        //inicializar dicionario
        Global.parametros = NSMutableDictionary()
        Global.parametros?["resultado"] = dictionary
        global.proximaView(viewController: detailsView, id: "DetailsView", navigation: self.navigationController!, storyboardName: "Main")
    }
    // *********  end config table *********
    
}
