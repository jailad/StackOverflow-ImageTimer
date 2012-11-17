//
//  JDemoViewController.m
//  ImageTimer
//
//  Created by Jai on 11/17/12.
//

#import "JDemoViewController.h"

@interface JDemoViewController ()

@property (nonatomic, retain) NSArray *imageNameArray;

- (void) handleTimerEventFired;

@end

@implementation JDemoViewController

@synthesize imageView = _imageView;
@synthesize imageNameArray = _imageNameArray;

- (void) dealloc
{
    self.imageView = nil;
    self.imageNameArray = nil;
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.imageNameArray = [NSArray arrayWithObjects:@"img1",@"img2",@"img3",@"img4", nil];
    
    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(handleTimerEventFired) userInfo:nil repeats:YES];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void) handleTimerEventFired
{    
    NSString *tempImageName = [self.imageNameArray objectAtIndex:(arc4random()%4)];
    
    UIImage* image = [UIImage imageNamed:tempImageName];
    
    self.imageView.image = image;
    
    if(tempImageName == @"img3")
    {
        NSLog(@"Image 3 was Loaded !");
    }
    
}

@end
