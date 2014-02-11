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

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (motion == UIEventSubtypeMotionShake)
    {
        [self shakePressed:self];
    } 
}

- (BOOL) canBecomeFirstResponder
{
    return TRUE;
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
    
    [self.slider setMinimumTrackImage:[[UIImage imageNamed:@"slider.png"] stretchableImageWithLeftCapWidth:10.0 topCapHeight:0.0] forState:UIControlStateNormal ];
    [self.slider setMaximumTrackImage:[[UIImage imageNamed:@"slider.png"] stretchableImageWithLeftCapWidth:10.0 topCapHeight:0.0] forState:UIControlStateNormal ];
    [self.slider setThumbImage:[UIImage imageNamed:@"slider2.png"] forState:UIControlStateNormal];
    
    //debugging
    NSAssert(self.buildingImage, @"self.imageView is nil. Check your IBOutlet connections");
    UIImage* firstImage = [UIImage imageNamed:@"houseTest1.png"];
    NSAssert(firstImage, @"firstImage is nil. Check that you added the image to your bundle and that the filename above matches the name of you image.");
    
    _slider.maximumValue = 9.9;
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
    UIImage* nextImage = [UIImage imageNamed:@"houseTest0.png"];
    NSAssert(nextImage, @"nextImage is nil. Check that you added the image to your bundle and that the filename above matches the name of you image.");
    self.buildingImage.image = nextImage;
    
    self.shakeButton.hidden = FALSE;
    self.slideLabel.hidden = FALSE;
    self.slider.hidden = FALSE;
    self.replayButton.hidden = TRUE;
}

- (IBAction)shakePressed:(id)sender
{
    int intIntensity = (int) self.slider.value;
    NSString *nextImgNum = [NSString stringWithFormat:@"%d",intIntensity];
    
    NSString *nextImgName = [NSString stringWithFormat:@"houseTest%@.png", nextImgNum];

    UIImage* nextImage = [UIImage imageNamed:nextImgName];
    NSAssert(nextImage, @"nextImage is nil. Check that you added the image to your bundle and that the filename above matches the name of you image.");
    self.buildingImage.image = nextImage;
        
    self.shakeButton.hidden = TRUE;
    self.slideLabel.hidden = TRUE;
    self.slider.hidden = TRUE;
    self.replayButton.hidden = FALSE;

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
