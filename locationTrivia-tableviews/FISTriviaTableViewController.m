//
//  FISTriviaTableViewController.m
//  locationTrivia-tableviews
//
//  Created by Cenker Demir on 6/23/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISTriviaTableViewController.h"

@implementation FISTriviaTableViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    self.view.accessibilityLabel = @"Trivia Table";
    self.view.accessibilityIdentifier = @"Trivia Table";
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.trivia count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *triviaCell = [tableView dequeueReusableCellWithIdentifier:@"trivia cell"];
    
    triviaCell.textLabel.text = [[self.trivia objectAtIndex:indexPath.row] content];
    
    return triviaCell;
}


@end
