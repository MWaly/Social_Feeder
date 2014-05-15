Social_Feeder
=============
Social Feeder is a demo application aggregating data from different feeds.

Features
- One tableview with data aggregated from Itunes Top Charts , NYTimes middleeast and Foursquare trending places
- Filteration to select certain sources
- Redirection to itunes store or safari 

Approaches 
- Different cell design for each source
- Full decoupling between different layers
- Cocoa pods project so it runs from workspace
- MWFeedparser for RSS feeds parsing
- AFNetworking for network communication
- KDropmenu for multiple choice popover 
- Foursquare 2 API for foursquare handling  purposes 


Release Issues
- No sorting handling 
- Issue with date retrieved 
- No Re-arrangement 
- Tested on 4 inches simulator only
- Portrait mode only 
- No unit tests were performed 
