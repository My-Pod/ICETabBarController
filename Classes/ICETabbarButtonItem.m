//
//  GMXTabbarButtonItem.m
//  GMXTabbarController
//
//  Created by WLY on 16/1/17.
//  Copyright © 2016年 WLY. All rights reserved.
//

#import "ICETabbarButtonItem.h"

@interface ICETabbarButtonItem ()
@property (weak, nonatomic  ) IBOutlet UILabel        *titleLabel;
@property (weak, nonatomic  ) IBOutlet UIImageView    *imageView;
@property (nonatomic, strong) UIColor        *textColor;
@property (nonatomic, copy  ) void (^  selecctedBlock)();
@end

@implementation ICETabbarButtonItem

#pragma mark -init


- (instancetype)initWithTitle:(NSString *)title withSelectImage:(UIImage *)selectImage withNormalImage:(UIImage *)normalImage{

    self = [self init];
    if (self) {
        _titleLabel.text = title;
        _imageView.image = normalImage;
        _imageView.highlightedImage = selectImage;
    }
    return self;
}

- (instancetype)init{
    if (self = [super init]) {
        self = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([ICETabbarButtonItem class]) owner:nil options:nil].firstObject;
        
    }
    return self;
}

- (void)dealloc{
    _selecctedBlock = nil;
}

- (IBAction)tap:(id)sender {
    self.selecctedBlock();
}

- (void)didSelected:(void (^)())completion{
    self.selecctedBlock = completion;
}

#pragma mark - lazy load
- (void)setSelected:(BOOL)selected{

    if (_selected != selected) {
        _selected = selected;
        self.titleLabel.highlighted = _selected;;
        self.imageView.highlighted = _selected;
    }
}

- (void)setTextColor:(UIColor *)textColor{
    _titleLabel.textColor = textColor;
}
#pragma mark- layoutsubviews

- (NSString *)debugDescription
{
    return [NSString stringWithFormat:@"<%@: %p> %@", [self class], self, self.titleLabel.text];
}

@end
