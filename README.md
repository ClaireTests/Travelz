#  Culture Trip  - Code Assignment

## Details

1) Project created in Xcode 11.3  - Reason behind this is due to myself being unable to upgrade my Mac to Big Sur at the moment

2) Deployment target - iOS 13.2 

3) No 3rd party libraries / Pods where used for the app.  My reasoning for this was because often when using Pods for specific tasks they often include extra functionality that is not required / used and hence unneccessarily increase project size

4) The app does check for internet connectivity and displays a view to inform the user.  Instead of using the traditional Reachability code I adopted  the iOS 12 NWPathMonitor as a better approach, again helping to aviod using 3rd party library dependancies

5) Have used MVVM architecture to avoid the pitfalls of MVC (massive view controllers).  My reasoning here was that in addition to being more familiar with it, for this simple app VIPER may have been an overkill.  Althought I'm familiar with VIPER from a conceptual point of view I have never been exposed to it on any commercial projects.

6) Used a UICollectionView to display Article details as opposed to a UITableView as this will enable more flexiablity for screen layouts in the future - see Imporovements section

7) XCTests have not been included as I feel I need experience in this area, although it is something I'm keen to gain more exposure to

8) The home screen I felt needed to be more appealing, so in addition to adding a travel related background image I also attempted to add an animation which starts a few seconds after the app loads.  This was a rather last minute after thought so will also be included in the improvements sction.


## Improvements - For next Sprint!

1) Currently the app only works in Portrait mode - improve layouts to allow landscape mode e.g. have the CollectionView adapt to having horizontal layout in landscape mode

2) Work on the home screen animations

3) The Articles view Save and Likes icons are just used in imageviews at present.  Make them buttons and implement code to ensure that the buttons state is saved when scrolling in this screen due to cell reuse. 


