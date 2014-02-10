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

@property (weak, nonatomic) IBOutlet UIImageView *buildingImage;
@property (weak, nonatomic) IBOutlet UIButton *shakeButton;
@property (weak, nonatomic) IBOutlet UIButton *replayButton;

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
    self.replayButton.hidden = TRUE;
    _slideLabel.text = [NSString stringWithFormat:@"%0.1f", _slider.value];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [_slider addTarget:self action:@selector(sliderChanged:) forControlEvents:UIControlEventValueChanged];
    
    [self.shakeButton addTarget:self action:@selector(shakePressed:) forControlEvents:UIControlEventTouchDown];
    [self.replayButton addTarget:self action:@selector(replayPressed:) forControlEvents:UIControlEventTouchDown];
    
    //debugging
    NSAssert(self.buildingImage, @"self.imageView is nil. Check your IBOutlet connections");
    UIImage* firstImage = [UIImage imageNamed:@"houseTest1.png"];
    NSAssert(firstImage, @"firstImage is nil. Check that you added the image to your bundle and that the filename above matches the name of you image.");
    
    _slider.maximumValue = 10.0;
    _slider.minimumValue = 0.0;
    
    _buildingImage.image = firstImage;
    _buildingImage.contentMode = UIViewContentModeScaleAspectFit;
    
    CGAffineTransform sliderRotation = CGAffineTransformIdentity;
    sliderRotation = CGAffineTransformRotate(sliderRotation, -(M_PI / 2));
    self.slider.transform = sliderRotation;
}

- (void)viewDidLayoutSubviews
{
}

- (void)replayPressed:(id)sender
{
    UIImage* nextImage = [UIImage imageNamed:@"houseTest1.png"];
    NSAssert(nextImage, @"nextImage is nil. Check that you added the image to your bundle and that the filename above matches the name of you image.");
    self.buildingImage.image = nextImage;
    
    self.shakeButton.hidden = FALSE;
    self.slideLabel.hidden = FALSE;
    self.slider.hidden = FALSE;
    self.replayButton.hidden = TRUE;
}

- (void)shakePressed:(id)sender
{
    if (sender == _shakeButton && _slider.value > 4.9){
        UIImage* nextImage = [UIImage imageNamed:@"houseTest2.png"];
        NSAssert(nextImage, @"nextImage is nil. Check that you added the image to your bundle and that the filename above matches the name of you image.");
        self.buildingImage.image = nextImage;
        
        self.shakeButton.hidden = TRUE;
        self.slideLabel.hidden = TRUE;
        self.slider.hidden = TRUE;
        self.replayButton.hidden = FALSE;
    }
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
