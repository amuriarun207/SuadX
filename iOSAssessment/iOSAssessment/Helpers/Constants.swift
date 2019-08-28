//
//  File.swift
//  iOSAssessment
//
//  Created by Amuri Arun Kumar on 27/8/19.
//  Copyright © 2019 Amuri Arun Kumar. All rights reserved.
//

import Foundation
import UIKit

#if DEBUG
let baseUrl = "https://api.nytimes.com/"
let NYApiKey = "cjImi071AkYyckXBfcGMJ66b4536EBOt"
#elseif TEST
let baseUrl = "https://api.nytimes.com/"
let NYApiKey = "cjImi071AkYyckXBfcGMJ66b4536EBOt"
#else
let baseUrl = "https://api.nytimes.com/"
let NYApiKey = "cjImi071AkYyckXBfcGMJ66b4536EBOt"
#endif


