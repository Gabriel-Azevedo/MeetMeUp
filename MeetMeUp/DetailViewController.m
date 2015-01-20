//
//  DetailViewController.m
//  MeetMeUp
//
//  Created by Gabriel Borri de Azevedo on 1/19/15.
//  Copyright (c) 2015 Gabriel Enterprises. All rights reserved.
//

#import "DetailViewController.h"
#import "WebViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *rsvpLabel;
@property (weak, nonatomic) IBOutlet UILabel *groupInfoLabel;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.nameLabel.numberOfLines = 2;
    self.nameLabel.text = self.event.name;
    self.descriptionLabel.numberOfLines = 12;
    self.descriptionLabel.text = self.event.eventDescription;
    self.rsvpLabel.text = [NSString stringWithFormat:@"RSVP Count: %@",self.event.rsvpCount];
    self.groupInfoLabel.text = self.event.hostingInfo;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    WebViewController *webVC = segue.destinationViewController;
    webVC.url = self.event.url;
}


@end
