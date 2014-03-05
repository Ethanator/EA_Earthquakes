//
//  EarthquakeCollectionViewController.m
//  Earthquake
//
//  Created by Jack Magiera on 2/18/14.
//  Copyright (c) 2014 Yuxuan Chen. All rights reserved.
//

#import "EarthquakeCollectionViewController.h"
#import "EarthquakeCollectionCell.h"

@interface EarthquakeCollectionViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@end

@implementation EarthquakeCollectionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark -
#pragma mark UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.EQImages.count;
}

/* Editted by Ethan on 3/3/2014
 * Allow the navigation bar to pop up.
 */

- (void) viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillAppear:animated];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    /* Editted by Ethan on 3/3/2014
     * Change the tint of the navigation bar.
     * Change the background image of the page.
     */
    
    UIImage *backgroundImg = [UIImage imageNamed:@"Design-Other_Pages-Background.png"];
    self.backgroundImageView.image = backgroundImg;
    [self.view sendSubviewToBack:self.backgroundImageView];
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.0f/255.0f green:192.0f/255.0f        blue:255.0f/255.0f alpha:1.0f];
    self.navigationController.navigationBar.translucent = NO;
    
    /* Editted by Ethan on 3/4/2014
     * Reorganize the collection view cells.
     */
    UICollectionViewFlowLayout *flow = (UICollectionViewFlowLayout*) self.collectionViewLayout;
    flow.sectionInset = UIEdgeInsetsMake(90.0f, 15.0f, 10.0f, 15.0f);
    
    self.EQImages = [@[@"Bridge-1.png",
                       @"Hospital-1.png",
                       @"House-1.png"] mutableCopy];
	// Do any additional setup after loading the view.
    [self.collectionView registerClass:[EarthquakeCollectionCell class] forCellWithReuseIdentifier:@"EQCell"];
}

-(EarthquakeCollectionCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    EarthquakeCollectionCell *eqCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"EQCell" forIndexPath:indexPath];
    
    UIImage *img;
    long row = [indexPath row];
    
    img = [UIImage imageNamed:self.EQImages[row]];
    eqCell.eqImageView = [[UIImageView alloc] initWithFrame:eqCell.bounds];
    [eqCell addSubview:eqCell.eqImageView];
    [eqCell.eqImageView setImage:img];
    return eqCell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    // TODO: Select Item
    
}
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    // TODO: Deselect item
}



@end
