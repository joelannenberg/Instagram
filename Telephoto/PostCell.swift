//
//  PostCell.swift
//  Telephoto
//
//  Created by Joel Annenberg on 3/19/16.
//  Copyright © 2016 Joel A. All rights reserved.
//

import UIKit
import Parse
import AFNetworking

class PostCell: UITableViewCell {

    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var caption: UILabel!
    
    var post: PFObject! {
        didSet {
            
            postImageView.layer.cornerRadius = 5
            postImageView.clipsToBounds = true
            
            caption.text = post["caption"] as? String
            let file = post["media"] as? PFFile
            let url = NSURL(string: (file?.url)!)
            postImageView.setImageWithURL(url!)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
