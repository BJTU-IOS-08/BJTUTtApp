
import UIKit
import RxSwift
import SwiftTTPageController

class HomeViewController: BaseViewController ,TTPageViewControllerDelegate,TTHeadViewDelegate,UITextFieldDelegate{
    var vcArr = [BaseTableViewController]()
    var pagevc :TTPageViewController!
    var topview : TTHeadView!
    let _logo_title = "无忧论坛"
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        get{
            return .lightContent
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        automaticallyAdjustsScrollViewInsets = false;
//        t_barTintColor = UIColor.red;

        _init()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
//        self.navigationController?.navigationBar.barTintColor = UIColorFromHex(rgbValue: 0xFF4500)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let has =  UserDefaults.standard.value(forKey: "isFirstLaunch") as? String , has == "1"{
           return
        }
        
        _showAgreement2()
    }
    

    func _showAgreement2() {
        let vc = SimplePrivacyController()
        let nav = BaseNavigationController(rootViewController: vc)
        //        vc.modalPresentationStyle = .popover;
        //        let rect = CGRect (x: 0, y: 0, width: 300, height: 200)
        //        vc.view.frame = rect
        //        vc.preferredContentSize = rect.size
        //vc.view.backgroundColor = UIColor.red
        
        self.present(nav, animated: true, completion: nil);
    }
    
    func _init() {
        //head
        let titles = ["最新","热门", "校园", "吐槽"]
        let titlesId = [
            "最新":"0",
            "热门":"1",
            "校园" : "2",
            "吐槽": "3"
        ]
        
        let _w :CGFloat = 50.0 * CGFloat(titles.count) < kCurrentScreenWidth ? 55 : 50
        var attri = TTHeadTextAttribute()
        attri.itemWidth = _w
        attri.defaultFontSize = 16
        attri.selectedFontSize = 16
        attri.selectedTextColor = UIColorFromHex(rgbValue: 0xff4500)
        attri.bottomLineColor = UIColorFromHex(rgbValue: 0xff4500)
        attri.bottomLineHeight = 2
        
        let bg = UIView.init(frame: CGRect (x: 0, y: 0, width: kCurrentScreenWidth, height: 35));
        
        topview  = TTHeadView (frame: CGRect (x: 0, y: 0, width: _w * CGFloat(titles.count) , height: 35), titles: titles, delegate: self ,textAttributes:attri)
        topview.backgroundColor = UIColorFromHex(rgbValue: 0xff4500)
        bg.addSubview(topview);
        self.navigationItem.titleView = bg
        
        ////pagevc
        for i in 0..<titles.count {
            let t = titles[i]
            
            let v = HomerListViewController(String.isNullOrEmpty(titlesId[t]));
            //v.view.frame =  CGRect (x: 0, y: 0, width: kCurrentScreenWidth, height: _h - 49)
            vcArr.append(v)
        }
        
        let rec = CGRect (x: 0, y: 0, width: kCurrentScreenWidth, height: kCurrentScreenHeight - 50)
        pagevc = TTPageViewController(controllers:vcArr, frame: rec, delegate:self)
        
        self.addChild(pagevc)
        view.addSubview(pagevc.view)
        
        //navigationbar item
        let logo_lable = UILabel (frame: CGRect (x: 0, y: 0, width: kCurrentScreenWidth, height: 30))
        logo_lable.text = _logo_title
        logo_lable.font = UIFont.systemFont(ofSize: 17)
        logo_lable.textColor = UIColorFromHex(rgbValue: 0xdcdcdc);
        logo_lable.textAlignment = .center
    }
    
    
    //MARK: -
    func tt_headViewSelectedAt(_ index: Int) {
        pagevc.scrollToPageAtIndex(index)
    }
    
    func tt_pageControllerSelectedAt(_ index: Int) {
        
        topview.scrollToItemAtIndex(index);
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        let vc = HomeSearchViewController()

        self.navigationController?.pushViewController(vc, animated: true)
        
        return false
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
