

//
//  CustomCell.m
//  autolayout
//
//  Created by 杜 维欣 on 15/9/1.
//  Copyright (c) 2015年 nododo. All rights reserved.
//
//屏幕宽度
#define kScreenWidth ([UIScreen mainScreen].bounds.size.width)
//屏幕高度
#define kScreenHeight ([UIScreen mainScreen].bounds.size.height)

//调试专用随机色
#define kRandomColor [UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0 blue:arc4random_uniform(256) / 255.0 alpha:1]

#import "CustomCell.h"

@interface CustomCell ()
@property (weak, nonatomic) IBOutlet UILabel *oneLineLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIImageView *photoView;

@end

@implementation CustomCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

- (void)setModel:(CustomModel *)model
{
    _model = model;
//    NSLog(@"%@,%@",model.title,model.content);
    self.oneLineLabel.text = _model.title;
    self.oneLineLabel.backgroundColor = kRandomColor;
    int i = [model.title intValue];
    if (i %3 == 0) {
        
        self.photoView.image = [UIImage imageNamed:@"life"];
    }else  if (i %3 == 1)
    {
        self.photoView.image = [UIImage imageNamed:@"boat.jpg"];

//        self.photoView.backgroundColor = kRandomColor;
    }else
    {
        self.photoView.image = [UIImage imageNamed:@"doge"];
        
//        self.photoView.backgroundColor = kRandomColor;
    }
    self.contentLabel.text = _model.content;
}



@end
