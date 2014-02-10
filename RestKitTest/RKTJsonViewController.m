//
//  RKTJsonViewController.m
//  RestKitTest
//
//  Created by Andrew Romanov on 06.02.14.
//  Copyright (c) 2014 Andrew Romanov. All rights reserved.
//

#import "RKTJsonViewController.h"
#import "RKTSourceProvider.h"


@interface RKTJsonViewController ()

@property (nonatomic, strong) IBOutlet UITextView* textView;
@property (nonatomic, strong) IBOutlet UIActivityIndicatorView* activityIndicator;

@end

@implementation RKTJsonViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	[_activityIndicator startAnimating];
	_textView.text = nil;
	
	__weak RKTJsonViewController* selfWeak = self;
	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
		RKTSourceProvider* provider = [[RKTSourceProvider alloc] init];
		NSString* json = [provider loadJson];
		if (selfWeak)
		{
			__strong RKTJsonViewController* selfStrong = selfWeak;
			dispatch_sync(dispatch_get_main_queue(), ^{
				[selfStrong.activityIndicator stopAnimating];
				selfStrong.textView.text = json;
			});
		}
	});
}


+ (instancetype)controller
{
	RKTJsonViewController* controller = [[RKTJsonViewController alloc] initWithNibName:@"RKTJsonViewController" bundle:nil];
	return controller;
}

@end
