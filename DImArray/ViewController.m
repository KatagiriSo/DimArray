//
//  ViewController.m
//  DImArray
//
//  Created by katagiri on 2012/09/02.
//  Copyright (c) 2012年 katagiri. All rights reserved.
//

#import "ViewController.h"
#import "DimArray.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self test];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (void)test
{
    DimArray *matrix1 = [DimArray array];
    [matrix1 setIntValue:3 X:10 Y:5];
    [matrix1 setIntValue:5 X:8 Y:3];
    [matrix1 setIntValue:4 X:5 Y:8];
    [matrix1 setIntValue:2 X:3 Y:8];

    [matrix1 log];

    int e83 = [matrix1 intX:8 Y:3];
    int e22 = [matrix1 intX:2 Y:2];
    NSLog(@"e83 = %d, e22 = %d", e83, e22);
    
    DimArray *matrix2 = [DimArray array];
    [matrix2 setValue:@"hello" X:3 Y:3];
    [matrix2 setValue:@"World" X:5 Y:8];
    
    [matrix2 log];
}

@end
