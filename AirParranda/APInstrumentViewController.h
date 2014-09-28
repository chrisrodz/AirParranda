//
//  APInstrumentViewController.h
//  AirParranda
//
//  Created by Christian A. Rodriguez on 9/27/14.
//  Copyright (c) 2014 Mai Apps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface APInstrumentViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *instrumentName;

@property (strong, nonatomic) NSString *name;
@property (weak, nonatomic) IBOutlet UILabel *instrument;
@property (weak, nonatomic) NSMutableArray *musicPlayers;

@end
