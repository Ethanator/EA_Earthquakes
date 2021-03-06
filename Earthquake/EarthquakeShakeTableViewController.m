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
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UILabel *afterPicText;
@property (weak, nonatomic) IBOutlet UILabel *richterScale;

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
    
    
    /* Editted by Ethan on 3/6/2014
     * Change the tint of the navigation bar.
     * Change the background image of the page.
     */
    
    UIImage *backgroundImg = [UIImage imageNamed:@"Design-Other_Pages-Background-No_Text.png"];
    self.backgroundImageView.image = backgroundImg;
    [self.view sendSubviewToBack:self.backgroundImageView];
    
    
    [_slider addTarget:self action:@selector(sliderChanged:) forControlEvents:UIControlEventValueChanged];
    
    [self.shakeButton addTarget:self action:@selector(shakePressed:) forControlEvents:UIControlEventTouchDown];
    [self.replayButton addTarget:self action:@selector(replayPressed:) forControlEvents:UIControlEventTouchDown];
    
    [self.slider setMinimumTrackImage:[[UIImage imageNamed:@"Design-Slider_Bar.png"] stretchableImageWithLeftCapWidth:10.0 topCapHeight:0.0] forState:UIControlStateNormal ];
    [self.slider setMaximumTrackImage:[[UIImage imageNamed:@"Design-Slider_Bar.png"] stretchableImageWithLeftCapWidth:10.0 topCapHeight:0.0] forState:UIControlStateNormal ];
    [self.slider setThumbImage:[UIImage imageNamed:@"Design-Slider_Thumb.png"] forState:UIControlStateNormal];
    
    //debugging
    NSAssert(self.buildingImage, @"self.imageView is nil. Check your IBOutlet connections");
    NSString *firstImgName = [NSString stringWithFormat:@"%@1.png", self.buildingType];
    UIImage* firstImage = [UIImage imageNamed:firstImgName];
    NSAssert(firstImage, @"firstImage is nil. Check that you added the image to your bundle and that the filename above matches the name of you image.");
    
    _slider.maximumValue = 9.9;
    _slider.minimumValue = 0.0;
    
    _buildingImage.image = firstImage;
    _buildingImage.contentMode = UIViewContentModeScaleAspectFit;
    
    CGAffineTransform sliderRotation = CGAffineTransformIdentity;
    sliderRotation = CGAffineTransformRotate(sliderRotation, -(M_PI / 2));
    self.slider.transform = sliderRotation;
}

- (void)replayPressed:(id)sender
{
    self.afterPicText.backgroundColor = [UIColor clearColor];
    self.afterPicText.text = @"";
    
    NSString *nextImgName = [NSString stringWithFormat:@"%@1.png", self.buildingType];
    UIImage* nextImage = [UIImage imageNamed:nextImgName];
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
    if (intIntensity < 1) intIntensity = 1.1;
    NSString *nextImgNum = [NSString stringWithFormat:@"%d",intIntensity];
    
    NSString *nextImgName = [NSString stringWithFormat:@"%@%@.png", self.buildingType, nextImgNum];
    
    /* Editted by Ethan on 3/6/2014
     * Get the level of the earthquake and display explanations.
     */
    NSCharacterSet *delimiters = [NSCharacterSet characterSetWithCharactersInString:@"-."];
    NSInteger richter = [[nextImgName componentsSeparatedByCharactersInSet:delimiters][1] integerValue];
    self.afterPicText.backgroundColor = [UIColor yellowColor];
    self.afterPicText.text = [NSString stringWithFormat:@"%@\n\n", self.richterScale.text];
    switch (richter) {
        case 1:
            self.afterPicText.text = [NSString stringWithFormat:@"%@%@", self.afterPicText.text, @"Nothing felt, but detected by instruments."];
            break;
        case 2:
            self.afterPicText.text = [NSString stringWithFormat:@"%@%@", self.afterPicText.text, @"Felt by very few people."];
            break;
        case 3:
                self.afterPicText.text = [NSString stringWithFormat:@"%@%@", self.afterPicText.text, @"Felt by many, often mistaken for a passing vehicle."];
            break;
        case 4:
            self.afterPicText.text = [NSString stringWithFormat:@"%@%@", self.afterPicText.text, @"Felt by many indoors, dishes and doors disturbed."];
            break;
        case 5:
            self.afterPicText.text = [NSString stringWithFormat:@"%@%@", self.afterPicText.text, @"Felt by nearly everyone. People awakened. Cracked walls, trees disturbed."];
            break;
        case 6:
            self.afterPicText.text = [NSString stringWithFormat:@"%@%@", self.afterPicText.text, @"Felt by all. Many run outdoors. Furniture moves. Slight damage occurs."];
            break;
        case 7:
            self.afterPicText.text = [NSString stringWithFormat:@"%@%@", self.afterPicText.text, @"Poorly built buildings suffer severe damage. Slight damage every where else."];
            break;
        case 8:
            self.afterPicText.text = [NSString stringWithFormat:@"%@%@", self.afterPicText.text, @"Everyone runs outdoors. Moderate to major damage. Minor damage to specially designed buildings. Chimneys and walls collapse."];
            break;
        case 9:
            self.afterPicText.text = [NSString stringWithFormat:@"%@%@", self.afterPicText.text, @"All buildings suffer major damage. Ground cracks, pipes break, foundations shift."];
            break;
        default:
            break;
    }

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
