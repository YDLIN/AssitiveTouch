//
//  UIView+screen.h
//  test
//
//  Created by Du on 15/7/11.
//  Copyright (c) 2015年 Du. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface UIView (screen)
/**
 *  保证控件不会超出屏幕
 *  @param userView 需要留在屏幕的控件
 */
- (void)stayInScreenWithView:(UIView *)userView andTheGesture:(UIPanGestureRecognizer *)Gesture;
@end
