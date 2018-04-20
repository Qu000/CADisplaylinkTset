//
//  ViewController.m
//  CADisplaylinkDemo
//
//  Created by qujiahong on 2018/4/19.
//  Copyright © 2018年 瞿嘉洪. All rights reserved.
//

#import "ViewController.h"
#import "Wave.h"

@interface ViewController ()

/** wave*/
@property (nonatomic, strong) Wave * waveView;

/** wave的图片[头像]*/
@property (nonatomic, strong) UIImageView *iconImageView;
@end

@implementation ViewController


-(Wave *)waveView{
    
    if (!_waveView) {
        _waveView = [[Wave alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
        _waveView.backgroundColor = Color(0, 202, 220, 1);
        [_waveView addSubview:self.iconImageView];
        __weak typeof(self)weakSelf = self;
        _waveView.waveBlock = ^(CGFloat currentY){
            CGRect iconFrame = [weakSelf.iconImageView frame];
            iconFrame.origin.y = CGRectGetHeight(weakSelf.waveView.frame)-CGRectGetHeight(weakSelf.iconImageView.frame)+currentY-weakSelf.waveView.waveHeight;
            weakSelf.iconImageView.frame  =iconFrame;
        };
    
        [_waveView startWaveAnimation];
    }
    return _waveView;

}

- (UIImageView *)iconImageView{
    
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.waveView.frame.size.width/2-30, 0, 80, 80)];
        _iconImageView.layer.borderColor = [UIColor whiteColor].CGColor;
        _iconImageView.layer.borderWidth = 2;
        _iconImageView.layer.cornerRadius = 20;
        
    }
    return _iconImageView;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.waveView];
    
}


@end
