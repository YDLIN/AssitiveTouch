//
//  UIView+screen.m
//  test
//
//  Created by Du on 15/7/11.
//  Copyright (c) 2015年 Du. All rights reserved.
//

#import "UIView+screen.h"

@implementation UIView (screen)
CGFloat lastX = 0.0;

- (void)stayInScreenWithView:(UIView *)userView andTheGesture:(UIPanGestureRecognizer *)Gesture
{
    CGPoint curP = [Gesture locationInView:self];
    CGFloat offsetX = curP.x;

    if (Gesture.state != UIGestureRecognizerStateEnded) {//手势未结束的时候，直接返回
        return;
    }
    if (isButtonMidXOnMidOfScreen) {//屏幕的中部
        if (buttonMidX <= screenMidX) {//屏幕的中部区域的左侧
            lastX = 0.0;
        }else{//屏幕的中部区域的右侧
            lastX = screenMaxX - userView.width;
        }
    }else{//非屏幕中部
        if ((CGRectGetMinY(userView.frame)) < (screenMinXY + Margin)) {//屏幕顶部区域
            lastX = offsetX - userView.width *0.5;
            if (lastX > screenMaxX - userView.width) {
                lastX = screenMaxX - userView.width;
            }else if (lastX < screenMinXY + userView.width){
                lastX = screenMinXY;
            }
            userView.y = screenMinXY;
        }else if((CGRectGetMaxY(userView.frame)) > (screenMaxY - Margin)){//屏幕底部区域
            lastX = offsetX - userView.width *0.5;
            if (lastX > screenMaxX - userView.width) {
                lastX = screenMaxX - userView.width;
            }else if (lastX < screenMinXY + userView.width){
                lastX = screenMinXY;
            }
                userView.y = screenMaxY - userView.height;
        }
    }
    [UIView animateWithDuration:0.3 animations:^{
        userView.frame = (CGRect){CGPointMake(lastX, userView.y),userView.frame.size};
    }];
}
@end
