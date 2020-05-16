
import UIKit

class MeBaseTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.backgroundColor = tt_bg_color
        
        tableView.separatorColor = UIColor (red: 232/255.0, green: 232/255.0, blue: 232/255.0, alpha: 1)
        tableView.showsVerticalScrollIndicator = false
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if (self.navigationController?.navigationBar.isHidden)! {
            self.navigationController?.setNavigationBarHidden(false, animated: animated)
        }
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source


}
