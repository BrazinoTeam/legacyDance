//
//  ForestOfTrialsVC.swift

import Foundation
import UIKit
import SnapKit

class ForestOfTrialsVC: UIViewController {
    
    var contentView: ForestOfTrialsView {
        view as? ForestOfTrialsView ?? ForestOfTrialsView()
    }
    
    override func loadView() {
        view = ForestOfTrialsView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        selectBtn()
    }
    
    
    private func selectBtn() {
        contentView.btnBuild.addTarget(self, action: #selector(goBuild), for: .touchUpInside)
        contentView.btnSwim.addTarget(self, action: #selector(goSwim), for: .touchUpInside)
        contentView.btnBack.addTarget(self, action: #selector(backNavigate), for: .touchUpInside)
    }
    
    @objc func goBuild() {
        let vc = BuildARaftVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func goSwim() {
        let vc = SwimAcrossTheRiverVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func backNavigate() {
        navigationController?.popToRootViewController(animated: true)
    }
  

}
