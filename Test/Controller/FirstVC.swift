//
//  ViewController2.swift
//  Test
//
//  Created by Kunal's MacBook on 13/01/22.
//

import UIKit
import SafariServices



class FirstVC: UIViewController,getDataDelegateProtocol {
    @IBOutlet weak var label: UILabel!
    

    //MARK: -View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        //TODO: -To Do Sometiing
        SecondVC.delegate = self
        print("Hello World")
        print(Int.random(in: 1...5))


        //MARK: - Call of clouser
        loadPicture(from: "www.google.com"){picture in
            print("completion")
        } onFailure: {
            print("Fail")
        }

        //OR

        loadPicture(from: "www.loading.in", completion: {picture in
            print("completion")
        }, onFailure: {
            print("Fail")
        })
     
    }


    
    //FIXME: getData
    func getData(tempStr: String) {
        label.text = tempStr
        
    }
    
    
    @IBAction func buttonClick(_ sender: UIButton){
        let nav = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondVC") as! SecondVC
        self.navigationController?.pushViewController(nav, animated: true)
        
       // openSafari()
    }
    
    
    //MARK: - Clouser Example
    func loadPicture(from server: String?, completion: (_ picture: String) -> Void, onFailure: () -> Void) {
        if let picture = server {
            completion(picture)
        } else {
            onFailure()
        }
    }


    
    
    private func openSafari(){
        let config = SFSafariViewController.Configuration()
        config.entersReaderIfAvailable = false
        config.barCollapsingEnabled = true

        let url = URL(string: "https://www.google.com/")
        let vc = SFSafariViewController(url: url!, configuration: config)
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }

}

extension Double {
    var km: Double { return self * 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}


