//
//  DetailViewController.h
//  CocoaHeadsBnuDemo
//
//  Created by João Paulo Ros on 30/04/15.
//  Copyright (c) 2015 PremierSoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

