//
//  EarthquakeViewController.m
//  Earthquake
//
//  Created by Yuxuan Chen on 12/21/13.
//  Copyright (c) 2013 Yuxuan Chen. All rights reserved.
//

#import "EarthquakeViewController.h"

@interface EarthquakeViewController ()
@property (weak, nonatomic) IBOutlet UIButton *vidButton;
@property (weak, nonatomic) IBOutlet UIButton *simButton;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@end

@implementation EarthquakeViewController

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
@end
