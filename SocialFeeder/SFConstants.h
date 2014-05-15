//
//  SFConstants.h
//  SocialFeeder
//
//  Created by Mohamed Mokhles Waly on 5/14/14.
//  Copyright (c) 2014 Mokhles. All rights reserved.
//


/**
 *    Handling Shared variables among the app
 */

/**
 *  Feed Source
 */
typedef enum  {
	NYTimesSource = 1,
	Itunes = 2,
	FourSquare = 3
}FeedSource;

/**
 *  Filteration Type
 */
typedef enum  {
	Last7Days = 1,
	WithImage = 2,
}Filteration;


/**
 *  Sorting Options
 */
typedef enum  {
	DateNewest = 1,
	DateOldest = 2,
	AlphabeticalAscending = 3,
	AlphabeticalDescending = 4
}SortOptions;



/**
 *  Foursquare Keys
 */

#define FourSquareClientId @"2UKJUBXE3ZQAPEVGZL4E2OUNC4UFWWYHCAWQHWVGJJJF5QNY"
#define FourSquareSecret   @"1NWGAF3DL2GSIBGMTGVIQ4HDGAGOVWCCE5VH22IQUBN53Y33"
#define Dubizzle_lon  @25.0476643
#define Dubizzle_lat  @55.1817407



/**
 *  Sources URLS
 */



#define ItunesTopChart @"https://itunes.apple.com/eg/rss/topfreeipadapplications/limit=25/xml"

#define NYTimes @"http://rss.nytimes.com/services/xml/rss/nyt/MiddleEast.xml"

#define PlaceHolder @"http://charlestonharborproperties.com/images/no_image_available.png"

#define PlaceHolderNY @"http://www.userlogos.org/files/logos/bcm2009/nytimes.png"
