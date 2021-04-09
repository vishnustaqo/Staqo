//
//  NotificationVC.swift
//  Staqo
//
//  Created by SHAILY on 26/03/21.
//

import UIKit

class NotificationVC: BaseVC, UITableViewDelegate {
    var viewModel:NotificationViewModel!
    
    var header:HeaderView!
    @IBOutlet weak var herderView: HeaderView!
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var nTwoViewThree: UIView!
    @IBOutlet weak var nTwoViewTwo: UIView!
    @IBOutlet weak var nTwoViewOne: UIView!
    @IBOutlet weak var innerTwoView: UIView!
    @IBOutlet weak var shadowTwoView: UIView!
    @IBOutlet weak var dateTimeTwoBackView: UIView!
    @IBOutlet weak var thirdNotiView: UIView!
    @IBOutlet weak var secondNotiView: UIView!
    @IBOutlet weak var FirstNotiView: UIView!
    @IBOutlet weak var notificationInnerView: UIView!
    @IBOutlet weak var notificationShadowView: UIView!
    @IBOutlet weak var dateBackView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        header = HeaderView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height:70))
        header.delegate = self
       herderView.addSubview(header)
        viewModel = NotificationViewModel(dataSource: NotificationDataSource())
        viewModel.delegate = self
        viewModel._delegate = self
        viewModel.bootstrap()
        
//        self.tblView.delegate = self
//        self.tblView.dataSource = self
        tblView.register(UINib(nibName: "NotificationTableViewCell", bundle: nil), forCellReuseIdentifier: "NotificationTableViewCell")
       
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
       header.btnProfile.isHidden = true
       header.btnNotiyCount.isHidden = true
        header.BtnMenu.setImage(UIImage(named: "backArrow"), for: .normal)
        header.btnLogout.setImage(UIImage(named: "profiled"), for: .normal)
        self.navigationController?.isNavigationBarHidden = true
    }


}
extension NotificationVC : ViewModelDelegate{
    func willLoadData() {
        startLoader()
    }
    
    func didLoadData() {
        stopLoader()
        
        tblView.reloadData()
        
        
    }
    
    func didFail(error: CustomError) {
        showErrorMessage(title: "Error", error: error) { (action) in
            
        }
        stopLoader()
    }
    
    
}

extension NotificationVC: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.rows?.count ?? 0
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationTableViewCell", for: indexPath) as? NotificationTableViewCell
        cell?.dataBind(data: viewModel.rows, index: indexPath)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        showErrorMessage(title: viewModel.rows?[indexPath.row].fields?.title ?? "", message: viewModel.rows?[indexPath.row].fields?.Description ?? "") { (action) in
            self.viewModel.addNotification(ID:  self.viewModel.rows?[indexPath.row].fields?.id ?? "", notifyID:  self.viewModel.rows?[indexPath.row].fields?.id ?? "", email: UserDefaults.standard.getProfile()?.email ?? "", flag: "1")
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}


extension NotificationVC : NotificationViewModelDelegate {
    func didGetnotification() {
        viewModel.bootstrap()
    }
}
extension NotificationVC: HeaderViewDelegate{
    func btnMenuTapped(sender: UIButton) {
        
        _ = navigationController?.popViewController(animated: true)

    }
    
    func btnProfileTapped(sender: UIButton) {
       
    }
    
    func btnLogoutTapped(sender: UIButton) {
        let vc = Constant.getViewController(storyboard: Constant.kHomeStoryboard, identifier: Constant.kEmpVC, type: EmpVC.self)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}