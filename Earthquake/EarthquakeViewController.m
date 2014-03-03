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
    
    UIImage *backgroundImg = [UIImage imageNamed:@"Design-Main_Page.png"];
    self.backgroundImageView.image = backgroundImg;
    [self.view sendSubviewToBack:self.backgroundImageView];
    
    UIImage *bgImg = [UIImage imageNamed:@"button1.png"];
    UIEdgeInsets insets = UIEdgeInsetsMake(10, 10, 10, 10);
    UIImage *strImg = [bgImg resizableImageWithCapInsets:insets resizingMode:UIControlStateNormal];
    [self.simButton setBackgroundImage:strImg forState:UIControlStateNormal];
    [self.vidButton setBackgroundImage:strImg forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
