//
//  EarthquakeVideoViewController.m
//  Earthquake
//
//  Created by Yuxuan Chen on 2/4/14.
//  Copyright (c) 2014 Yuxuan Chen. All rights reserved.
//

#import "EarthquakeVideoViewController.h"

@interface EarthquakeVideoViewController ()

@end

@implementation EarthquakeVideoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view
    //NSString *stream = @"http://www.youtube.com/watch?v=FhUFLJ6tD9k";
    NSString *stream = @"/Resource/HaitiVideo.mp4";
    NSURL *url = [NSURL URLWithString:stream];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_video loadRequest:request];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
