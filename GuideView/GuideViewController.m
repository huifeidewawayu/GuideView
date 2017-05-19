//
//  GuideViewController.m
//  GuideView
//
//  Created by wurui on 17/4/5.
//  Copyright © 2017年 wurui. All rights reserved.
//

#import "GuideViewController.h"

#define kMDFScreenHeigth    [UIScreen mainScreen].bounds.size.height
#define kMDFScreenWidth     [UIScreen mainScreen].bounds.size.width


CGFloat const pageNumber = 2;

@interface GuideViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *ageLabel;
@end

@implementation GuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupSubViews];
}

- (void)setupSubViews {
    for (int i = 0; i < pageNumber; i++) {
        UIView *showViews = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        showViews.tag = 101 + i;
        showViews.alpha = (i == 0)? 1:0;
        [self.view addSubview:showViews];
    }
    UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    scroll.contentSize = CGSizeMake(kMDFScreenWidth * pageNumber, kMDFScreenHeigth);
//    因为设置了分页效果，所以没滑到一个视图，会自动弹回
    scroll.pagingEnabled = YES;
    scroll.showsHorizontalScrollIndicator = NO;
    scroll.bounces = NO;
    scroll.delegate = self;
    self.scrollView = scroll;
    [self.view addSubview:self.scrollView];
    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 150, 40, 25)];
    self.nameLabel.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.nameLabel];
    self.ageLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 400, 40, 50)];
    self.ageLabel.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.ageLabel];
    [self setupViewsStyle];
}

- (void)setupViewsStyle {
    UIView *firstView = (UIView *)[self.view viewWithTag:101];
    firstView.backgroundColor = [UIColor cyanColor];
    UIView *secondView = (UIView *)[self.view viewWithTag:102];
    secondView.backgroundColor = [UIColor blueColor];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    UIView *firstView = (UIView *)[self.view viewWithTag:101];
    UIView *secondView = (UIView *)[self.view viewWithTag:102];
    CGFloat offsetX = self.scrollView.contentOffset.x;
    self.nameLabel.transform = CGAffineTransformMakeTranslation(0, offsetX);
    self.ageLabel.transform = CGAffineTransformMakeTranslation(offsetX, 0);
    NSLog(@"%lf",offsetX);
    if (offsetX == 0) {
        firstView.alpha = 1;
        secondView.alpha = 0;
    } else if (offsetX == kMDFScreenWidth) {
        secondView.alpha = 1;
    }
}
@end
