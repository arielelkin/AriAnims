//
//  ViewController.m
//  AriAnim
//
//  Created by Ariel Elkin on 10/06/2013.
//  Copyright (c) 2013 ariel. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@property UIView *circleView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    //Add code to create the circle in the tutorial!!
    
    CALayer *circle = [CALayer layer];
    
    int radius = 200;
    [circle setBounds:CGRectMake(0, 0, radius, radius)];
    [circle setCornerRadius:radius/2];
    [circle setBackgroundColor:[UIColor redColor].CGColor];
    [circle setOpacity:0.5];
    [circle setPosition:CGPointMake(radius , radius +100)];
    
//    [self.view.layer addSublayer:circle];
    
    self.circleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, radius, radius)];
    self.circleView.layer.cornerRadius = radius/2;
    [self.circleView setBackgroundColor:[UIColor redColor]];
    [self.circleView setAlpha:0.5];
    [self.circleView setCenter:CGPointMake(radius, radius+100)];
    
    [self.view addSubview:self.circleView];
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
//    [self linearAnimation];
//    [self curveAnimation];
//    [self customCurveAnimation];
}

-(void)linearAnimation{
    [UIView animateWithDuration:3
                          delay:0.5
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         self.circleView.transform = CGAffineTransformMakeScale(1.4, 1.4);
                     }
                     completion:nil
     ];
}

-(void)curveAnimation{
    [UIView animateWithDuration:3
                          delay:0.5
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.circleView.transform = CGAffineTransformMakeScale(1.4, 1.4);
                     }
                     completion:nil
     ];
}

-(void)customCurveAnimation{
    // Create a basic animation changing the transform.scale value
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    
    // Set the initial and the final values
    [animation setFromValue:[NSNumber numberWithFloat:1]];
    [animation setToValue:[NSNumber numberWithFloat:1.5]];
    
    [animation setBeginTime:CACurrentMediaTime()+0.5];

    
    // Set duration
    [animation setDuration:3];
    
    // Set animation to be consistent on completion
    [animation setRemovedOnCompletion:NO];
    [animation setFillMode:kCAFillModeForwards];
    
    [animation setTimingFunction:[CAMediaTimingFunction functionWithControlPoints:.5 :1.8 :1 :1]];

    //problems with:
    //http://cubic-bezier.com/#.16,1.32,1,-0.72
    
    // Add animation to the view's layer
    [self.circleView.layer addAnimation:animation forKey:@"scale"];
}

/*
 Also see:
 http://khanlou.com/2012/01/cakeyframeanimation-make-it-bounce/
 http://stackoverflow.com/a/10450495/1072846
 
 https://developer.apple.com/library/prerelease/ios/documentation/UIKit/Reference/UIView_Class/UIView/UIView.html#//apple_ref/occ/clm/UIView/animateKeyframesWithDuration:delay:options:animations:completion:
 
 */



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
