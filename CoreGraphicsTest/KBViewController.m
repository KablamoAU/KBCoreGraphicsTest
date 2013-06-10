//
//  KBViewController.m
//  CoreGraphicsTest
//
//  Created by Allan Waddell on 9/06/13.
//  Copyright (c) 2013 Allan Waddell. All rights reserved.
//

#import "KBViewController.h"

@interface KBViewController ()

@end

@implementation KBViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.gradientView = [[KBCircleGradient alloc]initWithFrame:CGRectMake(50, 50, 200, 200)];
    [self.gradientView fadeOut];
    [self.view addSubview:self.gradientView];
    
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(screenPan:)];
    [self.view addGestureRecognizer:panGestureRecognizer];
}

//Manage the Pan Gesture
- (void)screenPan:(UIGestureRecognizer *)gesture{
    
    //Get the location of the touch
    CGPoint point = [gesture locationInView:self.view];
    
    //Move the center of the gradient view if gesture state is equal to Began or Changed
    if (gesture.state == UIGestureRecognizerStateBegan || gesture.state == UIGestureRecognizerStateChanged) {
        self.gradientView.center = point;
    }
    
    //Launch fadeOut animation if gesture state is equal to end
    if (gesture.state == UIGestureRecognizerStateEnded) {
        [self.gradientView fadeOut];
    }
}

//Manage Touches Begin
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches anyObject];
    CGPoint drawPoint = [touch locationInView:self.view];
    
    //Change gradientView center and launch fadeIn animation
    self.gradientView.center = drawPoint;
    [self.gradientView fadeIn];
    
}

//Manage Touches End
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.gradientView fadeOut];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
