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

@property (weak, nonatomic) UIImageView *backgroundImageView;

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

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImage *backgroundImage = [UIImage imageNamed: @"images/Design-Main_Page-Background.png"];
    [self.backgroundImageView setImage:backgroundImage];
    self.EQImages = [@[@"Img1.jpg",
                       @"Img2.jpg",
                       @"Img3.jpg",
                       @"Img4.jpg"] mutableCopy];
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
