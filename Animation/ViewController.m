//
//  ViewController.m
//  Animation
//
//  Created by apple on 2017/8/21.
//  Copyright © 2017年 xjc. All rights reserved.
//

#import "ViewController.h"
#import "RippleView.h"
#import "RippleModel.h"


@interface ViewController ()
{
    RippleView *rippleview;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    EAGLContext *context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    rippleview = [[RippleView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) context:context];
    [self.view addSubview:rippleview];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
    [rippleview addGestureRecognizer:pan];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
    [rippleview addGestureRecognizer:tap];
}

- (void)handleGesture:(UITapGestureRecognizer *)gesture
{
    CGPoint location = [gesture locationInView:rippleview];
    [rippleview.ripple initiateRippleAtLocation:location];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
