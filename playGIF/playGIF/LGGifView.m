//
//  LGGifView.m
//  playGIF
//
//  Created by 李根 on 16/6/1.
//  Copyright © 2016年 ligen. All rights reserved.
//

#import "LGGifView.h"

@implementation LGGifView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)loadData:(NSData *)_data {
    //  kCGImagePropertyGIFLoopCount loopCount (播放次数): 有些gif播放到一定次数就停止了, 如果为0就代表一直循环播放
    gifProperties = [NSDictionary dictionaryWithObject:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:0] forKey:(NSString *)kCGImagePropertyGIFLoopCount] forKey:(NSString *)kCGImagePropertyGIFDictionary];
    
    gif = CGImageSourceCreateWithData((CFDataRef)_data, (CFDictionaryRef) gifProperties);
    count = CGImageSourceGetCount(gif);
    
    //  解决重复调用timer的问题
    if (timer) {
        [timer invalidate];
        timer = nil;
    }
    
    timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(play) userInfo:nil repeats:YES];
    [timer fire];
    
    
}

- (void)play {
    index ++;
    index = index % count;
    
    //  获取图像
    CGImageRef ref = CGImageSourceCreateImageAtIndex(gif, index, (CFDictionaryRef)gifProperties);
    
    self.layer.contents = (__bridge id)ref;
    CFRelease(ref);
}

- (void)removeFromSuperview {
    NSLog(@"removeFromSuperview");
    [timer invalidate];
    timer = nil;
    [super removeFromSuperview];
}

- (void)dealloc {
    NSLog(@"dealloc");
    CFRelease(gif);
//    [super dealloc];
}













































@end
