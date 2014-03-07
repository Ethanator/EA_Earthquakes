//
//  EarthquakeViewController.h
//  Earthquake
//
//  Created by Yuxuan Chen on 12/21/13.
//  Copyright (c) 2013 Yuxuan Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface EarthquakeViewController : UIViewController

@property (nonatomic, strong) MPMoviePlayerController *moviePlayer;
- (IBAction)playVideo:(id)sender;
@end
