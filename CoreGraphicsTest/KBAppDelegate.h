//
//  KBAppDelegate.h
//  CoreGraphicsTest
//
//  Created by Allan Waddell on 9/06/13.
//  Copyright (c) 2013 Allan Waddell. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KBViewController;

@interface KBAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) KBViewController *viewController;

@end
