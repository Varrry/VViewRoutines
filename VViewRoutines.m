//
//  VViewRoutines.m
//
//  Created by Vitaly Trofimov
//

#import "VViewRoutines.h"



@implementation UIView (VViewRoutines)

// MARK: - Frame

-(CGPoint)origin
{
	return self.frame.origin;
}

-(void)setOrigin:(CGPoint)origin
{
	CGRect frame = self.frame;
	frame.origin = origin;
	self.frame = frame;
}

-(CGFloat)left
{
	return self.frame.origin.x;
}

-(void)setLeft:(CGFloat)left
{
	CGRect frame = self.frame;
	frame.origin.x = left;
	self.frame = frame;
}

-(CGFloat)top
{
	return self.frame.origin.y;
}

-(void)setTop:(CGFloat)top
{
	CGRect frame = self.frame;
	frame.origin.y = top;
	self.frame = frame;
}

-(CGFloat)right
{
	return self.superview.frame.size.width-self.frame.origin.x-self.frame.size.width;
}

-(void)setRight:(CGFloat)right
{
	CGRect frame = self.frame;
	frame.origin.x = self.superview.frame.size.width-right-self.frame.size.width;
	self.frame = frame;
}

-(CGFloat)bottom
{
	return self.superview.frame.size.height-self.frame.origin.y-self.frame.size.height;
}

-(void)setBottom:(CGFloat)bottom
{
	CGRect frame = self.frame;
	frame.origin.y = self.superview.frame.size.height-bottom-self.frame.size.height;
	self.frame = frame;
}

-(CGSize)size
{
	return self.frame.size;
}

-(void)setSize:(CGSize)size
{
	CGRect frame = self.frame;
	frame.size = size;
	self.frame = frame;
}

-(CGFloat)width
{
	return self.frame.size.width;
}

-(void)setWidth:(CGFloat)width
{
	CGRect frame = self.frame;
	frame.size.width = width;
	self.frame = frame;
}

-(CGFloat)height
{
	return self.frame.size.height;
}

-(void)setHeight:(CGFloat)height
{
	CGRect frame = self.frame;
	frame.size.height = height;
	self.frame = frame;
}

-(CGFloat)centerX
{
	return self.center.x;
}

-(void)setCenterX:(CGFloat)centerX
{
	CGPoint center = self.center;
	center.x = centerX;
	self.center = center;
}

-(CGFloat)centerY
{
	return self.center.y;
}

-(void)setCenterY:(CGFloat)centerY
{
	CGPoint center = self.center;
	center.y = centerY;
	self.center = center;
}



// MARK: - Corner radius

-(CGFloat)cornerRadius
{
	return self.layer.cornerRadius;
}

-(void)setCornerRadius:(CGFloat)cornerRadius
{
	self.layer.cornerRadius = cornerRadius;
}



// MARK: - Constraints

-(void)fillWithView:(UIView*)view
{
	[self addSubview:view];
	view.translatesAutoresizingMaskIntoConstraints = NO;
	[self addConstraint:[NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:0]];
	[self addConstraint:[NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1 constant:0]];
	[self addConstraint:[NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:0]];
	[self addConstraint:[NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];
}

-(void)centerInView:(UIView *)view
{
	[view addSubview:self];
	self.translatesAutoresizingMaskIntoConstraints = NO;
	[view addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
	[view addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
	[view addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:self.width]];
	[view addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:self.height]];
}

@end



@implementation UIViewController (VViewRoutines)

-(void)fillWithViewController:(UIViewController *)viewController
{
	[self addChildViewController:viewController];
	[self.view fillWithView:viewController.view];
}

-(void)removeViewFromParentViewController
{
	[self.view removeFromSuperview];
	[self removeFromParentViewController];
}

@end
















