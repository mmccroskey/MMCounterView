//
//  ViewController.m
//  Demo
//
//  Created by Matthew McCroskey on 10/2/12.
//  Copyright (c) 2012 Matthew McCroskey. All rights reserved.
//

#import "ViewController.h"
#import "MMCounterView.h"

#define counterView1Tag 1
#define counterView2Tag 2
#define counterView3Tag 3
#define counterView4Tag 4

@interface ViewController ()

@property (weak) IBOutlet MMCounterView *counterView1;
@property (weak) IBOutlet MMCounterView *counterView2;
@property (weak) IBOutlet MMCounterView *counterView3;
@property (weak) IBOutlet MMCounterView *counterView4;

@property (strong) NSMutableDictionary *previousIntegers;

- (void)updateValueForCounterView:(MMCounterView*)counterView;
- (NSInteger)previousIntegerForTag:(NSInteger)tag;
- (void)setPreviousInteger:(NSInteger)integer forTag:(NSInteger)tag;

@end

@implementation ViewController

@synthesize counterView1 = counterView1_;
@synthesize counterView2 = counterView2_;
@synthesize counterView3 = counterView3_;
@synthesize counterView4 = counterView4_;

@synthesize previousIntegers = previousIntegers_;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSInteger capacity = 1;
    [self.counterView1 setTag:counterView1Tag];
    [self performSelector:@selector(updateValueForCounterView:) withObject:self.counterView1 afterDelay:1.5];
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
    {
        capacity = 4;
        [self.counterView2 setTag:counterView2Tag];
        [self.counterView3 setTag:counterView3Tag];
        [self.counterView4 setTag:counterView4Tag];
        [self performSelector:@selector(updateValueForCounterView:) withObject:self.counterView2 afterDelay:1.5];
        [self performSelector:@selector(updateValueForCounterView:) withObject:self.counterView3 afterDelay:1.5];
        [self performSelector:@selector(updateValueForCounterView:) withObject:self.counterView4 afterDelay:1.5];
    }
    
    self.previousIntegers = [[NSMutableDictionary alloc] initWithCapacity:capacity];
}

- (void)updateValueForCounterView:(MMCounterView*)counterView
{
    NSInteger previousInteger = counterView.integer;
    NSInteger newInteger = (arc4random() % 120);
    NSInteger numberOfTicks = abs(newInteger-previousInteger);
    
    [self setPreviousInteger:previousInteger forTag:counterView.tag];
    [counterView setInteger:newInteger];
    
    // Update this counterView again one second after this update is complete
    [self performSelector:@selector(updateValueForCounterView:) withObject:counterView afterDelay:((1.0/counterView.ticksPerSecond)*numberOfTicks+1)];
}

- (NSInteger)previousIntegerForTag:(NSInteger)tag
{
    return [(NSNumber*)[self.previousIntegers objectForKey:[NSNumber numberWithInteger:tag]] integerValue];
}

- (void)setPreviousInteger:(NSInteger)integer forTag:(NSInteger)tag
{
    [self.previousIntegers setObject:[NSNumber numberWithInteger:integer] forKey:[NSNumber numberWithInteger:tag]];
}

@end
