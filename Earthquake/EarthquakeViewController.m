//
//  EarthquakeViewController.m
//  Earthquake
//
//  Created by Yuxuan Chen on 12/21/13.
//  Copyright (c) 2013 Yuxuan Chen. All rights reserved.
//

#import "EarthquakeViewController.h"

@interface EarthquakeViewController ()

@end

@implementation EarthquakeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)playVideo:(id)sender {
    NSString *stream = @"http://www.youtube.com/watch?v=FhUFLJ6tD9k";
    NSURL *url = [NSURL URLWithString:stream];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_video loadRequest:request];
}
@end
