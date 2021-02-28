
//
//  ViewController.swift
//  State of The Cloud
//
//  Created by Dmitry Aksyonov on 26.02.2021.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
	
	@IBOutlet weak var label1: UILabel!
	@IBOutlet weak var label2: UILabel!
	@IBOutlet weak var label3: UILabel!
	@IBOutlet weak var label4: UILabel!
	@IBOutlet weak var label5: UILabel!
	@IBOutlet weak var label6: UILabel!
	@IBOutlet weak var label7: UILabel!
	@IBOutlet weak var label8: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		CloudEyeAPIClient.shared.getAllAPIVersions()
	}
}
