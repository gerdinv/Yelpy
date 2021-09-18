//
//  BusinessDetailsVC.swift
//  Unit1
//
//  Created by Gerdin Ventura on 9/18/21.
//

import UIKit

class BusinessDetailsVC: UIViewController {

    @IBOutlet weak var businessName: UILabel!
    
    @IBOutlet weak var newLabel: UILabel!
    
    var businessDetails: Business!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        businessName.text = businessDetails.name
        newLabel.text = businessDetails.phone

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
