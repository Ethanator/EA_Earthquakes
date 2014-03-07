//
//  EarthquakeViewController.m
//  Earthquake
//
//  Created by Yuxuan Chen on 12/21/13.
//  Copyright (c) 2013 Yuxuan Chen. All rights reserved.
//

#import "EarthquakeViewController.h"

@interface EarthquakeViewController ()
@property (weak, nonatomic) IBOutlet UIButton *simButton;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UIWebView *videoView;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
- (IBAction)backToMainPage:(id)sender;
@end

@implementation EarthquakeViewController
@synthesize moviePlayer;

- (void) viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    /* Editted by Ethan on 3/3/2014
     * Lay out the background image on the main page.
     * Note: May need to put the images in a folder.
     */
    UIImage *backgroundImg = [UIImage imageNamed:@"Design-Main_Page.png"];
    self.backgroundImageView.image = backgroundImg;
    [self.view sendSubviewToBack:self.backgroundImageView];
    
    /* Editted by Ethan on 3/3/2014
     * Lay out the background image on the main page.
     * Note: May need to put the images in a folder.
     * BEGIN */
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/* Editted by Ethan on 3/6/2014
 * Allow the video to be played.
 */
- (IBAction)playVideo:(id)sender {
    self.videoView.hidden = NO;
    self.backButton.hidden = NO;
    NSString *stream = @"http://www.youtube.com/watch?v=FhUFLJ6tD9k";
    NSURL *url = [NSURL URLWithString:stream];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.videoView loadRequest:request];
}


- (IBAction)backToMainPage:(id)sender {
    self.videoView.hidden = YES;
    self.backButton.hidden = YES;
}
@end
