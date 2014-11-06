//
//  ViewController.m
//  ContainerViewDoesntContainPresenter
//
//  Created by Kyle Sluder on 11/5/14.
//  Copyright (c) 2014 The Omni Group. All rights reserved.
//

#import "ViewController.h"

@interface CustomPresentationController : UIPresentationController
@end

@interface ViewController () <UIViewControllerTransitioningDelegate>
@end

@implementation ViewController

- (IBAction)presentAViewController:(id)sender
{
    UIViewController *vcToPresent = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"vcToPresent"];
    vcToPresent.transitioningDelegate = self;
    vcToPresent.modalPresentationStyle = UIModalPresentationCustom;
    [self presentViewController:vcToPresent animated:YES completion:nil];
}

- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source;
{
    return [[CustomPresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
}

- (IBAction)dismissThineself:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end

@implementation CustomPresentationController

- (CGRect)frameOfPresentedViewInContainerView;
{
    return CGRectInset(self.containerView.bounds, 80.0f, 80.0f);
}

- (void)presentationTransitionWillBegin;
{
    self.containerView.tintColor = [UIColor purpleColor];
}

- (void)dismissalTransitionWillBegin;
{
    self.containerView.tintColor = nil;
}

@end
