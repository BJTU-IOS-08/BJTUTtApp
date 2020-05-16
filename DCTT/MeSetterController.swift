
import UIKit
import Kingfisher

class MeSetterController: MeBaseTableViewController , ShowAlertControllerAble {
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(setter_notification(_ :)), name: NSNotification.Name.init("setter_notification_status"), object: nil)
        
        let settings = UIApplication.shared.currentUserNotificationSettings
        let open = Int((settings?.types)!.rawValue) != 0

        
    }

    @objc func setter_notification(_ noti:Notification)  {
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        if User.isLogined() {
            return 1
        }
        
        return 0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch (indexPath.section,indexPath.row) {
        case (0,_):
            showMsg("\n确定退出？", title: "确定", handler: { [unowned self] in
                self._logout()
            })

            break
            

        default: break
        }
        if indexPath.section == 2 {
        }
        
        
    }

    
    
    
    func _logout(){
        UserDefaults.standard.setValue(nil, forKey: "userinfo")
        UserDefaults.standard.synchronize()
        HUD.showText("已退出登录", view: self.view)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5, execute: {[weak self] in
            NotificationCenter.default.post(name: updateUserInfoNotification, object: nil)
            
            guard let ss = self else {return}
            user_has_logined = false
            
            
            ss.navigationController?.popViewController(animated: true)
            })
    }

}
