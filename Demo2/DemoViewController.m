//
//  DemoViewController.m
//  Demo2
//
//  Created by Jose Torres on 05/09/13.
//  Copyright (c) 2013 Jose Torres. All rights reserved.
//

#import "DemoViewController.h"

@interface DemoViewController ()

@end

@implementation DemoViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver: self
                                             selector: @selector(keyboardWasShown:)
                                                 name: UIKeyboardDidShowNotification
                                               object: nil];
}

- (void)keyboardWasShown:(NSNotification *)notification {
    
    CGRect viewFrame = textView.frame;
    CGFloat keyboardHeight = [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size.height;
    CGFloat textMaxY = CGRectGetMaxY(textView.frame);
    CGFloat maxVisibleY = self.view.frame.size.height - keyboardHeight;
    viewFrame.size.height = viewFrame.size.height - (textMaxY - maxVisibleY);
    textView.frame = viewFrame;
}


@end
