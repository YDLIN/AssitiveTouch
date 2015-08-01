//
//  ViewController.m
//  easyTouch
//
//  Created by Du on 15/7/11.
//  Copyright (c) 2015年 Du. All rights reserved.
//

#import "ViewController.h"
#import "UIView+screen.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *easyTouch;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //不调整高亮颜色
    self.easyTouch.showsTouchWhenHighlighted = NO;
    //添加拖拽手势
    [self addGesture];
}


- (void)addGesture
{
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.easyTouch addGestureRecognizer:pan];
}

- (void)pan:(UIPanGestureRecognizer *)pan
{
    CGPoint transformP = [pan translationInView:self.easyTouch];
    //设置偏移
    self.easyTouch.transform = CGAffineTransformTranslate(self.easyTouch.transform, transformP.x, transformP.y);
    //复位
    [pan setTranslation:CGPointZero inView:self.easyTouch];
    
    //保证控件不会超出屏幕且//自动弹回左右边缘
    [self.view stayInScreenWithView:self.easyTouch andTheGesture:pan];
}
@end
