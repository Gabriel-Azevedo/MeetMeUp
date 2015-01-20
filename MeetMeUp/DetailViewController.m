//
//  DetailViewController.m
//  MeetMeUp
//
//  Created by Gabriel Borri de Azevedo on 1/19/15.
//  Copyright (c) 2015 Gabriel Enterprises. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *rsvpLabel;
@property (weak, nonatomic) IBOutlet UILabel *groupInfoLabel;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.nameLabel.text = self.event.name;
    self.descriptionLabel = self.event.description;
    sef
}

@end
