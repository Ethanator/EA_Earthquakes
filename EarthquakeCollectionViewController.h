//
//  EarthquakeCollectionViewController.h
//  Earthquake
//
//  Created by Jack Magiera on 2/18/14.
//  Copyright (c) 2014 Yuxuan Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EarthquakeCollectionCell.h"

@interface EarthquakeCollectionViewController : UICollectionViewController
<UICollectionViewDataSource, UICollectionViewDelegate>
@property (strong, nonatomic) NSMutableArray *EQImages;

@end
