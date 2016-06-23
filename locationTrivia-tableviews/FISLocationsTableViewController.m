//
//  FISLocationsTableViewController.m
//  locationTrivia-tableviews
//
//  Created by Cenker Demir on 6/23/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISLocationsTableViewController.h"

@implementation FISLocationsTableViewController


-(void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.accessibilityLabel = @"Locations Table";
    self.view.accessibilityIdentifier = @"Locations Table";
    
    FISLocation *location1 = [[FISLocation alloc] initWithName:@"The Empire State Building"
                                                      latitude:40.7484
                                                     longitude:-73.9857];
    
    FISTrivium *trivia1A = [[FISTrivium alloc] initWithContent:@"1,454 Feet Tall" likes:4];
    FISTrivium *trivia1B = [[FISTrivium alloc] initWithContent:@"Cost $24,718,000 to build" likes:2];
    
    [location1.trivia addObjectsFromArray:@[trivia1A, trivia1B]];
    
    FISLocation *location2 = [[FISLocation alloc] initWithName:@"Bowling Green"
                                                      latitude:41.3739
                                                     longitude:-83.6508];
    
    FISTrivium *trivia2A = [[FISTrivium alloc] initWithContent:@"NYC's oldest park" likes:8];
    FISTrivium *trivia2B = [[FISTrivium alloc] initWithContent:@"Made a park in 1733" likes:2];
    FISTrivium *trivia2C = [[FISTrivium alloc] initWithContent:@"Charging Bull was created in 1989" likes:0];
    
    
    [location2.trivia addObjectsFromArray:@[trivia2A, trivia2B, trivia2C]];
    
    FISLocation *location3 = [[FISLocation alloc] initWithName:@"Statue Of Liberty"
                                                      latitude:40.6892
                                                     longitude:74.0444];
    FISTrivium *trivia3A = [[FISTrivium alloc] initWithContent:@"Gift from the french" likes:6];
    
    [location3.trivia addObjectsFromArray:@[trivia3A]];
    
    
    // Add them to the locations property on FISLocationsTableViewController
    self.locations = @[location1,location2,location3];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.locations count];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *currentCell = [tableView dequeueReusableCellWithIdentifier:@"location cell"];
    
    currentCell.textLabel.text = [[self.locations objectAtIndex:indexPath.row] name];
   
    currentCell.detailTextLabel.text = [NSString stringWithFormat:@"%lu", [[[self.locations objectAtIndex:indexPath.row] trivia] count] ];
    
    return currentCell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    NSIndexPath *ip = [self.tableView indexPathForSelectedRow];
    FISLocation *location = self.locations[ip.row];
    FISTriviaTableViewController *triviaTVC = (FISTriviaTableViewController *)segue.destinationViewController;
    triviaTVC.trivia = location.trivia;
}

@end
