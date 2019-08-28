# iOSAssessment - NYTimesMostPopular News 

## Code
- Swift 4.2
- Minimum deployment target iOS 11.0 

## Build Requirements
 - **Xcode 10.2.1 (10A255)
 - Command Line Tools: Xcode 10.2.1
 - Cocoapods 

## Available build configuration
- DEBUG	: (http://api.nytimes.com)
- TEST 	: (http://api.nytimes.com)
- RELEASE : http://api.nytimes.com)

## Project Structure
- 📁 StoryBoards : StoaryBoards used for the project. Currently we have only one ie. Main.storyBoard
- 📁 ViewControllers	: All UIViewControllers of the project
- 📁 Views : Custom views 
- 📁 Extensions	: All extensions
- 📁 Global	: General content
- 📁 Models	: All models
- 📁 Helpers    : All helper classes
- 📁 Network    : All classes related to Network layer (URLSessions)
- 📁 Vendors    :All third party related files

##### Additional information
- Project doesn't have any client database all data is either saved in Keychain or user defaults.
- There are no unit/ui tests.

##### Constraints
- It's not possible to debug using devices higher than iOS 12 (max version Xcode 10.0 supports)
- It's not possible to use any Xcode version superior to 10.0 unless migrating code to swift  version paralley

##### Cocopods 
- SwiftyJSON for paring raw data into swift dictionaries 
- PINRemoteImage for assigning url's meta data to UIIMageviews


