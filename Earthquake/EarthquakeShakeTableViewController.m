//
//  EarthquakeShakeTableViewController.m
//  Earthquake
//
//  Created by Yuxuan Chen on 2/4/14.
//  Copyright (c) 2014 Yuxuan Chen. All rights reserved.
//

#import "EarthquakeShakeTableViewController.h"

@interface EarthquakeShakeTableViewController ()
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UILabel *slideLabel;


@end

@implementation EarthquakeShakeTableViewController

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
    _slideLabel.text = [NSString stringWithFormat:@"%0.1f", _slider.value];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [_slider addTarget:self action:@selector(sliderChanged:) forControlEvents:UIControlEventValueChanged];
    
    _slider.maximumValue = 10.0;
    _slider.minimumValue = 0.0;
    
    CGAffineTransform sliderRotation = CGAffineTransformIdentity;
    sliderRotation = CGAffineTransformRotate(sliderRotation, -(M_PI / 2));
    self.slider.transform = sliderRotation;
}

- (void)viewDidLayoutSubviews
{
}

- (void)sliderChanged:(id)sender
{
    if (sender == _slider) {
        _slideLabel.text = [NSString stringWithFormat:@"%0.1f", _slider.value];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
