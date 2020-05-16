import UIKit

class AllCategoryCell: UICollectionViewCell {

    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var numberLab: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        layer.borderWidth = 1
        layer.borderColor = UIColor (red: 232/255.0, green: 232/255.0, blue: 232/255.0, alpha: 1).cgColor
        
    }
    
    
    

}
