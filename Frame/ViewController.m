//
//  ViewController.m
//  Frame
//
//  Created by 冯汉栩 on 2021/2/7.
//

#import "ViewController.h"
#define viewHeight 300 // 蜡烛图高度
#define space 3 // 每条蜡烛图的间隙
#define MaxVisibleKLineCount 300 // 每次提取限制300个数据
#define MaxCacheKLineCount 600 // 数组限制最多600个可视数据
#define volumeHeight 80  // 成交量图形高度

@interface KLineModel : NSObject
@property (nonatomic, assign) CGFloat open;
@property (nonatomic, assign) CGFloat high;
@property (nonatomic, assign) CGFloat low;
@property (nonatomic, assign) CGFloat close;
@property (nonatomic, assign) NSTimeInterval timestamp;
@property (nonatomic, assign) CGFloat volume;

//山峰标记
@property (nonatomic, copy) NSString * mountainPeakTag;

@property (nonatomic, copy) NSString * condition_1;
@property (nonatomic, copy) NSString * condition_2;
@property (nonatomic, copy) NSString * condition_3;
@property (nonatomic, copy) NSString * condition_4;
@property (nonatomic, copy) NSString * condition_5;
@property (nonatomic, copy) NSString * condition_6;
@property (nonatomic, copy) NSString * condition_7;
@property (nonatomic, copy) NSString * condition_8;
@property (nonatomic, copy) NSString * condition_9;
@end

@implementation KLineModel
@end

@interface TipView : UIView
@property (nonatomic, strong) KLineModel *model;
@end

@interface TipView()
@property (nonatomic, strong) UILabel *titleLabel_1;
@property (nonatomic, strong) UILabel *titleLabel_2;
@property (nonatomic, strong) UILabel *titleLabel_3;
@property (nonatomic, strong) UILabel *titleLabel_4;
@property (nonatomic, strong) UILabel *titleLabel_5;
@property (nonatomic, strong) UILabel *titleLabel_6;
@property (nonatomic, strong) UILabel *titleLabel_7;
@property (nonatomic, strong) UILabel *titleLabel_8;
@property (nonatomic, strong) UILabel *titleLabel_9;
@end

@implementation TipView

- (void)setModel:(KLineModel *)model {
    _model = model;
    self.titleLabel_1.str(_model.condition_1);
    self.titleLabel_2.str(_model.condition_2);
    self.titleLabel_3.str(_model.condition_3);
    self.titleLabel_4.str(_model.condition_4);
    self.titleLabel_5.str(_model.condition_5);
    self.titleLabel_6.str(_model.condition_6);
    self.titleLabel_7.str(_model.condition_7);
    self.titleLabel_8.str(_model.condition_8);
    self.titleLabel_9.str(_model.condition_9);
    
    NSArray *lines_1 = [_model.condition_1 componentsSeparatedByString:@"\n"];
    self.titleLabel_1.updateCons(^{
        make.height.equal.constants(lines_1.count*20);
    });
    
    NSArray *lines_2 = [_model.condition_2 componentsSeparatedByString:@"\n"];
    self.titleLabel_2.updateCons(^{
        make.height.equal.constants(lines_2.count*20);
    });
    
    NSArray *lines_3 = [_model.condition_3 componentsSeparatedByString:@"\n"];
    self.titleLabel_3.updateCons(^{
        make.height.equal.constants(lines_3.count*20);
    });
    
    NSArray *lines_4 = [_model.condition_4 componentsSeparatedByString:@"\n"];
    self.titleLabel_4.updateCons(^{
        make.height.equal.constants(lines_4.count*20);
    });
    
    NSArray *lines_5 = [_model.condition_5 componentsSeparatedByString:@"\n"];
    self.titleLabel_5.updateCons(^{
        make.height.equal.constants(lines_5.count*20);
    });
    
    NSArray *lines_6 = [_model.condition_6 componentsSeparatedByString:@"\n"];
    self.titleLabel_6.updateCons(^{
        make.height.equal.constants(lines_6.count*20);
    });
    
    NSArray *lines_7 = [_model.condition_7 componentsSeparatedByString:@"\n"];
    self.titleLabel_7.updateCons(^{
        make.height.equal.constants(lines_7.count*20);
    });
        
    NSArray *lines_8 = [_model.condition_8 componentsSeparatedByString:@"\n"];
    self.titleLabel_8.updateCons(^{
        make.height.equal.constants(lines_8.count*20);
    });
    
    NSArray *lines_9 = [_model.condition_9 componentsSeparatedByString:@"\n"];
    self.titleLabel_9.updateCons(^{
        make.height.equal.constants(lines_9.count*20);
    });
    
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    [self buildUI];
    return self;
}

-(void) buildUI{
    self.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.2];
    self.hidden = YES;
    
    self.titleLabel_1 = [UILabel new];
    self.titleLabel_1.textColor = [UIColor whiteColor];
    self.titleLabel_1.addTo(self).fnt(12).bgColor([UIColor colorWithHex:0xFFC0CB]).lines(0).makeCons(^{
        make.left.equal.view(self);
        make.right.equal.view(self);
        make.top.equal.view(self);
        make.height.equal.constants(20);
    });
    
    self.titleLabel_2 = [UILabel new];
    self.titleLabel_2.textColor = [UIColor whiteColor];
    self.titleLabel_2.addTo(self).fnt(12).bgColor([UIColor colorWithHex:0x008B8B]).lines(0).makeCons(^{
        make.left.equal.view(self);
        make.right.equal.view(self);
        make.top.equal.view(self.titleLabel_1).bottom.constants(0);
        make.height.equal.constants(20);
    });
    
    self.titleLabel_3 = [UILabel new];
    self.titleLabel_3.textColor = [UIColor whiteColor];
    self.titleLabel_3.addTo(self).fnt(12).bgColor([UIColor colorWithHex:0x2E8B57]).lines(0).makeCons(^{
        make.left.equal.view(self);
        make.right.equal.view(self);
        make.top.equal.view(self.titleLabel_2).bottom.constants(0);
        make.height.equal.constants(20);
    });
    
    self.titleLabel_4 = [UILabel new];
    self.titleLabel_4.textColor = [UIColor whiteColor];
    self.titleLabel_4.addTo(self).fnt(12).bgColor([UIColor colorWithHex:0xDAA520]).lines(0).makeCons(^{
        make.left.equal.view(self);
        make.right.equal.view(self);
        make.top.equal.view(self.titleLabel_3).bottom.constants(0);
        make.height.equal.constants(20);
    });
    
    self.titleLabel_5 = [UILabel new];
    self.titleLabel_5.textColor = [UIColor whiteColor];
    self.titleLabel_5.addTo(self).fnt(12).bgColor([UIColor colorWithHex:0xD2B48C]).lines(0).makeCons(^{
        make.left.equal.view(self);
        make.right.equal.view(self);
        make.top.equal.view(self.titleLabel_4).bottom.constants(0);
        make.height.equal.constants(20);
    });
    
    self.titleLabel_6 = [UILabel new];
    self.titleLabel_6.textColor = [UIColor whiteColor];
    self.titleLabel_6.addTo(self).fnt(12).bgColor([UIColor colorWithHex:0xFA8072]).lines(0).makeCons(^{
        make.left.equal.view(self);
        make.right.equal.view(self);
        make.top.equal.view(self.titleLabel_5).bottom.constants(0);
        make.height.equal.constants(80);
    });
    
    self.titleLabel_7 = [UILabel new];
    self.titleLabel_7.textColor = [UIColor whiteColor];
    self.titleLabel_7.addTo(self).fnt(12).bgColor([UIColor colorWithHex:0x5F9EA0]).lines(0).makeCons(^{
        make.left.equal.view(self);
        make.right.equal.view(self);
        make.top.equal.view(self.titleLabel_6).bottom.constants(0);
        make.height.equal.constants(120);
    });
    
    self.titleLabel_8 = [UILabel new];
    self.titleLabel_8.textColor = [UIColor whiteColor];
    self.titleLabel_8.addTo(self).fnt(12).bgColor([UIColor colorWithHex:0x9400D3]).lines(0).makeCons(^{
        make.left.equal.view(self);
        make.right.equal.view(self);
        make.top.equal.view(self.titleLabel_7).bottom.constants(0);
        make.height.equal.constants(120);
    });
    
    self.titleLabel_9 = [UILabel new];
    self.titleLabel_9.textColor = [UIColor whiteColor];
    self.titleLabel_9.addTo(self).fnt(12).bgColor([UIColor colorWithHex:0xC71585]).lines(0).makeCons(^{
        make.left.equal.view(self);
        make.right.equal.view(self);
        make.top.equal.view(self.titleLabel_8).bottom.constants(0);
        make.height.equal.constants(120);
    });
    
}

@end

typedef void(^KLineScaleAction)(BOOL clickState);

typedef void(^KLineTipModelAction)(KLineModel* tipModel);

@interface KLineChartView : UIView
//可视view的数据，限制最多900条蜡烛图(总的数据当中的一部分)(左边300根,中间显示300根,右边300根)
@property (nonatomic, strong) NSArray<KLineModel *> *visibleKLineData;
//可视图x的偏移值，(可视图相对总图的x显示位置)
@property (nonatomic, assign) CGFloat contentOffsetX;
//蜡烛图的宽度
@property (nonatomic, assign) CGFloat candleWidth;
//长按手势:是否显示十字虚线
@property (nonatomic, assign) BOOL showCrossLine;
//长按手势相关: 十字线的point点
@property (nonatomic, assign) CGPoint crossPoint;
//长按手势
@property (nonatomic, strong) UILongPressGestureRecognizer *longPressGesture;
//捏合手势
@property (nonatomic, strong) UIPinchGestureRecognizer *pinchGesture;
//用户长按传递出去控制器显示tipview
@property (nonatomic,   copy) KLineScaleAction scaleCallback;
//用户长按返回计算好的TipModel
@property (nonatomic,   copy) KLineTipModelAction tipModelCallback;
@end

@implementation KLineChartView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        //初始化蜡烛图宽度
        _candleWidth = 8;
        //长按手势初始化
        _longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
        _longPressGesture.minimumPressDuration = 0.3;
        _longPressGesture.allowableMovement = 15;
        [self addGestureRecognizer:_longPressGesture];
        //捏合手势初始化
        _pinchGesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinch:)];
        [self addGestureRecognizer:_pinchGesture];
    }
    return self;
}

//长按手势处理
- (void)handleLongPress:(UILongPressGestureRecognizer *)gesture {
    CGPoint point = [gesture locationInView:self];
    
    if (gesture.state == UIGestureRecognizerStateBegan ||
        gesture.state == UIGestureRecognizerStateChanged) {
        self.showCrossLine = YES;
        self.crossPoint = point;
        [self setNeedsDisplay];
        if (self.scaleCallback) {
            self.scaleCallback(YES);
        }
    } else {
        self.showCrossLine = NO;
        [self setNeedsDisplay];
        if (self.scaleCallback) {
            self.scaleCallback(NO);
        }
    }
}

//捏合手势处理
/**
 1.捏合根据gesture.scale 转换成  缩放比例，缩放蜡烛图的大小
 2.重新计算  scrollView 的 contentSize 和 contentOffset
 3.缩放目标保持在中间不动(写得不好)
 */
- (void)handlePinch:(UIPinchGestureRecognizer *)gesture {
    static CGFloat lastScale = 1.0;
    
    if (gesture.state == UIGestureRecognizerStateBegan) {
        lastScale = 1.0;
    }
    
    CGFloat scale = gesture.scale / lastScale;
    lastScale = gesture.scale;
    
    // 限制 candleWidth 范围
    CGFloat newWidth = self.candleWidth * scale;
    newWidth = MAX(2, MIN(newWidth, 40));
    
    if (fabs(newWidth - self.candleWidth) < 0.01) return;
    
    // 找到手势中心点在 chartView 中的坐标
    CGPoint pinchCenterInView = [gesture locationInView:self];
    CGFloat centerX = pinchCenterInView.x;
    
    // 旧宽度下的 index
    NSInteger oldIndex = centerX / (self.candleWidth + space);
    
    // 旧相对偏移比例（在 scrollView 中）
    CGFloat ratio = (centerX) / self.bounds.size.width;
    
    // 更新 candleWidth
    self.candleWidth = newWidth;
    
    // 更新自身 frame 宽度
    CGFloat newChartWidth = self.visibleKLineData.count * (self.candleWidth + space);
    CGRect frame = self.frame;
    frame.size.width = newChartWidth;
    self.frame = frame;
    
    // 更新 scrollView 的 contentSize 和 contentOffset
    if ([self.superview isKindOfClass:[UIScrollView class]]) {
        UIScrollView *scrollView = (UIScrollView *)self.superview;
        scrollView.contentSize = CGSizeMake(newChartWidth, scrollView.contentSize.height);
        
        // 重新计算缩放后的偏移
        CGFloat newOffsetX = oldIndex * (self.candleWidth + space) - ratio * scrollView.bounds.size.width;
        newOffsetX = MAX(0, MIN(newOffsetX, scrollView.contentSize.width - scrollView.bounds.size.width));
        scrollView.contentOffset = CGPointMake(newOffsetX, 0);
    }
    
    [self setNeedsDisplay];
}

- (void)setContentOffsetX:(CGFloat)contentOffsetX {
    _contentOffsetX = contentOffsetX;
    [self setNeedsDisplay];
}

//// 下跌 -- k线判断法
//-(BOOL)fall_withCurrentModel:(KLineModel *)currentModel withPreviousModel:(KLineModel *)previousModel {
//    BOOL result = NO;
//    //跌1%
//    if ((previousModel.open - currentModel.close) / previousModel.open >= 0.01) {
//        result = YES;
//    }
//    return result;
//}
//
//// 上升 -- k线判断法
//-(BOOL)rise_withCurrentModel:(KLineModel *)currentModel withPreviousModel:(KLineModel *)previousModel {
//    BOOL result = NO;
//    //升1%
//    if ((currentModel.close - previousModel.open) / previousModel.open >= 0.01) {
//        BOOL result = YES;
//    }
//    return result;
//}





- (void)drawRect:(CGRect)rect {
    if (!self.visibleKLineData || self.visibleKLineData.count == 0) return;

    //数组中开始的index
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 可视view显示的个数
    NSInteger countInView = ceil(SCREEN_WIDTH / (self.candleWidth + space)) + 1;
    NSInteger startIndex = MAX(0, self.contentOffsetX / (self.candleWidth + space));
    //可视数组中结束的index
    NSInteger endIndex = MIN(startIndex + countInView, self.visibleKLineData.count);

    // 局部最大最小价
    CGFloat maxPrice  = -MAXFLOAT;
    CGFloat minPrice  = MAXFLOAT;
    CGFloat maxVolume = -MAXFLOAT;

    for (NSInteger i = startIndex; i < endIndex; i++) {
        KLineModel *model = self.visibleKLineData[i];
        maxPrice = MAX(maxPrice, model.high);
        minPrice = MIN(minPrice, model.low);
        maxVolume = MAX(maxVolume, model.volume);
    }

    CGFloat marginRatio = 0.1;
    CGFloat priceRange = maxPrice - minPrice;
    CGFloat padding = priceRange * marginRatio;
    maxPrice += padding;
    minPrice -= padding;

    //求出可视view一格代表多少钱(1格/100元，1格/200元)
    CGFloat scale = viewHeight / (maxPrice - minPrice);
    CGFloat volumeTop = viewHeight + 10;
    CGFloat volumeScale = (maxVolume > 0) ? (volumeHeight / maxVolume) : 0;
    


    // 绘制K线
    for (NSInteger i = startIndex; i < endIndex; i++) {
        KLineModel *model = self.visibleKLineData[i];
        CGFloat x = i * (self.candleWidth + space);
        CGFloat openY = (maxPrice - model.open) * scale;
        CGFloat closeY = (maxPrice - model.close) * scale;
        CGFloat highY = (maxPrice - model.high) * scale;
        CGFloat lowY = (maxPrice - model.low) * scale;

        UIColor *color = model.close >= model.open ? [UIColor redColor] : [UIColor colorWithRed:0.23 green:0.74 blue:0.52 alpha:1.0];
        CGContextSetStrokeColorWithColor(ctx, color.CGColor);
        CGContextSetLineWidth(ctx, 1);
        CGContextMoveToPoint(ctx, x + self.candleWidth/2, highY);
        CGContextAddLineToPoint(ctx, x + self.candleWidth/2, lowY);
        CGContextStrokePath(ctx);

        CGContextSetFillColorWithColor(ctx, color.CGColor);
        if (model.close >= model.open) {
            CGContextFillRect(ctx, CGRectMake(x, closeY, self.candleWidth, openY - closeY));
        } else {
            CGContextFillRect(ctx, CGRectMake(x, openY, self.candleWidth, closeY - openY));
        }
        
        // 山峰标记
        if (self.visibleKLineData[i].mountainPeakTag) {
            if (i >= startIndex && i <= endIndex) {
                KLineModel *peakModel = self.visibleKLineData[i];
                CGFloat x = i * (self.candleWidth + space) + self.candleWidth/2;
                CGFloat y = (maxPrice - peakModel.high) * scale;
                
                // 绘制山峰标记
                NSString *peakText = self.visibleKLineData[i].mountainPeakTag;
                NSDictionary *attrs = @{
                    NSFontAttributeName: [UIFont systemFontOfSize:10],
                    NSForegroundColorAttributeName: [UIColor redColor]
                };
                CGSize textSize = [peakText sizeWithAttributes:attrs];
                CGRect textRect = CGRectMake(x - textSize.width/2, y - textSize.height - 5, textSize.width, textSize.height);
                [peakText drawInRect:textRect withAttributes:attrs];
                
                // 可选：在峰顶画一个小红点
                CGContextSetFillColorWithColor(ctx, [UIColor redColor].CGColor);
                CGContextFillEllipseInRect(ctx, CGRectMake(x - 2, y - 2, 4, 4));
            }
        }
 
        
        // 成交量
        CGFloat volHeight = model.volume * volumeScale;
        CGFloat volY = volumeTop + volumeHeight - volHeight;
        CGContextFillRect(ctx, CGRectMake(x, volY, self.candleWidth, volHeight));
        
        // 绘制每条k线涨跌幅 显示在蜡烛图的底部
        if (model.open > 0) {
            CGFloat changePercent = ((model.close - model.open) / model.open) * 100;
            NSString *percentText = [NSString stringWithFormat:@"%.1f", changePercent];
            NSDictionary *percentAttr = @{
                NSFontAttributeName: [UIFont systemFontOfSize:8],
                NSForegroundColorAttributeName: color
            };
            CGSize size = [percentText sizeWithAttributes:percentAttr];
            
            // 正确：基于最低价位置绘制文字
            CGFloat textX = x + (self.candleWidth - size.width) / 2;
            CGFloat textY = lowY + 2; // lowY 是最低价对应的 Y 坐标

            [percentText drawAtPoint:CGPointMake(textX, textY) withAttributes:percentAttr];
        }
    }
    
    //长按十字线
    if (self.showCrossLine) {
        NSInteger index = round(self.crossPoint.x / (self.candleWidth + space));
        
        if (index >= 0 && index < self.visibleKLineData.count) {
            KLineModel *model = self.visibleKLineData[index];
            
            //回调显示k线计算结果
            if (self.tipModelCallback) {
                self.tipModelCallback(self.visibleKLineData[index]);
            }

            // 计算该蜡烛的中心 X 位置
            CGFloat candleCenterX = index * (self.candleWidth + space) + self.candleWidth / 2.0;
            CGFloat y = self.crossPoint.y;

            // 绘制虚线
            CGContextSetLineWidth(ctx, 0.5);
            CGContextSetStrokeColorWithColor(ctx, [UIColor grayColor].CGColor);
            CGFloat dashPattern[] = {4, 2};
            CGContextSetLineDash(ctx, 0, dashPattern, 2);

            // 横线
            CGContextMoveToPoint(ctx, 0, y);
            CGContextAddLineToPoint(ctx, self.bounds.size.width, y);
            CGContextStrokePath(ctx);

            // 纵线
            CGContextMoveToPoint(ctx, candleCenterX, 0);
            CGContextAddLineToPoint(ctx, candleCenterX, self.bounds.size.height);
            CGContextStrokePath(ctx);
            CGContextSetLineDash(ctx, 0, NULL, 0); // 关闭虚线

            // 长按显示：价格
            CGFloat priceRange = maxPrice - minPrice;
            CGFloat scale = viewHeight / priceRange;
            CGFloat price = maxPrice - y / scale;
            NSString *priceText = [NSString stringWithFormat:@"%.2f", price];
            NSDictionary *attr = @{NSFontAttributeName:[UIFont systemFontOfSize:18], NSForegroundColorAttributeName:[UIColor blackColor]};
            CGSize priceTextSize = [priceText sizeWithAttributes:attr];
            CGFloat leftX = self.contentOffsetX + 2; // 加2是为了内边距美观
            CGFloat priceTextY = y - priceTextSize.height / 2.0;
            [priceText drawAtPoint:CGPointMake(leftX, priceTextY) withAttributes:attr];

            // 长按显示：时间、成交量
            NSDate *date = [NSDate dateWithTimeIntervalSince1970:model.timestamp];
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            formatter.dateFormat = @"yyyy-MM-dd HH";
            NSString *dateStr = [formatter stringFromDate:date];
            NSString *volumeStr = [NSString stringWithFormat:@"量: %.0f", model.volume];
            NSString *info = [NSString stringWithFormat:@"%@  %@", dateStr, volumeStr];
            CGSize textSize = [info sizeWithAttributes:attr];
            // 显示在成交量图下方（比 volume 区域再低一些）
            CGFloat textY = viewHeight - 18; // 比成交量底部低 5px
            CGFloat infoX = MIN(MAX(0, candleCenterX - textSize.width / 2), self.bounds.size.width - textSize.width);
            [info drawAtPoint:CGPointMake(infoX, textY) withAttributes:attr];
        }
    }
    
}

@end

@interface ViewController () <UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) KLineChartView *chartView;
@property (nonatomic, strong) NSArray<KLineModel *> *allKLineData;
@property (nonatomic, strong) NSMutableArray<KLineModel *> *loadedKLineData;
@property (nonatomic, assign) NSInteger currentStartIndex;
@property (nonatomic, strong) TipView *tipView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    
    CGFloat chartHeight = viewHeight + 10 + volumeHeight;
    CGFloat tipViewHeight = self.view.bounds.size.height - SAFE_AREA_TOP_HEIGHT - SAFE_AREA_BOTTOM - chartHeight;
    self.tipView = [[TipView alloc] initWithFrame:CGRectMake(0, SAFE_AREA_TOP_HEIGHT, SCREEN_WIDTH, tipViewHeight)];
    self.tipView.addTo(self.view);

    self.allKLineData = [self loadAllData];
    self.currentStartIndex = 0;
    self.loadedKLineData = [[self loadDataFromIndex:self.currentStartIndex count:MaxVisibleKLineCount] mutableCopy];
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.scrollView.delegate = self;
    [self.view addSubview:self.scrollView];

    [self setupChartView:chartHeight];

    __weak typeof(self) weakSelf = self;
    self.chartView.scaleCallback = ^(BOOL clickState) {
        weakSelf.tipView.hidden = !clickState;
    };
    
    self.chartView.tipModelCallback = ^(KLineModel *tipModel) {
        weakSelf.tipView.model = tipModel;
    };
    
   
    
}

- (void)setupChartView:(CGFloat)chartHeight {
    //计算临时显示view的总长度
    CGFloat width = self.loadedKLineData.count * (8 + space);
    KLineChartView *chartView = [[KLineChartView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - chartHeight - SAFE_AREA_BOTTOM, width, chartHeight)];
    chartView.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.2];
    chartView.visibleKLineData = self.loadedKLineData;
    [self newFindPeaksInData];

    [self.scrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.scrollView addSubview:chartView];
    self.scrollView.contentSize = chartView.bounds.size;
    self.chartView = chartView;
}

- (NSArray<KLineModel *> *)loadAllData {
    NSMutableArray *result = [NSMutableArray array];
    NSArray *paths = [[NSBundle mainBundle] pathsForResourcesOfType:@"json" inDirectory:nil];
    NSArray *sortedPaths = [paths sortedArrayUsingComparator:^NSComparisonResult(NSString *p1, NSString *p2) {
        return [[p1 lastPathComponent] localizedStandardCompare:[p2 lastPathComponent]];
    }];

    for (NSString *filePath in sortedPaths) {
        NSData *data = [NSData dataWithContentsOfFile:filePath];
        if (!data) continue;
        NSError *error;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        if (error) continue;
        NSArray *klineList = json[@"data"][@"kline_list"];
        for (NSDictionary *dict in klineList) {
            KLineModel *model = [[KLineModel alloc] init];
            model.open = [dict[@"open_price"] floatValue];
            model.high = [dict[@"high_price"] floatValue];
            model.low = [dict[@"low_price"] floatValue];
            model.close = [dict[@"close_price"] floatValue];
            model.timestamp = [dict[@"timestamp"] doubleValue];
            model.volume = [dict[@"volume"] floatValue];
            [result addObject:model];
        }
    }
    return result;
}

- (NSArray<KLineModel *> *)loadDataFromIndex:(NSInteger)start count:(NSInteger)count {
    if (start < 0) start = 0;
    NSInteger end = MIN(start + count, self.allKLineData.count);
    return [self.allKLineData subarrayWithRange:NSMakeRange(start, end - start)];
}

-(void)newFindPeaksInData {
    
    if (self.loadedKLineData.count < 8) return;
    
    for (NSInteger i = 7; i < self.loadedKLineData.count; i++) {
        
        // 每次循环开始前清空当前K线的条件记录
        [self clearConditionPropertiesForIndex:i];
        
        // ==============================================================
        // 信息初始化
        // ==============================================================
        
        KLineModel *model_1  = self.loadedKLineData[i];    //第一根
        KLineModel *model_2  = self.loadedKLineData[i - 1];//第二根
        KLineModel *model_3  = self.loadedKLineData[i - 2];//第三根
        KLineModel *model_4  = self.loadedKLineData[i - 3];//第四根
        KLineModel *model_5  = self.loadedKLineData[i - 4];//第五根
        KLineModel *model_6  = self.loadedKLineData[i - 5];//第六根
        KLineModel *model_7  = self.loadedKLineData[i - 6];//第七根
        KLineModel *model_8  = self.loadedKLineData[i - 7];//第八根
        
        BOOL model_1_rise = model_1.close > model_1.open ? YES : NO;//model_1是否升
        BOOL model_2_rise = model_2.close > model_2.open ? YES : NO;//model_2是否升
        BOOL model_3_rise = model_3.close > model_3.open ? YES : NO;//model_3是否升
        BOOL model_4_rise = model_4.close > model_4.open ? YES : NO;//model_4是否升
        BOOL model_5_rise = model_5.close > model_5.open ? YES : NO;//model_5是否升
        BOOL model_6_rise = model_6.close > model_6.open ? YES : NO;//model_6是否升
        BOOL model_7_rise = model_7.close > model_7.open ? YES : NO;//model_7是否升
        BOOL model_8_rise = model_8.close > model_8.open ? YES : NO;//model_8是否升
        
        // 计算每一条的升跌幅
        float model_1_percent = 0.0;//第一条的涨跌幅
        if (model_1_rise) {//第一条: 升
            model_1_percent = (model_1.close - model_1.open) / model_1.open;//算法确认
        } else {//第一条: 跌
            model_1_percent = (model_1.open - model_1.close) / model_1.open;//算法确认
        }
        
        float model_2_percent = 0.0;//第二条的涨跌幅
        if (model_2_rise) {//第二条: 升
            model_2_percent = (model_2.close - model_2.open) / model_2.open;//算法确认
        } else {//第二条: 跌
            model_2_percent = (model_2.open - model_2.close) / model_2.open;//算法确认
        }
        
        float model_3_percent = 0.0;//第三条的涨跌幅
        if (model_3_rise) {//第三条: 升
            model_3_percent = (model_3.close - model_3.open) / model_3.open;//算法确认
        } else {//第三条: 跌
            model_3_percent = (model_3.open - model_3.close) / model_3.open;//算法确认
        }
        
        float model_4_percent = 0.0;//第四条的涨跌幅
        if (model_4_rise) {//第四条: 升
            model_4_percent = (model_4.close - model_4.open) / model_4.open;//算法确认
        } else {//第四条: 跌
            model_4_percent = (model_4.open - model_4.close) / model_4.open;//算法确认
        }
        
        float model_5_percent = 0.0;//第五条的涨跌幅
        if (model_5_rise) {//第五条: 升
            model_5_percent = (model_5.close - model_5.open) / model_5.open;//算法确认
        } else {//第五条: 跌
            model_5_percent = (model_5.open - model_5.close) / model_5.open;//算法确认
        }
        
        float model_6_percent = 0.0;//第六条的涨跌幅
        if (model_6_rise) {//第六条: 升
            model_6_percent = (model_6.close - model_6.open) / model_6.open;//算法确认
        } else {//第六条: 跌
            model_6_percent = (model_6.open - model_6.close) / model_6.open;//算法确认
        }
        
        float model_7_percent = 0.0;//第七条的涨跌幅
        if (model_7_rise) {//第七条: 升
            model_7_percent = (model_7.close - model_7.open) / model_7.open;//算法确认
        } else {//第七条: 跌
            model_7_percent = (model_7.open - model_7.close) / model_7.open;//算法确认
        }
        
        float model_8_percent = 0.0;//第八条的涨跌幅
        if (model_8_rise) {//第八条: 升
            model_8_percent = (model_8.close - model_8.open) / model_8.open;//算法确认
        } else {//第八条: 跌
            model_8_percent = (model_8.open - model_8.close) / model_8.open;//算法确认
        }
        
        
        // ==============================================================
        // 规范3
        // 跌(第四条,第三条) 两条其中一条跌幅大于0.25%,第一条,第二条最好跌,如果是升,升幅不能超过0.1%
        // 升(第五条,第六条) 两条其中一条升幅大于0.25%,第七条,第八条最好升 如果是跌,跌幅不能超过0.1%
        // ==============================================================
        BOOL specification_3_falling_k4 = NO;
        if (model_4_rise == NO) {
            specification_3_falling_k4 = YES;
            self.loadedKLineData[i].condition_1 = @"(满足) 第四条跌";
        } else {
            self.loadedKLineData[i].condition_1 = @"(不满足) 第四条不是跌";
        }
        
        BOOL specification_3_falling_k3 = NO;
        if (model_3_rise == NO) {
            if (model_3_percent >= 0.0025) {
                specification_3_falling_k3 = YES;
                self.loadedKLineData[i].condition_2 = @"(满足) 第三条跌 && 跌幅 大于 0.25%";
            } else {
                if (model_4_rise == NO && model_4_percent >= 0.0025) {
                    specification_3_falling_k3 = YES;
                    self.loadedKLineData[i].condition_2 = @"(满足) 虽然第三条是跌幅小于0.25% 但是 第四条跌幅 大于 0.25%";
                } else {
                    self.loadedKLineData[i].condition_2 = @"(不满足) 第三条跌幅小于0.25% && 第四条跌幅小于0.25%";
                }
            }
        } else {
            if (model_3_percent <= 0.001 && model_4_rise == NO && model_4_percent >= 0.0025) {
                self.loadedKLineData[i].condition_2 = @"(满足) 即使第三条升幅 小于 0.1% 但是 第四条跌幅 大于 0.25%";
            } else {
                self.loadedKLineData[i].condition_2 = @"(不满足) 第三条是升 && 第四条跌幅小于0.25%";
            }
        }
        
        BOOL specification_3_falling_k2 = NO;
        if (model_2_rise == NO) {
            specification_3_falling_k2 = YES;
            self.loadedKLineData[i].condition_3 = @"(满足) 第二条是跌";
        } else {
            if (model_2_percent <= 0.001) {
                specification_3_falling_k2 = YES;
                self.loadedKLineData[i].condition_3 = @"(满足) 第二条升幅 小于 0.1%";
            }
        }
        
        BOOL specification_3_falling_k1 = NO;
        if (model_1_rise == NO) {
            specification_3_falling_k1 = YES;
            self.loadedKLineData[i].condition_4 = @"(满足) 第一条是跌";
        } else {
            if (model_1_percent <= 0.001) {
                specification_3_falling_k1 = YES;
                self.loadedKLineData[i].condition_4 = @"(满足) 第一条升幅小于0.1%";
            }
        }
        
        BOOL specification_3_falling_k5 = NO;
        if (model_5_rise == YES) {
            specification_3_falling_k5 = YES;
            self.loadedKLineData[i].condition_5 = @"(满足) 第五条升";
        }
        
        BOOL specification_3_falling_k6 = NO;
        if (model_6_rise == YES) {
            if (model_6_percent >= 0.0025) {
                specification_3_falling_k6 = YES;
                self.loadedKLineData[i].condition_6 = @"(满足) 第六条升 && 跌幅 大于 0.25%";
            } else {
                if (model_5_rise == YES && model_5_percent >= 0.0025) {
                    specification_3_falling_k6 = YES;
                    self.loadedKLineData[i].condition_6 = @"(满足) 虽然第六条是升小于0.25% 但是 第五条升幅 大于 0.25%";
                } else {
                    self.loadedKLineData[i].condition_6 = @"(不满足) 第六条跌幅小于0.25% && 第五条跌幅小于0.25%";
                }
            }
        } else {
            if (model_6_percent <= 0.001 && model_5_rise == YES && model_5_percent >= 0.0025) {
                self.loadedKLineData[i].condition_6 = @"(满足) 虽然第六条升幅 小于 0.1% 但是 第五条升幅 大于 0.25%";
            } else {
                self.loadedKLineData[i].condition_6 = @"(不满足) 第六条是升 && 第五条升幅小于0.25%";
            }
        }
        
        BOOL specification_3_falling_k7 = NO;
        if (model_7_rise == YES) {
            specification_3_falling_k7 = YES;
            self.loadedKLineData[i].condition_7 = @"(满足) 第七条是升";
        } else {
            if (model_7_percent <= 0.001) {
                specification_3_falling_k7 = YES;
                self.loadedKLineData[i].condition_7 = @"(满足) 虽然第七条是跌 但是跌幅小于0.1%";
            } else {
                self.loadedKLineData[i].condition_7 = @"(不满足) 第七条跌幅大于0.1%";
            }
        }
        
        BOOL specification_3_falling_k8 = NO;
        if (model_8_rise == YES) {
            specification_3_falling_k8 = YES;
            self.loadedKLineData[i].condition_8 = @"(满足) 第八条是升";
        } else {
            if (model_8_percent <= 0.001) {
                specification_3_falling_k8 = YES;
                self.loadedKLineData[i].condition_8 = @"(满足) 虽然第八条是跌 但是跌幅小于0.1%";
            } else {
                self.loadedKLineData[i].condition_8 = @"(不满足) 第八条跌幅大于0.1%";
            }
        }
        
        BOOL isSpecification3 = NO;
        if (specification_3_falling_k4 && specification_3_falling_k3 && specification_3_falling_k2 && specification_3_falling_k1 && specification_3_falling_k5 && specification_3_falling_k6 && specification_3_falling_k7 && specification_3_falling_k8) {
            self.loadedKLineData[i - 3].mountainPeakTag = @"规范3";
            self.loadedKLineData[i].condition_9 = @"全部满足 规范3";
            isSpecification3 = YES;
        }
        
        // 如果满足规范三，直接跳过下面规范四的判断，继续下一轮循环
        if (isSpecification3) {
            continue;
        }
        
        // ==============================================================
        // 规范4
        // 第一条 到 第四条 跌幅最少0.47%
        // 第五条 到 第八条 升幅最少0.21%
        
        //跌的部分
        // 如果第三条升,升幅不能超过第四条75%  或者可以大于75%,但是第三条不能高于第四条,且第一条或者第二条跌幅是第三条的2倍
        // 如果第二条升,升幅不能超过第三条75%  或者可以大于75%,但是第二条不能高于第三条,且第一条或者第四条跌幅是第二条的2倍
        // 如果第一条升,升幅不能超过第二条75%  或者可以大于75%,但是第一条不能高于第二条,且第三条或者第四条跌幅是第一条的2倍
        // 如果第二条, 第三条升(两条加起来)不能超过第四条的70%  或者可以大于70% 但是第二条, 第三条升(两条加起来)不能超过第四条 且第一条跌幅是第二条, 第三条升(两条加起来)的两倍
        // 如果第一条, 第二条升(两条加起来)不能超过第三条的70%  或者可以大于70% 但是第一条, 第二条升(两条加起来)不能超过第三条 且第四条跌幅是第一条, 第二条升(两条加起来)的两倍
        // 如果第一条, 第三条 第一条升幅不能超过第二条的70%  第三条升幅不能超过第四条的70%
        // 如果第一条, 第二条, 第三条升(三条加起来)不能超过第四条的35%
        
        // 升的部分
        // 如果第六条跌,跌幅不能超过第五条75%
        // 如果第七条跌,跌幅不能超过第六条75%
        // 如果第八条跌,跌幅不能超过第七条75%
        // 如果第八条, 第七条跌(两条加起来)不能超过第六条的70%  (第五条跌多少目前没有规定)
        // 如果第七条, 第六条跌(两条加起来)不能超过第五条的70%  (第八条跌多少目前没有规定)
        // 如果第八条, 第六条, 第八条跌幅不能超过第七条的70%  第六条跌幅不能超过第五条的70%
        // 如果第八条, 第七条, 第六条跌(三条加起来)不能超过第五条的35%
        // ==============================================================
        
        [self clearConditionPropertiesForIndex:i];

        //跌的部分
        BOOL fallingPart = NO;
        if (model_1_rise == NO && model_2_rise == NO && model_3_rise == NO && model_4_rise == NO) {//四条跌
            fallingPart = YES;
            self.loadedKLineData[i].condition_1 = @"(满足)跌的部分: 四条跌";
        } else if (model_1_rise == NO && model_2_rise == NO && model_3_rise == YES && model_4_rise == NO) {//只有第三条升
            if (model_3_percent / model_4_percent < 0.75) {
                fallingPart = YES;
                self.loadedKLineData[i].condition_1 = @"(满足)跌的部分:  第三条升 并且 没有达到第四条75%";
            } else {
                if (model_3_percent < model_4_percent) {
                    if ((model_1_percent > 0.004 && (model_1_percent / model_3_percent > 2)) || (model_2_percent > 0.004 && (model_2_percent / model_3_percent > 2))){
                        self.loadedKLineData[i].condition_1 =@"(满足)跌的部分:第一条跌 跌幅是第三条的2倍以上\n  第二条跌 跌幅是第三条的2倍以上";
                        fallingPart =YES;
                    }else {
                        self.loadedKLineData[i].condition_1 = @"(不满足)跌的部分:第一条升幅超过第二条75%";
                    }
                } else {
                    self.loadedKLineData[i].condition_1 = @"(不满足)跌的部分:第一条升幅超过第二条75%";
                }
            }
        } else if (model_1_rise == NO && model_2_rise == YES && model_3_rise == NO && model_4_rise == NO) {//只有第二条升
            if (model_2_percent / model_3_percent < 0.75) {
                fallingPart = YES;
                self.loadedKLineData[i].condition_1 = @"(满足)跌的部分:  第二条升 并且 没有达到第三条75%";
            } else {
                if (model_2_percent < model_3_percent) {
                    if ((model_1_percent > 0.004 && (model_1_percent / model_2_percent > 2)) || (model_4_percent > 0.004 && (model_4_percent / model_2_percent > 2))){
                        self.loadedKLineData[i].condition_1 =@"(满足)跌的部分:第四条跌 跌幅是第二条的2倍以上\n第一条跌 跌幅是第二条的2倍以上";
                        fallingPart =YES;
                    }else {
                        self.loadedKLineData[i].condition_1 = @"(不满足)跌的部分:第一条升幅超过第二条75%";
                    }
                } else {
                    self.loadedKLineData[i].condition_1 = @"(不满足)跌的部分:第一条升幅超过第二条75%";
                }
            }
        } else if (model_1_rise == YES && model_2_rise == NO && model_3_rise == NO && model_4_rise == NO) {//只有第一条升
            if (model_1_percent / model_2_percent < 0.75) {
                fallingPart = YES;
                self.loadedKLineData[i].condition_1 = @"(满足)跌的部分:  第一条升 并且 没有达到第二条75%";
            } else {
                if (model_1_percent < model_2_percent) {
                    if ((model_3_percent > 0.004 && (model_3_percent / model_1_percent > 2)) || (model_4_percent > 0.004 && (model_4_percent / model_1_percent > 2))){
                        self.loadedKLineData[i].condition_1 =@"(满足)跌的部分:第三条跌 跌幅是第一条的2倍以上\n第四条跌 跌幅是第一条的2倍以上";
                        fallingPart =YES;
                    }else {
                        self.loadedKLineData[i].condition_1 = @"(不满足)跌的部分:第一条升幅超过第二条75%";
                    }
                } else {
                    self.loadedKLineData[i].condition_1 = @"(不满足)跌的部分:第一条升幅超过第二条75%";
                }
            }
        } else if (model_1_rise == NO && model_2_rise == YES && model_3_rise == YES && model_4_rise == NO) {//第二条, 第三条升
            if ((model_2_percent + model_3_percent) / model_4_percent < 0.7){//第二条, 第三条 加起来没有 第四条 70%
                fallingPart = YES;
                self.loadedKLineData[i].condition_1 = @"(满足)跌的部分:  第二条, 第三条升 并且 两条加起来\n不到第四条70%";
            } else {
                if ((model_2_percent + model_3_percent) < model_4_percent) {
                    if (model_1_percent > 0.004 && (model_1_percent / (model_2_percent + model_3_percent) > 2)){
                        self.loadedKLineData[i].condition_1 =@"(满足)跌的部分:虽然第二第三条加起来超过第四条70%\n但是第一条的下跌是第二第三条加起来的两倍";
                        fallingPart =YES;
                    }else {
                        self.loadedKLineData[i].condition_1 = @"(不满足)跌的部分:第一条升幅超过第二条75%";
                    }
                } else {
                    self.loadedKLineData[i].condition_1 = @"(不满足)跌的部分:第一条升幅超过第二条75%";
                }
            }
        } else if (model_1_rise == YES && model_2_rise == YES && model_3_rise == NO && model_4_rise == NO) {//第一条, 第二条升
            if ((model_1_percent + model_2_percent) / model_3_percent < 0.7) {//第一条, 第二条 加起来没有 第三条 70%
                fallingPart = YES;
                self.loadedKLineData[i].condition_1 = @"(满足)跌的部分:  第一条, 第二条升 并且 两条加起来\n不到第三条70%";
            } else {
                if ((model_1_percent + model_2_percent) < model_3_percent) {
                    if (model_4_percent > 0.004 && (model_4_percent / (model_1_percent + model_2_percent) > 2)){
                        self.loadedKLineData[i].condition_1 =@"(满足)跌的部分:虽然第一第二条加起来超过第三条70%\n但是第四条的下跌是第一第二条加起来的两倍";
                        fallingPart =YES;
                    }else {
                        self.loadedKLineData[i].condition_1 = @"(不满足)跌的部分:第一条升幅超过第二条75%";
                    }
                } else {
                    self.loadedKLineData[i].condition_1 = @"(不满足)跌的部分:第一条升幅超过第二条75%";
                }
            }
        } else if (model_1_rise == NO && model_2_rise == YES && model_3_rise == NO && model_4_rise == YES) {//第一条涨, 第三条升
            if (model_3_percent / model_4_percent < 0.7 && model_1_percent / model_2_percent < 0.7) {//第三条上涨没有去到第四条的70% && 第一条上涨没有去到第二条的70%
                fallingPart = YES;
                self.loadedKLineData[i].condition_1 = @"(满足)跌的部分:  第一条, 第三条升 并且 第一条上涨没有去到第二条\n的70%  和 第三条上涨没有去到第四条的70%";
            } else {
                self.loadedKLineData[i].condition_1 = @"(不满足)跌的部分:  第一条, 第三条升 并且 第一条上涨超过第二条\n的70%  和 第三条上涨超过第四条的70%";
            }
        } else if (model_1_rise == YES && model_2_rise == YES && model_3_rise == YES && model_4_rise == NO) {//第一条, 第二条, 第三条升
            if ((model_1_percent + model_2_percent + model_3_percent) / model_4_percent < 0.35) {//第一条, 第二条, 第三条 加起来没有 第四条 35%
                fallingPart = YES;
                self.loadedKLineData[i].condition_1 = @"(满足)跌的部分:  第一条,第二条,第三条升 并且 三条加起来没有\n超过第四条的35%";
            } else {
                self.loadedKLineData[i].condition_1 = @"(不满足)跌的部分:  第一条,第二条,第三条升 并且 三条加起来\n超过第四条的35%";
            }
        } else {
            self.loadedKLineData[i].condition_1 = @"(不满足)跌的部分";
        }
        
        //升的部分
        BOOL risePart = NO;
        if (model_5_rise == YES && model_6_rise == YES && model_7_rise == YES && model_8_rise == YES) {//四条涨
            risePart = YES;
            self.loadedKLineData[i].condition_2 = @"(满足)升的部分: 四条升";
        } else if (model_5_rise == YES && model_6_rise == NO && model_7_rise == YES && model_8_rise == YES) {//只有第六条 跌
            if (model_6_percent / model_5_percent  < 0.75) {
                risePart = YES;
                self.loadedKLineData[i].condition_2 = @"(满足)升的部分:  第六条跌 并且 没有达到第五条75%";
            } else {
                self.loadedKLineData[i].condition_2 = @"(不满足)升的部分:  第六条跌 并且 超过第五条75%";
            }
        } else if (model_5_rise == YES && model_6_rise == YES && model_7_rise == NO && model_8_rise == YES) {//只有第七条 跌
            if (model_7_percent / model_6_percent < 0.75) {
                risePart = YES;
                self.loadedKLineData[i].condition_2 = @"(满足)升的部分:  第七条跌 并且 没有达到第六条75%";
            } else {
                self.loadedKLineData[i].condition_2 = @"(不满足)升的部分:  第七条跌 并且 超过第六条75%";
            }
        } else if (model_5_rise == YES && model_6_rise == YES && model_7_rise == YES && model_8_rise == NO) {//只有第八条 跌
            if (model_8_percent / model_7_percent < 0.75) {
                risePart = YES;
                self.loadedKLineData[i].condition_2 = @"(满足)升的部分:  第八条跌 并且 没有达到第七条75%";
            } else {
                self.loadedKLineData[i].condition_2 = @"(不满足)升的部分:  第八条跌 并且 超过第七条75%";
            }
        } else if (model_5_rise == YES && model_6_rise == NO && model_7_rise == NO && model_8_rise == YES) {//第六条, 第七条 跌
            if ((model_6_percent + model_7_percent) / model_8_percent < 0.7) {
                risePart = YES;
                self.loadedKLineData[i].condition_2 = @"(满足)升的部分: 第六条, 第七条 跌 \n并且 第六条, 第七条加起来没有超过第八条70%";
            } else {
                self.loadedKLineData[i].condition_2 = @"(不满足)升的部分: 第六条, 第七条 跌 \n并且 第六条, 第七条加起来超过第八条70%";
            }
        } else if (model_5_rise == YES && model_6_rise == YES && model_7_rise == NO && model_8_rise == NO) {//第七条跌, 第八条 跌
            if ((model_7_percent + model_8_percent) / model_6_percent < 0.7) {
                risePart = YES;
                self.loadedKLineData[i].condition_2 = @"(满足)升的部分: 第七条, 第八条 跌 \n并且 第七条, 第八条加起来没有超过第六条70%";
            } else {
                self.loadedKLineData[i].condition_2 = @"(不满足)升的部分: 第七条, 第八条 跌 \n并且 第七条, 第八条加起来超过第六条70%";
            }
        } else if (model_5_rise == YES && model_6_rise == NO && model_7_rise == YES && model_8_rise == NO) {//第六条, 第八条 跌
            if (model_6_percent / model_5_percent < 0.7 && model_8_percent / model_7_percent < 0.7) {//第六条上涨没有去到第五条的70% && 第八条上涨没有去到第七条的70%
                risePart = YES;
                self.loadedKLineData[i].condition_2 = @"(满足)升的部分: 第六条, 第八条 跌 并且 第六条\n没有超过第五条70%,第八条没有超过第七条70%";
            } else {
                self.loadedKLineData[i].condition_2 = @"(不满足)升的部分: 第六条, 第八条 跌 并且 第六条\n没有第五条70%,第八条没有第七条70%";
            }
        } else if (model_5_rise == YES && model_6_rise == NO && model_7_rise == NO && model_8_rise == NO) {//第六条, 第七条, 第八条 跌
            if ((model_6_percent + model_7_percent + model_8_percent) / model_5_percent < 0.35) {//第六条, 第七条, 第八条 加起来没有 第五条 35%
                risePart = YES;
                self.loadedKLineData[i].condition_2 = @"(满足)升的部分: 第六条,第七条,第八条 跌 并且 第六条,\n第七条,第八条加起来没有超过第五条35%";
            } else {
                self.loadedKLineData[i].condition_2 = @"(不满足)升的部分: 第六条,第七条,第八条 跌 并且 第六条,\n第七条,第八条加起来超过第五条35%";
            }
        } else {
            self.loadedKLineData[i].condition_2 = @"(不满足)升的部分";
        }


        //跌0.47%
        BOOL specification_4_fallingPrecent = NO;
        if ((model_4.open - model_1.close) / model_4.open >= 0.0047) {
            specification_4_fallingPrecent = YES;
            float model_1_percent_value = model_1_rise ? model_1_percent : -model_1_percent;
            float model_2_percent_value = model_2_rise ? model_2_percent : -model_2_percent;
            float model_3_percent_value = model_3_rise ? model_3_percent : -model_3_percent;
            float model_4_percent_value = model_4_rise ? model_4_percent : -model_4_percent;
            float percent = model_1_percent_value + model_2_percent_value + model_3_percent_value + model_4_percent_value;
            self.loadedKLineData[i].condition_3 = [NSString stringWithFormat:@"(满足)实际跌: %.2f%%(K1 %.2f, K2 %.2f, K3 %.2f, K4 %.2f)",percent * 100, model_1_percent_value * 100, model_2_percent_value * 100, model_3_percent_value * 100, model_4_percent_value * 100];
        } else {
            float model_1_percent_value = model_1_rise ? model_1_percent : -model_1_percent;
            float model_2_percent_value = model_2_rise ? model_2_percent : -model_2_percent;
            float model_3_percent_value = model_3_rise ? model_3_percent : -model_3_percent;
            float model_4_percent_value = model_4_rise ? model_4_percent : -model_4_percent;
            float percent = model_1_percent_value + model_2_percent_value + model_3_percent_value + model_4_percent_value;
            self.loadedKLineData[i].condition_3 = [NSString stringWithFormat:@"(不满足)实际跌: %.2f%%(K1 %.2f, K2 %.2f, K3 %.2f, K4 %.2f)",percent * 100, model_1_percent_value * 100, model_2_percent_value * 100, model_3_percent_value * 100, model_4_percent_value * 100];
        }
 
        //升0.21%
        BOOL specification_4_risePrecent = NO;
        if ((model_5.close - model_8.open) / model_8.open >= 0.0021) {
            specification_4_risePrecent = YES;
            float model_5_percent_value = model_5_rise ? model_5_percent : -model_5_percent;
            float model_6_percent_value = model_6_rise ? model_6_percent : -model_6_percent;
            float model_7_percent_value = model_7_rise ? model_7_percent : -model_7_percent;
            float model_8_percent_value = model_8_rise ? model_8_percent : -model_8_percent;
            float percent = model_5_percent_value + model_6_percent_value + model_7_percent_value + model_8_percent_value;
            self.loadedKLineData[i].condition_4 = [NSString stringWithFormat:@"(满足)实际升: %.2f%%(K5 %.2f, K6 %.2f, K7 %.2f, K8 %.2f)",percent * 100, model_5_percent_value * 100, model_6_percent_value * 100, model_7_percent_value * 100, model_8_percent_value * 100];
        } else {
            float model_5_percent_value = model_5_rise ? model_5_percent : -model_5_percent;
            float model_6_percent_value = model_6_rise ? model_6_percent : -model_6_percent;
            float model_7_percent_value = model_7_rise ? model_7_percent : -model_7_percent;
            float model_8_percent_value = model_8_rise ? model_8_percent : -model_8_percent;
            float percent = model_5_percent_value + model_6_percent_value + model_7_percent_value + model_8_percent_value;
            self.loadedKLineData[i].condition_4 = [NSString stringWithFormat:@"(不满足)实际升: %.2f%%(K5 %.2f, K6 %.2f, K7 %.2f, K8 %.2f)",percent * 100, model_5_percent_value * 100, model_6_percent_value * 100, model_7_percent_value * 100, model_8_percent_value * 100];
        }
        
        BOOL isSpecification4 = NO;
        if (fallingPart && risePart && specification_4_fallingPrecent && specification_4_risePrecent) {
            isSpecification4 = YES;
            self.loadedKLineData[i - 3].mountainPeakTag = @"规范4";
            self.loadedKLineData[i].condition_5 = @"全部满足  规范4 涨跌大于0.47%  升大于0.21%";
        }
        
        // 如果满足规范三，直接跳过下面规范四的判断，继续下一轮循环
        if (isSpecification4) {
            continue;
        }

    }
}

// 清空条件属性
- (void)clearConditionPropertiesForIndex:(NSInteger)index {
    KLineModel *model = self.loadedKLineData[index];
    model.condition_1 = nil;
    model.condition_2 = nil;
    model.condition_3 = nil;
    model.condition_4 = nil;
    model.condition_5 = nil;
    model.condition_6 = nil;
    model.condition_7 = nil;
    model.condition_8 = nil;
    model.condition_9 = nil;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    self.chartView.contentOffsetX = scrollView.contentOffset.x;
    
    CGFloat candleFullWidth = self.chartView.candleWidth + space;
    CGFloat maxOffsetX = self.loadedKLineData.count * candleFullWidth - SCREEN_WIDTH;

    // 向右滑到底部-把之前左边就的数据删除（数组最多存900个模型）
    if (scrollView.contentOffset.x >= maxOffsetX - 50) {
        NSInteger nextStart = self.currentStartIndex + MaxVisibleKLineCount;
        if (nextStart < self.allKLineData.count) {
            NSInteger nextCount = MIN(MaxVisibleKLineCount, self.allKLineData.count - nextStart);
            NSArray *newData = [self loadDataFromIndex:nextStart count:nextCount];

            [self.loadedKLineData addObjectsFromArray:newData];
            self.currentStartIndex = nextStart;

            // 删除左边多余的数据
            if (self.loadedKLineData.count > MaxCacheKLineCount) {
                NSInteger toRemove = self.loadedKLineData.count - MaxCacheKLineCount;
                NSRange removeRange = NSMakeRange(0, toRemove);
                [self.loadedKLineData removeObjectsInRange:removeRange];

                // 更新 scrollView.contentOffset 保持视觉不跳动
                scrollView.contentOffset = CGPointMake(scrollView.contentOffset.x - toRemove * candleFullWidth, 0);
            }

            // 更新图表
            self.chartView.visibleKLineData = self.loadedKLineData;
            [self newFindPeaksInData];
            CGFloat newWidth = self.loadedKLineData.count * candleFullWidth;
            self.chartView.frame = CGRectMake(0, self.chartView.frame.origin.y, newWidth, self.chartView.frame.size.height);
            self.scrollView.contentSize = CGSizeMake(newWidth, self.scrollView.contentSize.height);
            [self.chartView setNeedsDisplay];
        }
    // 向左滑到底部-把之前右边就的数据删除（数组最多存900个模型）
    }else if (scrollView.contentOffset.x <= 50 && self.currentStartIndex > 0) {
        NSInteger prevCount = MaxVisibleKLineCount;
        NSInteger prevStart = MAX(self.currentStartIndex - prevCount, 0);
        NSArray *prevData = [self loadDataFromIndex:prevStart count:(self.currentStartIndex - prevStart)];
        
        if (prevData.count > 0) {
            [self.loadedKLineData insertObjects:prevData atIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, prevData.count)]];
            self.currentStartIndex = prevStart;

            // 删除右边多余数据
            if (self.loadedKLineData.count > MaxCacheKLineCount) {
                NSInteger toRemove = self.loadedKLineData.count - MaxCacheKLineCount;
                NSRange removeRange = NSMakeRange(self.loadedKLineData.count - toRemove, toRemove);
                [self.loadedKLineData removeObjectsInRange:removeRange];
            }

            // 更新图表
            self.chartView.visibleKLineData = self.loadedKLineData;
            [self newFindPeaksInData];
            CGFloat newWidth = self.loadedKLineData.count * candleFullWidth;
            self.chartView.frame = CGRectMake(0, self.chartView.frame.origin.y, newWidth, self.chartView.frame.size.height);
            self.scrollView.contentSize = CGSizeMake(newWidth, self.scrollView.contentSize.height);

            // 向左插入后，调整 contentOffset 避免跳动
            scrollView.contentOffset = CGPointMake(scrollView.contentOffset.x + prevData.count * candleFullWidth, 0);
            
            [self.chartView setNeedsDisplay];
        }
    }

}

@end





