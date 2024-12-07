//
//  Global.swift
//  UteisUIKit
//
//  Created by ednardo alves on 07/12/24.
//

import Foundation
import UIKit

class Global: NSObject {
    
    // ********* Start config navigation views *********
    static var parametros: NSMutableDictionary?
    
    public func proximaView(
        viewController proximaTela: UIViewController,
        id nomeView: String,
        navigation nav: UINavigationController,
        storyboardName story: String
    ) {
        let storyboard = UIStoryboard(name: story, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: nomeView)
        nav.pushViewController(viewController, animated: true)
    }
    // ********* Finish config navigation views *********
    
    // ********* Start config localData *********
    
    // salva os dados localmente
    public func salvaPlist(
        oDicionario dicionario: NSMutableDictionary,
        naPlist nomeArquivo: String
    ){
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documatsDirectory = paths[0]
        let plist = String.init(format: "%@.plist", nomeArquivo)
        let path = documatsDirectory.appending(plist)
        dicionario.write(toFile: path, atomically: true)
        
    }
    
    public func leituraPlist(nome nomePlist: String) -> NSMutableDictionary {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documatsDirectory = paths[0]
        let plist = String.init(format: "%@.plist", nomePlist)
        let path = documatsDirectory.appending(plist)
        let fileManager = FileManager.default
        if (!fileManager.fileExists(atPath: path)) {
            let bundle = Bundle.main.path(forResource: nomePlist, ofType: "plist")!
            do {
                try fileManager.copyItem(atPath: bundle, toPath: path)
            } catch {
                print("erro")
            }
        }
        var savedstock = NSMutableDictionary.init(contentsOfFile: path)
        if (savedstock == nil ) {
            savedstock = NSMutableDictionary()
        }
        return savedstock!
    }
}
