//
//  KeyboardHandledViewController.m
//  iAF
//
//  Created by Tran Thien Khiem on 6/27/14.
//  Copyright (c) 2014 Tran Thien Khiem. All rights reserved.
//

#import "KeyboardHandledViewController.h"

@interface KeyboardHandledViewController ()

@property (nonatomic, retain) UITextField *activeField;
@property (nonatomic) float scrollY;

@end

@implementation KeyboardHandledViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self registerForKeyboardNotifications];
    
    
    UITapGestureRecognizer *touchDownGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard:)];

    [self.view addGestureRecognizer:touchDownGesture];
}

- (void) dismissKeyboard: (UIGestureRecognizer *) recognizer
{
    if (self.activeField)
    {
        [self.activeField resignFirstResponder];
    }
}

- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
    
}

// Called when the UIKeyboardDidShowNotification is sent.
- (void) keyboardWillShow:(NSNotification*)aNotification
{
    
    if (self.activeField)
    {
        NSDictionary* info = [aNotification userInfo];
        CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
        
        float originY = 0.0f;
        
        UIView *view = self.activeField;

        while (view != self.view && view.superview != nil)
        {
            originY += view.frame.origin.y;
            NSLog(@"+ %f", view.frame.origin.y);
            view = view.superview;
        }
        
        float bottom = originY + self.activeField.frame.size.height;
        
        NSLog(@"Frame Height: %f", self.view.frame.size.height);
        
        float kbHeight = kbSize.height;
        
        if (kbHeight > kbSize.width) {
            kbHeight = kbSize.width;
        }
        

        NSLog(@"Keyboard height %f", kbHeight);
        
        float newBound = self.view.frame.size.height - kbHeight;
        
        NSLog(@"New Bound %f", newBound);
        
        if (newBound < bottom)
        {
            float newBottom = newBound - kKeyboardPadding;
            self.scrollY = bottom - newBottom;
            
            CGRect rect = self.view.frame;
            rect.origin.y -= self.scrollY;
            NSLog(@"Bottom %f Scroll Y: %f", bottom, self.scrollY);
            
            [UIView animateWithDuration:kKeyboardAnimationDuration animations:^{
                [self.view setFrame:rect];
            }];

        }
    }
    
    
}

// Called when the UIKeyboardWillHideNotification is sent
- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    if (self.scrollY)
    {
        CGRect rect = self.view.frame;
        rect.origin.y += self.scrollY;
        
        [UIView animateWithDuration:kKeyboardAnimationDuration animations:^{
            [self.view setFrame:rect];
        }];
        
        self.scrollY = 0;
    }
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    self.activeField = textField;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    self.activeField = nil;
}

@end
