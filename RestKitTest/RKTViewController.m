//
//  RKTViewController.m
//  RestKitTest
//
//  Created by Andrew Romanov on 28.01.14.
//  Copyright (c) 2014 Andrew Romanov. All rights reserved.
//

#import "RKTViewController.h"
#import "RKTJsonViewController.h"
#import "RKTParsingOperator.h"
#import "RKTSourceProvider.h"

#import "RKTAppDelegate.h"


@interface RKTViewController () <RKTParsingOperatorDelegate>

@property (nonatomic, strong) IBOutlet UIButton* parceButton;
@property (nonatomic, strong) IBOutlet UILabel* parceByHandResultLabel;
@property (nonatomic, strong) IBOutlet UILabel* parceByEasyMappingResultLabel;
@property (nonatomic, strong) IBOutlet UILabel* parceByRestKitResult;
@property (nonatomic, strong) UIBarButtonItem* showJsonButton;
@property (nonatomic, strong) NSOperationQueue* parsingQueue;

@property (nonatomic, strong) RKTParsingOperator* parsingOperator;

- (IBAction)parceButtonAction:(id)sender;
- (void)viewJsonAction:(id)sender;

@end


@interface RKTViewController (Private)

- (void)_clearResultLabels;
- (UILabel*)_getResultLabelForType:(RKTParsingType)type;
- (void)_setParsingResult:(RKTParsingResult*)result toLabel:(UILabel*)label;

@end


@implementation RKTViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
	if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])
	{
		_parsingQueue = [[NSOperationQueue alloc] init];
		_parsingQueue.maxConcurrentOperationCount = 1;
	}
	
	return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	self.title = @"Parsing";
	_showJsonButton = [[UIBarButtonItem alloc] initWithTitle:@"json"
																		style:UIBarButtonItemStylePlain
																	  target:self
																	  action:@selector(viewJsonAction:)];
	self.navigationItem.rightBarButtonItem = _showJsonButton;
	
	_parsingOperator = [[RKTParsingOperator alloc] init];
	_parsingOperator.delegate = self;
	_parsingOperator.queue = _parsingQueue;
	RKTSourceProvider* sourceProvider = [[RKTSourceProvider alloc] init];
	_parsingOperator.source = [sourceProvider loadSource];
	
	[self _clearResultLabels];
}


+ (instancetype)controller
{
	RKTViewController* contorller = [[RKTViewController alloc] initWithNibName:@"RKTViewController" bundle:nil];
	return contorller;
}


#pragma mark Actions
- (IBAction)parceButtonAction:(id)sender
{
	if ([_parsingOperator isFinishedAllParsing])
	{
		[self _clearResultLabels];
		[_parceButton setTitle:@"Parsing..." forState:UIControlStateNormal];
		[_parsingOperator start];
	}
}


- (void)viewJsonAction:(id)sender
{
	RKTJsonViewController* jsonController = [RKTJsonViewController controller];
	[self.navigationController pushViewController:jsonController animated:YES];
}


#pragma mark RKTParsingOperatorDelegate
- (void)rktParsingOperator:(RKTParsingOperator*)sender finishedParsingWithResult:(RKTParsingResult*)result
{
	UILabel* label = [self _getResultLabelForType:result.type];
	[self _setParsingResult:result toLabel:label];
	
	if ([sender isFinishedAllParsing])
	{
		[_parceButton setTitle:@"Parse" forState:UIControlStateNormal];
	}
}


@end


#pragma mark -
@implementation RKTViewController (Private)

- (void)_clearResultLabels
{
	_parceByEasyMappingResultLabel.text = @"0";
	_parceByHandResultLabel.text = @"0";
	_parceByRestKitResult.text = @"0";
}


- (UILabel*)_getResultLabelForType:(RKTParsingType)type
{
	UILabel* label = nil;
	
	switch (type)
	{
		case RKTParsingTypeByHand:
			label = _parceByHandResultLabel;
			break;
		case RKTParsingTypeEasyMapping:
			label = _parceByEasyMappingResultLabel;
			break;
		case RKTParsingTypeRestKit:
			label = _parceByRestKitResult;
			break;
		default:
			NSAssert(NO, @"unknown result type");
			break;
	}
	
	return label;
}

- (void)_setParsingResult:(RKTParsingResult*)result toLabel:(UILabel*)label
{
	NSString* text = @"Can't parse";
	if (result.successed)
	{
		text = [NSString stringWithFormat:@"%f", result.time];
	}
	
	label.text = text;
}

@end
