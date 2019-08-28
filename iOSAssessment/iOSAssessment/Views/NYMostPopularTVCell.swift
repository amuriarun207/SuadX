//
//  NYMostPopularCell.swift
//  iOSAssessment
//
//  Created by Amuri Arun Kumar on 27/8/19
//  Copyright © 2019 Amuri Arun Kumar. All rights reserved.
//

import UIKit

class NYMostPopularTVCell: UITableViewCell {
    
    @IBOutlet weak var newsDateLabel: UILabel!
    @IBOutlet weak var newsByLineLabel: UILabel!
    @IBOutlet weak var newsAbstractLabel: UILabel!
    @IBOutlet weak var newsImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.newsImageView.layer.cornerRadius  = self.newsImageView.frame.height/2
        self.newsImageView.layer.masksToBounds  = true
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func configureCell(data: Results) {
        newsAbstractLabel.text  = data.abstract
        newsDateLabel.text  =    data.publishedDate
        newsByLineLabel.text  =  data.byline
        if  let mediaUrl = data.media?.first?.mediaMetaData?.first?.url, let imageUrl = URL(string: mediaUrl){
            newsImageView.pin_setImage(from: imageUrl)
        }
    }
}


