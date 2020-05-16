
import UIKit

class HomeListBaseCell: UITableViewCell ,DisLikeButtonStyle{

    ///sy,life
    var type:String?
    
    func fill(_ d:[String:Any]) {}
    
    ///点击不喜欢处理操作
    var dislikeBlock:(() -> Void)?
    
}
