//
//  FISLocationsTableViewController.h
//  locationTrivia-tableviews
//
//  Created by Cenker Demir on 6/23/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FISLocation.h"
#import "FISTriviaTableViewController.h"

@interface FISLocationsTableViewController : UITableViewController

@property (strong, nonatomic) NSArray *locations;
@property (strong, nonatomic)NSMutableArray *triviaToSend;

@end
