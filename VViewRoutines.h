//
//  VViewRoutines.h
//
//  Created by Vitaly Trofimov
//

#import <UIKit/UIKit.h>



@interface UIView (VViewRoutines)

@property (nonatomic) CGPoint origin;
@property (nonatomic) CGFloat left;
@property (nonatomic) CGFloat top;
@property (nonatomic) CGFloat right;
@property (nonatomic) CGFloat bottom;
@property (nonatomic) CGSize size;
@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;
@property (nonatomic) CGFloat centerX;
@property (nonatomic) CGFloat centerY;

@property (nonatomic) CGFloat cornerRadius;


-(void)fillWithView: (UIView*)view;
-(void)centerInView: (UIView*)view;
-(void)removeAllSubviews;

@end



@interface UIViewController (VViewRoutines)

-(void)fillWithViewController: (UIViewController*)viewController;
-(void)removeViewFromParentViewController;

@end
