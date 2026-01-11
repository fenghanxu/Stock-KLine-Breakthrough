

#import "ViewController.h"
#define viewHeight 300 // 蜡烛图高度
#define space 3 // 每条蜡烛图的间隙
#define MaxVisibleKLineCount 300 // 每次提取限制300个数据
#define MaxCacheKLineCount 600 // 数组限制最多600个可视数据
#define volumeHeight 80  // 成交量图形高度
#define present_0_23 0.0023 //山峰 下跌0.23%

// 计算结果模型
@interface ResultModel : NSObject
@property (nonatomic, assign) BOOL      result;
@property (nonatomic,   copy) NSString *prompt;
@end

@implementation ResultModel
@end

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
                
                if ([self.visibleKLineData[i].mountainPeakTag isEqualToString:@"山峰"]) {
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
                } else if ([self.visibleKLineData[i].mountainPeakTag isEqualToString:@"低谷"]) {
                    CGFloat x = i * (self.candleWidth + space) + self.candleWidth/2;

                    // 先获取涨幅数字的底部位置
                    CGFloat percentTextY = lowY + 2; // 这是涨幅数字的 Y 坐标
                    CGFloat peakOffset = 12; // 山峰文字距离涨幅数字的距离，可调整
                    CGFloat y = percentTextY + peakOffset;

                    // 可选：在峰底画一个小红点
                    CGContextRef ctx = UIGraphicsGetCurrentContext();
                    CGContextSetFillColorWithColor(ctx, [UIColor redColor].CGColor);
                    CGContextFillEllipseInRect(ctx, CGRectMake(x - 2, y, 4, 4));
                    
                    // 绘制低谷标记文字
                    NSString *peakText = self.visibleKLineData[i].mountainPeakTag;
                    NSDictionary *attrs = @{
                        NSFontAttributeName: [UIFont systemFontOfSize:10],
                        NSForegroundColorAttributeName: [UIColor redColor]
                    };
                    CGSize textSize = [peakText sizeWithAttributes:attrs];
                    CGRect textRect = CGRectMake(x - textSize.width/2, y + 4, textSize.width, textSize.height);
                    [peakText drawInRect:textRect withAttributes:attrs];
                }

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
    [self findMountain];
    [self backtestByPeakAndValleyRule];
    
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
            [self findMountain];
            [self backtestByPeakAndValleyRule];
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
            [self findMountain];
            [self backtestByPeakAndValleyRule];
            CGFloat newWidth = self.loadedKLineData.count * candleFullWidth;
            self.chartView.frame = CGRectMake(0, self.chartView.frame.origin.y, newWidth, self.chartView.frame.size.height);
            self.scrollView.contentSize = CGSizeMake(newWidth, self.scrollView.contentSize.height);

            // 向左插入后，调整 contentOffset 避免跳动
            scrollView.contentOffset = CGPointMake(scrollView.contentOffset.x + prevData.count * candleFullWidth, 0);
            
            [self.chartView setNeedsDisplay];
        }
    }

}

#pragma mark - 寻找山峰和低谷
-(void)findMountain {
    
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
        // 山峰1
        // ==============================================================
        
        ResultModel *model_5_result = [self judge_kLine_5_rise_5:model_5_rise];
        ResultModel *model_6_result = [self judge_kLine_6_rise_6:model_6_rise withModel_6:model_6 withRise_5:model_5_rise withModel_5:model_5];
        ResultModel *model_7_result = [self judge_kLine_7_rise_7:model_7_rise withModel_7:model_7 withRise_5:model_5_rise withModel_5:model_5];
        ResultModel *model_8_result = [self judge_kLine_8_rise_8:model_8_rise withModel_8:model_8 withRise_5:model_5_rise withModel_5:model_5];
        ResultModel *model_4_result = [self judge_KLine_4_rise_1:model_1_rise withModel_1:model_1 withRise_2:model_2_rise withModel_2:model_2 withRise_3:model_3_rise withModel_3:model_3 withRise_4:model_4_rise withModel_4:model_4];
        ResultModel *model_3_result = [self judge_KLine_3_rise_1:model_1_rise withModel_1:model_1 withRise_2:model_2_rise withModel_2:model_2 withRise_3:model_3_rise withModel_3:model_3 withRise_4:model_4_rise withModel_4:model_4];
        ResultModel *model_2_result = [self judge_KLine_2_rise_1:model_1_rise withModel_1:model_1 withRise_2:model_2_rise withModel_2:model_2 withRise_3:model_3_rise withModel_3:model_3 withRise_4:model_4_rise withModel_4:model_4];
        ResultModel *model_1_result = [self judge_KLine_1_rise_1:model_1_rise withModel_1:model_1 withRise_2:model_2_rise withModel_2:model_2 withRise_3:model_3_rise withModel_3:model_3 withRise_4:model_4_rise withModel_4:model_4];
        
        if (model_1_result.result && model_2_result.result && model_3_result.result && model_4_result.result && model_5_result.result && model_6_result.result && model_7_result.result && model_8_result.result) {
            self.loadedKLineData[i - 3].mountainPeakTag = @"山峰";
        }
        
        self.loadedKLineData[i - 3].condition_1 = model_1_result.prompt;
        self.loadedKLineData[i - 3].condition_2 = model_2_result.prompt;
        self.loadedKLineData[i - 3].condition_3 = model_3_result.prompt;
        self.loadedKLineData[i - 3].condition_4 = model_4_result.prompt;
        self.loadedKLineData[i - 3].condition_5 = model_5_result.prompt;
        self.loadedKLineData[i - 3].condition_6 = model_6_result.prompt;
        self.loadedKLineData[i - 3].condition_7 = model_7_result.prompt;
        self.loadedKLineData[i - 3].condition_8 = model_8_result.prompt;
        
        //特殊1
        if (self.loadedKLineData[i - 3].mountainPeakTag == nil) {
            ResultModel *model_7_result_special = [self special_judge_kLine_7_rise_7:model_7_rise withModel_7:model_7 withRise_5:model_5_rise withModel_5:model_5];
            if (model_1_result.result &&
                model_2_result.result &&
                model_3_result.result &&
                model_4_result.result &&
                model_5_result.result &&
                model_6_result.result &&
                model_7_result_special.result) {
                self.loadedKLineData[i - 3].mountainPeakTag = @"山峰";
                
                self.loadedKLineData[i - 3].condition_1 = model_1_result.prompt;
                self.loadedKLineData[i - 3].condition_2 = model_2_result.prompt;
                self.loadedKLineData[i - 3].condition_3 = model_3_result.prompt;
                self.loadedKLineData[i - 3].condition_4 = model_4_result.prompt;
                self.loadedKLineData[i - 3].condition_5 = model_5_result.prompt;
                self.loadedKLineData[i - 3].condition_6 = model_6_result.prompt;
                self.loadedKLineData[i - 3].condition_7 = model_7_result_special.prompt;
                self.loadedKLineData[i - 3].condition_8 = @"不需要";
            }
        }
        
        //特殊2
        if (self.loadedKLineData[i - 3].mountainPeakTag == nil) {
            ResultModel *special_2 = [self special_falling_1_falling_3_rise_rise_1:model_1_rise withModel_1:model_1 withRise_2:model_2_rise withModel_2:model_2 withRise_3:model_3_rise withModel_3:model_3 withRise_4:model_4_rise withModel_4:model_4];
            ResultModel *model_7_result_special = [self special_judge_kLine_7_rise_7:model_7_rise withModel_7:model_7 withRise_5:model_5_rise withModel_5:model_5];
            if (special_2.result &&
                model_5_result.result &&
                model_6_result.result &&
                model_7_result_special.result){
                self.loadedKLineData[i - 3].mountainPeakTag = @"山峰";
                
                self.loadedKLineData[i - 3].condition_1 = special_2.prompt;
                self.loadedKLineData[i - 3].condition_2 = @"不需要";
                self.loadedKLineData[i - 3].condition_3 = @"不需要";
                self.loadedKLineData[i - 3].condition_4 = @"不需要";
                self.loadedKLineData[i - 3].condition_5 = model_5_result.prompt;
                self.loadedKLineData[i - 3].condition_6 = model_6_result.prompt;
                self.loadedKLineData[i - 3].condition_7 = model_7_result_special.prompt;
                self.loadedKLineData[i - 3].condition_8 = @"不需要";
            }
        }
        
        //特殊3
        if (self.loadedKLineData[i - 3].mountainPeakTag == nil) {
            ResultModel *special_3 = [self special_falling_2_falling_2_rise_rise_1:model_1_rise withModel_1:model_1 withRise_2:model_2_rise withModel_2:model_2 withRise_3:model_3_rise withModel_3:model_3 withRise_4:model_4_rise withModel_4:model_4];
            ResultModel *model_7_result_special = [self special_judge_kLine_7_rise_7:model_7_rise withModel_7:model_7 withRise_5:model_5_rise withModel_5:model_5];
            if (special_3.result &&
                model_5_result.result &&
                model_6_result.result &&
                model_7_result_special.result){
                self.loadedKLineData[i - 3].mountainPeakTag = @"山峰";
                
                self.loadedKLineData[i - 3].condition_1 = special_3.prompt;
                self.loadedKLineData[i - 3].condition_2 = @"不需要";
                self.loadedKLineData[i - 3].condition_3 = @"不需要";
                self.loadedKLineData[i - 3].condition_4 = @"不需要";
                self.loadedKLineData[i - 3].condition_5 = model_5_result.prompt;
                self.loadedKLineData[i - 3].condition_6 = model_6_result.prompt;
                self.loadedKLineData[i - 3].condition_7 = model_7_result_special.prompt;
                self.loadedKLineData[i - 3].condition_8 = @"不需要";
            }
        }
        
        //特殊4
        if (self.loadedKLineData[i - 3].mountainPeakTag == nil) {
            ResultModel *special_4 = [self special_falling_3_falling_1_rise_rise_1:model_1_rise withModel_1:model_1 withRise_2:model_2_rise withModel_2:model_2 withRise_3:model_3_rise withModel_3:model_3 withRise_4:model_4_rise withModel_4:model_4];
            ResultModel *model_7_result_special = [self special_judge_kLine_7_rise_7:model_7_rise withModel_7:model_7 withRise_5:model_5_rise withModel_5:model_5];
            if (special_4.result &&
                model_5_result.result &&
                model_6_result.result &&
                model_7_result_special.result){
                self.loadedKLineData[i - 3].mountainPeakTag = @"山峰";
                
                self.loadedKLineData[i - 3].condition_1 = special_4.prompt;
                self.loadedKLineData[i - 3].condition_2 = @"不需要";
                self.loadedKLineData[i - 3].condition_3 = @"不需要";
                self.loadedKLineData[i - 3].condition_4 = @"不需要";
                self.loadedKLineData[i - 3].condition_5 = model_5_result.prompt;
                self.loadedKLineData[i - 3].condition_6 = model_6_result.prompt;
                self.loadedKLineData[i - 3].condition_7 = model_7_result_special.prompt;
                self.loadedKLineData[i - 3].condition_8 = @"不需要";
            }
        }
        
        
        [self clearConditionPropertiesForIndex:i];
        
        BOOL model_1_fall = model_1.close < model_1.open;
        BOOL model_2_fall = model_2.close < model_2.open;
        BOOL model_3_fall = model_3.close < model_3.open;
        BOOL model_4_fall = model_4.close < model_4.open;
        BOOL model_5_fall = model_5.close < model_5.open;
        BOOL model_6_fall = model_6.close < model_6.open;
        BOOL model_7_fall = model_7.close < model_7.open;
        BOOL model_8_fall = model_8.close < model_8.open;
        
        // =============================
        // 基础 8 条判断
        // =============================
        
        ResultModel *r5 = [self judge_kLine_5_fall_5:model_5_fall];
        ResultModel *r6 = [self judge_kLine_6_fall_6:model_6_fall withModel_6:model_6 withFall_5:model_5_fall withModel_5:model_5];
        ResultModel *r7 = [self judge_kLine_7_fall_7:model_7_fall withModel_7:model_7 withFall_5:model_5_fall withModel_5:model_5];
        ResultModel *r8 = [self judge_kLine_8_fall_8:model_8_fall withModel_8:model_8 withFall_5:model_5_fall withModel_5:model_5];
        
        ResultModel *r4 = [self judge_KLine_4_fall_1:model_1_fall withModel_1:model_1
                                          withFall_2:model_2_fall withModel_2:model_2
                                          withFall_3:model_3_fall withModel_3:model_3
                                          withFall_4:model_4_fall withModel_4:model_4];
        
        ResultModel *r3 = [self judge_KLine_3_fall_1:model_1_fall withModel_1:model_1
                                          withFall_2:model_2_fall withModel_2:model_2
                                          withFall_3:model_3_fall withModel_3:model_3
                                          withFall_4:model_4_fall withModel_4:model_4];
        
        ResultModel *r2 = [self judge_KLine_2_fall_1:model_1_fall withModel_1:model_1
                                          withFall_2:model_2_fall withModel_2:model_2
                                          withFall_3:model_3_fall withModel_3:model_3
                                          withFall_4:model_4_fall withModel_4:model_4];
        
        ResultModel *r1 = [self judge_KLine_1_fall_1:model_1_fall withModel_1:model_1
                                          withFall_2:model_2_fall withModel_2:model_2
                                          withFall_3:model_3_fall withModel_3:model_3
                                          withFall_4:model_4_fall withModel_4:model_4];
        
        if (r1.result && r2.result && r3.result && r4.result &&
            r5.result && r6.result && r7.result && r8.result) {
            self.loadedKLineData[i - 3].mountainPeakTag = @"低谷";
        }
        
        self.loadedKLineData[i - 3].condition_1 = r1.prompt;
        self.loadedKLineData[i - 3].condition_2 = r2.prompt;
        self.loadedKLineData[i - 3].condition_3 = r3.prompt;
        self.loadedKLineData[i - 3].condition_4 = r4.prompt;
        self.loadedKLineData[i - 3].condition_5 = r5.prompt;
        self.loadedKLineData[i - 3].condition_6 = r6.prompt;
        self.loadedKLineData[i - 3].condition_7 = r7.prompt;
        self.loadedKLineData[i - 3].condition_8 = r8.prompt;
        
        // =============================
        // 特殊 1
        // =============================
        if (!self.loadedKLineData[i - 3].mountainPeakTag) {
            ResultModel *sp7 = [self special_judge_kLine_7_fall_7:model_7_fall
                                                    withModel_7:model_7
                                                     withFall_5:model_5_fall
                                                    withModel_5:model_5];
            
            if (r1.result && r2.result && r3.result && r4.result &&
                r5.result && r6.result && sp7.result) {
                
                self.loadedKLineData[i - 3].mountainPeakTag = @"低谷";
                
                self.loadedKLineData[i - 3].condition_1 = r1.prompt;
                self.loadedKLineData[i - 3].condition_2 = r2.prompt;
                self.loadedKLineData[i - 3].condition_3 = r3.prompt;
                self.loadedKLineData[i - 3].condition_4 = r4.prompt;
                self.loadedKLineData[i - 3].condition_5 = r5.prompt;
                self.loadedKLineData[i - 3].condition_6 = r6.prompt;
                self.loadedKLineData[i - 3].condition_7 = sp7.prompt;
                self.loadedKLineData[i - 3].condition_8 = @"不需要";
            }

        }
        
        // =============================
        // 特殊 2
        // =============================
        if (!self.loadedKLineData[i - 3].mountainPeakTag) {
            ResultModel *sp2 = [self special_rise_1_rise_3_fall_fall_1:model_1_fall withModel_1:model_1
                                         withFall_2:model_2_fall withModel_2:model_2
                                         withFall_3:model_3_fall withModel_3:model_3
                                         withFall_4:model_4_fall withModel_4:model_4];
            
            ResultModel *sp7 = [self special_judge_kLine_7_fall_7:model_7_fall
                                                    withModel_7:model_7
                                                     withFall_5:model_5_fall
                                                    withModel_5:model_5];
            
            if (sp2.result && r5.result && r6.result && r7.result) {
                self.loadedKLineData[i - 3].mountainPeakTag = @"低谷";
                
                self.loadedKLineData[i - 3].condition_1 = sp2.prompt;
                self.loadedKLineData[i - 3].condition_2 = @"不需要";
                self.loadedKLineData[i - 3].condition_3 = @"不需要";
                self.loadedKLineData[i - 3].condition_4 = @"不需要";
                self.loadedKLineData[i - 3].condition_5 = r5.prompt;
                self.loadedKLineData[i - 3].condition_6 = r6.prompt;
                self.loadedKLineData[i - 3].condition_7 = sp7.prompt;
                self.loadedKLineData[i - 3].condition_8 = @"不需要";
            }

        }
        
        // =============================
        // 特殊 3
        // =============================
        if (!self.loadedKLineData[i - 3].mountainPeakTag) {
            ResultModel *sp3 =
            [self special_rise_2_rise_2_fall_fall_1:model_1_fall withModel_1:model_1
                                         withFall_2:model_2_fall withModel_2:model_2
                                         withFall_3:model_3_fall withModel_3:model_3
                                         withFall_4:model_4_fall withModel_4:model_4];
            
            ResultModel *sp7 = [self special_judge_kLine_7_fall_7:model_7_fall
                                                    withModel_7:model_7
                                                     withFall_5:model_5_fall
                                                    withModel_5:model_5];
            
            if (sp3.result && r5.result && r6.result && r7.result) {
                self.loadedKLineData[i - 3].mountainPeakTag = @"低谷";
                
                self.loadedKLineData[i - 3].condition_1 = sp3.prompt;
                self.loadedKLineData[i - 3].condition_2 = @"不需要";
                self.loadedKLineData[i - 3].condition_3 = @"不需要";
                self.loadedKLineData[i - 3].condition_4 = @"不需要";
                self.loadedKLineData[i - 3].condition_5 = r5.prompt;
                self.loadedKLineData[i - 3].condition_6 = r6.prompt;
                self.loadedKLineData[i - 3].condition_7 = sp7.prompt;
                self.loadedKLineData[i - 3].condition_8 = @"不需要";
            }

        }
        
        // =============================
        // 特殊 4
        // =============================
        if (!self.loadedKLineData[i - 3].mountainPeakTag) {
            ResultModel *sp4 =[self special_rise_3_rise_1_fall_fall_1:model_1_fall withModel_1:model_1
                                         withFall_2:model_2_fall withModel_2:model_2
                                         withFall_3:model_3_fall withModel_3:model_3
                                         withFall_4:model_4_fall withModel_4:model_4];
            
            ResultModel *sp7 = [self special_judge_kLine_7_fall_7:model_7_fall
                                                    withModel_7:model_7
                                                     withFall_5:model_5_fall
                                                    withModel_5:model_5];
            
            if (sp4.result && r5.result && r6.result && r7.result) {
                self.loadedKLineData[i - 3].mountainPeakTag = @"低谷";
                
                self.loadedKLineData[i - 3].condition_1 = sp4.prompt;
                self.loadedKLineData[i - 3].condition_2 = @"不需要";
                self.loadedKLineData[i - 3].condition_3 = @"不需要";
                self.loadedKLineData[i - 3].condition_4 = @"不需要";
                self.loadedKLineData[i - 3].condition_5 = r5.prompt;
                self.loadedKLineData[i - 3].condition_6 = r7.prompt;
                self.loadedKLineData[i - 3].condition_7 = sp7.prompt;
                self.loadedKLineData[i - 3].condition_8 = @"不需要";
            }

        }
        
    }
}

-(ResultModel *)judge_KLine_1_rise_1:(BOOL)rise1
                         withModel_1:(KLineModel *)model_1
                          withRise_2:(BOOL)rise2
                         withModel_2:(KLineModel *)model_2
                          withRise_3:(BOOL)rise3
                         withModel_3:(KLineModel *)model_3
                          withRise_4:(BOOL)rise4
                         withModel_4:(KLineModel *)model_4 {
    ResultModel *model = [ResultModel new];
    if (rise1 == NO) {
        model.result = YES;
        model.prompt = @"1_A(满足) 第一条跌";
    } else {//第一条升
        //看第二条
        if (rise2 == NO) {//第二条跌
            float percentage_2_1 = (model_2.open - model_1.close) / model_2.open;
            if (percentage_2_1 > 0.001) {//
                model.result = YES;
                model.prompt = [NSString stringWithFormat:@"1_B(满足) 第一条升 第二条跌 \n第一条跟第二条大于0.1%%差距 实际 %0.2f%%",percentage_2_1*100];
            } else {// 跌幅无0.15% 差距
                //看第三条
                if (rise3 == NO) { // 第三条跌
                    float percentage_3_1 = (model_3.open - model_1.close) / model_3.open;
                    if (percentage_3_1 > 0.001) {// 跌幅有0.1% 差距
                        model.result = YES;
                        model.prompt = [NSString stringWithFormat:@"1_C(满足) 第一条升, 第二条跌, 第三条跌 \n第一第二条不足0.1%%  实际 %0.2f%%, \n第三条开盘价跟第一条收盘价跌幅有0.1%%差距 实际 %0.2f%%",percentage_2_1*100,percentage_3_1*100];
                    } else {// 跌幅无0.1% 差距
                        //看第四条
                        if (rise4 == NO) {//第四条 跌
                            float percentage_4_1 = (model_4.open - model_1.close) / model_4.open;
                            if (percentage_4_1 > present_0_23) {
                                model.result = YES;
                                model.prompt = [NSString stringWithFormat:@"1_D(满足) 第一条升,第二条跌,第三条跌,第四条跌, \n第一二条之间小于0.15%% 实际 %0.2f%%\n第一三条之间小于0.15%%, 实际 %0.2f%% \n第一四条之间大于0.23%%差距 实际 %0.2f%%",percentage_2_1*100,percentage_3_1*100,percentage_4_1*100];
                            } else { //
                                model.result = NO;
                                model.prompt = [NSString stringWithFormat:@"1_E(不满足) 第一条升,第二条跌,第三条跌,第四条跌, \n第一二条之间小于0.15%% 实际 %0.2f%%\n第一三条之间小于0.15%%, 实际 %0.2f%% \n第一四条之间小于0.23%%差距 实际 %0.2f%%",percentage_2_1*100,percentage_3_1*100,percentage_4_1*100];
                            }
                        } else { //第四条 升
                            model.result = NO;
                            model.prompt = @"1_F(不满足)第一条升,第二条跌,第三条跌,第四条升 \n形态破坏";
                        }
                    }
                } else {// 第三条升
                    //看第四条
                    if (rise4 == NO) {
                        float percentage_4_1 = (model_4.open - model_1.close) / model_4.open;
                        if (percentage_4_1 > present_0_23) {//
                            model.result = YES;
                            model.prompt = [NSString stringWithFormat:@"1_G(满足) 第一条升,第二条跌,第三条升,\n第四条跌,第一第二条小于0.1%% 实际 %0.2f%%,\n第四条跟第一条大于0.23%%差距 实际 %0.2f%%",percentage_2_1*100,percentage_4_1*100];
                        } else { //
                            model.result = NO;
                            model.prompt = [NSString stringWithFormat:@"1_H(不满足) 第一条升,第二条跌,第三条升,\n第四条跌,第一第二条小于0.1%% 实际 %0.2f%%,\n第四条跟第一条小于0.23%%差距 实际 %0.2f%%",percentage_2_1*100,percentage_4_1*100];
                        }
                    } else {
                        model.result = NO;
                        model.prompt = @"1_I(不满足) 第一条升,第二条跌,第三条升,\n第四条升,第一第二条小于0.1%,形态破坏";
                    }
                }
            }
        } else {//第二条升
            //看第三条
            if (rise3 == NO) {// 第三条 跌
                float percentage_3_1 = (model_3.open - model_1.close) / model_3.open;//接受肯能是负数(2025-01-21 07)
                if (percentage_3_1 > present_0_23) {// > 0.23%
                    model.result = YES;
                    model.prompt = [NSString stringWithFormat:@"1_J(满足) 第一条升,第二条升,第三条跌,\n第三条跟第一条的差距大于0.23%%差距 实际 %0.2f%%",percentage_3_1*100];
                } else { // < 0.23%
                    //看第四条
                    if (rise4 == NO) {//第四条跌
                        float percentage_4_1 = (model_4.open - model_1.close) / model_4.open;
                        if (percentage_4_1 > present_0_23) {// > 0.23%
                            model.result = YES;
                            model.prompt = [NSString stringWithFormat:@"1_K(满足) 第一条升,第二条升,第三条跌,第四条跌,\n第三条跟第一条小于0.23%%  实际 %0.2f%%,\n第四条跟第一条大于0.23%%差距 实际 %0.2f%%",percentage_3_1*100,percentage_4_1*100];
                        } else {
                            model.result = NO;
                            model.prompt = [NSString stringWithFormat:@"1_L(不满足) 第一条升,第二条升,第三条跌,第四条跌,\n第三条跟第一条小于0.23%%  实际 %0.2f%%,\n第四条跟第一条小于0.23%%差距 实际 %0.2f%%",percentage_3_1*100,percentage_4_1*100];
                        }
                    } else {//第四条升
                        model.result = NO;
                        model.prompt = @"1_M(不满足)第一条升,第二条升,第三条跌,第四条升,\n第三条跟第一条小于0.23%,由于第四条升,形态破坏";
                    }
                }
            } else {// 第三条升
                //看第四条
                if (rise4 == NO) {//第四条跌
                    float percentage_4_1 = (model_4.open - model_1.close) / model_4.open;
                    if (percentage_4_1 > present_0_23) {
                        model.result = YES;
                        model.prompt = [NSString stringWithFormat:@"1_N(满足)第一条升,第二条升,第三条升,第四条跌 \n第四条跌幅大于0.23%%差距 实际%0.2f%%",percentage_4_1*100];
                    } else {
                        model.result = NO;
                        model.prompt = [NSString stringWithFormat:@"1_O(不满足)第一条升,第二条升,第三条升,第四条跌 \n第四条跌幅小于0.23%%差距 实际%0.2f%%",percentage_4_1*100];
                    }
                } else {//第四条 升
                    model.result = NO;
                    model.prompt = @"1_P(不满足)第一条升,第二升,第三条升,第四条升, 形态被破坏了";
                }
            }
        }
    }
    return model;
}

-(ResultModel *)judge_KLine_2_rise_1:(BOOL)rise1
                         withModel_1:(KLineModel *)model_1
                          withRise_2:(BOOL)rise2
                         withModel_2:(KLineModel *)model_2
                          withRise_3:(BOOL)rise3
                         withModel_3:(KLineModel *)model_3
                          withRise_4:(BOOL)rise4
                         withModel_4:(KLineModel *)model_4 {
    ResultModel *model = [ResultModel new];
    if (rise2 == NO) {//第二条跌
        model.result = YES;
        model.prompt = @"2_A(满足) 第二条跌";
    } else {//第二条升
        //看第一条
        if (rise1 == NO) {//第一条跌
            float percentage_2_1 = (model_2.open / model_1.close) / model_2.open;
            if (percentage_2_1 > present_0_23) {//跌幅小于0.23%
                model.result = YES;
                model.prompt = [NSString stringWithFormat:@"2_B(满足)第二条升,第一条跌,\n第二条跟第一条的跌幅大于0.23%%差距 实际%0.2f%%",percentage_2_1*100];
            } else {
                //看第三条
                if (rise3 == NO) {//第三条跌
                    float percentage_3_1 = (model_3.open - model_1.open) / model_3.open;
                    if (percentage_3_1 > present_0_23) {
                        model.result = YES;
                        model.prompt = [NSString stringWithFormat:@"2_C(满足)第三条跌,第二条升,第一条跌,\n第三条跌幅是第一条大于0.23%%差距 实际%0.2f%%",percentage_3_1*100];
                    } else {
                        //看第四条
                        if (rise4 == NO) {//第四条跌
                            float percentage_4_1 = (model_4.open - model_1.open) / model_4.open;
                            if (percentage_4_1 > present_0_23) {
                                model.result = YES;
                                model.prompt = [NSString stringWithFormat:@"2_D(满足)第四条跌,第三条跌,第二条升,第一条跌,\n第四条跌幅是第一条的开盘价大于0.23%%差距 实际%0.2f%%",percentage_4_1*100];
                            } else {
                                model.result = NO;
                                model.prompt = [NSString stringWithFormat:@"2_E(不满足)第四条跌,第三条跌,第二条升,第一条跌,\n第四条跌幅是第一条的开盘价小于0.23%%差距 实际%0.2f%%",percentage_4_1*100];
                            }
                        } else {//第四条升
                            model.result = NO;
                            model.prompt = @"2_F(不满足)第一条跌,第二条升,第三条跌,第四条升,形态破坏";
                        }
                    }
                } else {//第三条升
                    //看第四条
                    if (rise4 == NO) {//第四条跌
                        float percentage_4_1 = (model_4.open - model_1.open) / model_4.open;
                        if (percentage_4_1 > present_0_23) {
                            model.result = YES;
                            model.prompt = [NSString stringWithFormat:@"2_G(满足)第四条跌,第三条升,第二条升,第一条跌,\n第四条跌幅是第一条大于0.23%%差距 实际%0.2f%%",percentage_4_1*100];
                        } else {
                            model.result = NO;
                            model.prompt = [NSString stringWithFormat:@"2_H(不满足)第四条跌,第三条升,第二条升,第一条跌,\n第四条跌幅是第一条小于0.23%%差距 实际%0.2f%%",percentage_4_1*100];
                        }
                    } else {//第四条升
                        model.result = NO;
                        model.prompt = @"2_I(不满足)第一条跌,第二条升,第三条升,第四条升,形态破坏";
                    }
                }
            }
        } else {//第一条升
            //看第三条
            if (rise3 == NO) {// 第三条跌
                float percentage_3_1 = (model_3.open - model_1.close) / model_3.open;
                if (percentage_3_1 > present_0_23) {
                    model.result = YES;
                    model.prompt = [NSString stringWithFormat:@"2_J(满足)第一条升,升二条升,第三条跌,\n第三条跟第一条之间大于0.23%%差距 实际%0.2f%%",percentage_3_1*100];
                } else {
                    //看第四条
                    if (rise4 == NO) {//第四条跌
                        float percentage_4_1 = (model_4.open - model_1.close) / model_4.open;
                        if (percentage_4_1 > present_0_23) {
                            model.result = YES;
                            model.prompt = [NSString stringWithFormat:@"2_K(满足)第一条升,升二条升,第三条跌,第四条跌,\n第四条跟第一条之间大于0.23%%差距 实际%0.2f%%",percentage_4_1*100];
                        } else {
                            model.result = NO;
                            model.prompt = [NSString stringWithFormat:@"2_L(不满足)第一条升,升二条升,第三条跌,第四条跌,\n第四条跟第一条之间小于0.23%%差距 实际%0.2f%%",percentage_4_1*100];
                        }
                    } else {//第四条升
                        model.result = NO;
                        model.prompt = @"2_M(不满足)第一条升,升二条升,第三条跌,\n第四条升,形态破坏";
                    }
                }
            } else {// 第三条升
                //看第四条
                if (rise4 == NO) {//第四条跌
                    float percentage_4_1 = (model_4.open - model_1.close) / model_4.open;
                    if (percentage_4_1 > present_0_23) {
                        model.result = YES;
                        model.prompt = [NSString stringWithFormat:@"2_N(满足)第一条升,升二条升,第三条升,第四条跌,\n第四条跟第一条之间大于0.23%%差距 实际%0.2f%%",percentage_4_1*100];
                    } else {
                        model.result = NO;
                        model.prompt = [NSString stringWithFormat:@"2_O(不满足)第一条升,升二条升,第三条升,第四条跌,\n第四条跟第一条之间小于0.23%%差距 实际%0.2f%%",percentage_4_1*100];
                    }
                } else {//第四条升
                    model.result = NO;
                    model.prompt = @"2_P(不满足)第一条升,升二条升,第三条升,第四条升,\n形态破坏";
                }
            }
        }
    }
    return model;
}


-(ResultModel *)judge_KLine_3_rise_1:(BOOL)rise1
                        withModel_1:(KLineModel *)model_1
                         withRise_2:(BOOL)rise2
                        withModel_2:(KLineModel *)model_2
                         withRise_3:(BOOL)rise3
                        withModel_3:(KLineModel *)model_3
                         withRise_4:(BOOL)rise4
                        withModel_4:(KLineModel *)model_4 {
    ResultModel *model = [ResultModel new];
    if (rise3 == NO) {// 第三条 跌
        model.result = YES;
        model.prompt = @"3_A(满足) 第三条跌";
    } else {// 第三条 升
        //看第四条
        if (rise4 == NO) {// 第四条跌
            float percentage_4_3 = (model_4.open - model_3.close) / model_4.open;
            if (percentage_4_3 > 0.001) {
                model.result = YES;
                model.prompt = [NSString stringWithFormat:@"3_B(满足) 第三条升,第四条跌\n 第四条跌幅跟第三条大于0.1%%差距 实际%0.2f%%",percentage_4_3*100];
            } else {
                //看第二条
                if (rise2 == NO) {//第二条跌
                    //看第一条
                    if (rise1 == NO) {//第一条跌
                        float percentage_4_1 = (model_4.open - model_1.close) / model_4.open;
                        if (percentage_4_1 > present_0_23) {
                            model.result = YES;
                            model.prompt = [NSString stringWithFormat:@"3_C(满足) 第四条跌,第三条升,第二条跌,第一条跌\n 第四条跌幅跟第二条大于0.23%%差距 实际%0.2f%%",percentage_4_1*100];
                        } else {
                            model.result = NO;
                            model.prompt = [NSString stringWithFormat:@"3_D(不满足) ,第四条跌,第三条升,第二条跌,第一条跌\n 第四条跌幅跟第一条小于0.23%%差距 实际%0.2f%%",percentage_4_1*100];
                        }
                    } else {//第一条升
                        float percentage_4_1 = (model_4.open - model_1.close) / model_4.open;
                        if (percentage_4_1 > present_0_23) {
                            model.result = YES;
                            model.prompt = [NSString stringWithFormat:@"3_E(满足),第四条跌,第三条升,第二条跌,第一条升\n 第四条跌幅跟第二条大于0.23%%差距 实际%0.2f%%",percentage_4_1*100];
                        } else {
                            model.result = NO;
                            model.prompt = [NSString stringWithFormat:@"3_F(不满足),第四条跌,第三条升,第二条跌,第一条升\n 第四条跌幅跟第一条小于0.23%%差距 实际%0.2f%%",percentage_4_1*100];
                        }
                    }
                } else {//第二条升
                    //看第一条
                    if (rise1 == NO) {
                        float percentage_4_1 = (model_4.open - model_1.close) / model_4.open;
                        if (percentage_4_1 > present_0_23) {
                            model.result = YES;
                            model.prompt = [NSString stringWithFormat:@"3_G(满足) 第一条升,第二条升,第三条升,第四条跌,\n第四条跌幅跟第一条大于0.23%%差距 实际%0.2f%%",percentage_4_1*100];
                        } else {
                            model.result = NO;
                            model.prompt = [NSString stringWithFormat:@"3_H(不满足) 第一条升,第二条升,第三条升,第四条跌,\n第四条跌幅跟第一条小于0.23%%差距 实际%0.2f%%",percentage_4_1*100];
                        }
                    } else {
                        model.result = NO;
                        model.prompt = @"3_I(不满足) 第一条升,第二条升,第三条升,第四条升,形态破坏";
                    }
                }
            }
        } else {// 第四条升
            model.result = NO;
            model.prompt = @"3_J(不满足) 第三条升, 第四条升, 形态破坏";
        }
    }
    return model;
}

-(ResultModel *)judge_KLine_4_rise_1:(BOOL)rise1
                        withModel_1:(KLineModel *)model_1
                         withRise_2:(BOOL)rise2
                        withModel_2:(KLineModel *)model_2
                         withRise_3:(BOOL)rise3
                        withModel_3:(KLineModel *)model_3
                         withRise_4:(BOOL)rise4
                        withModel_4:(KLineModel *)model_4 {
    ResultModel *model = [ResultModel new];
    if (rise4 == NO) {//第四条跌
        // 看第三条
        if (rise3 == NO) {//第三条跌
            //看第二条
            if (rise2 == NO) {//第二条跌
                //看第一条
                if (rise1 == NO) {//第一条跌
                    float percentage_4_1 = (model_4.open - model_1.close) / model_4.open;
                    if (percentage_4_1 > present_0_23) {
                        model.result = YES;
                        model.prompt = [NSString stringWithFormat:@"4_A(满足) 第四条跌, 第三条跌, 第二条跌, 第一条跌, \n第四条跟第一条的差距大于0.23%%差距 实际%0.2f%%",percentage_4_1*100];
                    } else {
                        model.result = NO;
                        model.prompt = [NSString stringWithFormat:@"4_B(不满足) 第四条跌, 第三条跌, 第二条跌, 第一条跌, \n第四条跟第一条的差距小于0.23%%差距 实际%0.2f%%",percentage_4_1*100];
                    }
                } else {
                    float percentage_4_1 = (model_4.open - model_1.close) / model_4.open;
                    if (percentage_4_1 > present_0_23) {
                        model.result = YES;
                        model.prompt = [NSString stringWithFormat:@"4_C(满足) 第四条跌, 第三条跌, 第二条跌, 第一条升,\n 第四条跟第一条的差距大于0.23%%差距 实际%0.2f%%",percentage_4_1*100];
                    } else {
                        model.result = NO;
                        model.prompt = [NSString stringWithFormat:@"4_D(不满足) 第四条跌, 第三条跌, 第二条跌, 第一条升, \n第四条跟第一条的差距小于0.23%%差距 实际%0.2f%%",percentage_4_1*100];
                    }
                }
            } else {//第二条升
                float percentage_4_2 = (model_4.open - model_2.close) / model_4.open;
                if (percentage_4_2 > 0.001) {
                    //看第一条
                    if (rise1 == NO) {//第一条跌
                        float percentage_4_1 = (model_4.open - model_1.open) / model_4.open;
                        if (percentage_4_1 > present_0_23) {
                            model.result = YES;
                            model.prompt = [NSString stringWithFormat:@"4_E(满足) 第四条跌, 第三条跌, 第二条升,第一条跌 \n第四条跟第一条的开盘价差距大于0.23%%差距 实际%0.2f%%",percentage_4_1*100];
                        } else {
                            model.result = NO;
                            model.prompt = [NSString stringWithFormat:@"4_F(不满足) 第四条跌, 第三条跌, 第二条升,第一条跌 \n第四条跟第一条的开盘价差距小于0.23%%差距 实际%0.2f%%",percentage_4_1*100];
                        }
                    } else {//第一条升
                        float percentage_4_1 = (model_4.open - model_1.close) / model_4.open;
                        if (percentage_4_1 > present_0_23) {
                            model.result = YES;
                            model.prompt = [NSString stringWithFormat:@"4_G(满足) 第四条跌, 第三条跌, 第二条升,第一条升 \n第四条跟第一条的收盘价差距大于0.23%%差距 实际%0.2f%%",percentage_4_1*100];
                        } else {
                            model.result = NO;
                            model.prompt = [NSString stringWithFormat:@"4_H(不满足) 第四条跌, 第三条跌, 第二条升,第一条升 \n第四条跟第一条的收盘价差距小于0.23%%差距 实际%0.2f%%",percentage_4_1*100];
                        }
                    }
                } else {
                    model.result = NO;
                    model.prompt = @"4_I(不满足) 第四条跌, 第三条跌, 第二条升, \n第四条跟第二条的差距小于0.1%,形态破坏";
                }
            }
        } else {//第三条升
            float percentage_4_3 = (model_4.open - model_3.close) / model_4.open;
            if (percentage_4_3 > 0.001) {
                //看第二条
                if (rise2 == NO) {//第二条跌
                    //看第一条
                    if (rise1 == NO) {//第一条跌
                        float percentage_4_1 = (model_4.open - model_1.close) / model_4.open;
                        if (percentage_4_1 > present_0_23) {
                            model.result = YES;
                            model.prompt = [NSString stringWithFormat:@"4_J(满足) 第四条跌, 第三条升, 第二条跌, 第一条跌, \n第四条跟第一条的差距大于0.23%%差距 实际%0.2f%%",percentage_4_1*100];
                        } else {
                            model.result = NO;
                            model.prompt = [NSString stringWithFormat:@"4_K(不满足) 第四条跌, 第三条升, 第二条跌, 第一条跌, \n第四条跟第一条的差距小于0.23%%差距 实际%0.2f%%",percentage_4_1*100];
                        }
                    } else {//第一条升
                        float percentage_4_1 = (model_4.open - model_1.close) / model_4.open;
                        if (percentage_4_1 > present_0_23) {
                            model.result = YES;
                            model.prompt = [NSString stringWithFormat:@"4_L(满足) 第四条跌, 第三条升, 第二条跌, 第一条升, \n第四条跟第一条的差距大于0.23%%差距 实际%0.2f%%",percentage_4_1*100];
                        } else {
                            model.result = NO;
                            model.prompt = [NSString stringWithFormat:@"4_M(不满足) 第四条跌, 第三条升, 第二条跌, 第一条升, \n第四条跟第一条的差距小于0.23%%差距 实际%0.2f%%",percentage_4_1*100];
                        }
                    }
                } else {//第二条升
                    float percentage_4_11 = (model_4.open - model_1.open) / model_4.open;
                    if (percentage_4_11 > 0.001) {
                        //看第一条
                        if (rise1 == NO) {//第一条跌
                            float percentage_4_1 = (model_4.open - model_1.open) / model_4.open;
                            if (percentage_4_1 > present_0_23) {
                                model.result = YES;
                                model.prompt = [NSString stringWithFormat:@"4_N(满足) 第四条跌, 第三条升, 第二条升, 第一条跌,\n第四条跟第一条的差距大于0.23%%差距 实际%0.2f%%",percentage_4_1*100];
                            } else {
                                model.result = NO;
                                model.prompt = [NSString stringWithFormat:@"4_O(不满足) 第四条跌, 第三条升, 第二条升, 第一条跌,\n第四条跟第一条的差距小于0.23%%差距 实际%0.2f%%",percentage_4_1*100];
                            }
                        } else {//第一条升
                            float percentage_4_1 = (model_4.open - model_1.close) / model_4.open;
                            if (percentage_4_1 > present_0_23) {
                                model.result = YES;
                                model.prompt = [NSString stringWithFormat:@"4_P(满足) 第四条跌, 第三条升, 第二条升, 第一条升, \n第一条跟第四条的差距大于0.23%%差距 实际%0.2f%%",percentage_4_1*100];
                            } else {
                                model.result = NO;
                                model.prompt = [NSString stringWithFormat:@"4_Q(不满足) 第四条跌, 第三条升, 第二条升, 第一条升, \n第一条跟第四条的差距小于0.23%%差距 实际%0.2f%%",percentage_4_1*100];
                            }
                        }
                    } else {
                        model.result = NO;
                        model.prompt = [NSString stringWithFormat:@"4_R(不满足) 第四条跌, 第三条升, 第二条升, \n第二条跟第四条的差距小于0.1%%差距 实际%0.2f%%",percentage_4_11*100];
                    }
                }
            } else {
                model.result = NO;
                model.prompt = [NSString stringWithFormat:@"4_S(不满足) 第四条跌, 第三条升\n第三条跟第四条的差距小于0.1%%差距 实际%0.2f%%",percentage_4_3*100];
            }
        }
    } else {//第四条升
        model.result = NO;
        model.prompt = @"4_T(不满足) 第四条升, 形态破坏";
    }
    return model;
}

-(ResultModel *)judge_kLine_8_rise_8:(BOOL)rise_8 withModel_8:(KLineModel *)model_8 withRise_5:(BOOL)rise_5 withModel_5:(KLineModel *)model_5{
    ResultModel *model = [ResultModel new];
    if (rise_5 == YES) { // 第五条升
        //看第八条
        if (rise_8 == YES) { // 第八条升
            model.result = YES;
            model.prompt = @"8_A(满足) 第五条升, 第八条升";
        } else { // 第八条跌
            if (model_8.open > model_5.close) {
                float percentage_8_5 = (model_8.open - model_5.close) / model_8.open;
                if (percentage_8_5 < 0.0015) {
                    model.result = YES;
                    model.prompt = [NSString stringWithFormat:@"8_B(满足) 第五条升, 第八条跌, \n第八条开盘价跟第五条收盘价小于0.15%%的差距 实际%0.2f%%",percentage_8_5*100];
                } else {
                    model.result = NO;
                    model.prompt = [NSString stringWithFormat:@"8_C(不满足) 第五条升, 第八条跌, 第八条开盘价跟第五条收盘价\n大于0.15%%的差距 实际%0.2f%%",percentage_8_5*100];
                }
            } else {
                model.result = YES;
                model.prompt = @"8_D(满足) 第五条升, 第八条跌, \n第八条开盘价没有超过第五条收盘价";
            }
        }
    } else { // 第五条跌
        model.result = NO;
        model.prompt = @"8_E(不满足) 第五条跌 形态破坏";
    }
    return model;
}

-(ResultModel *)judge_kLine_7_rise_7:(BOOL)rise_7 withModel_7:(KLineModel *)model_7 withRise_5:(BOOL)rise_5 withModel_5:(KLineModel *)model_5 {
    ResultModel *model = [ResultModel new];
    if (rise_5 == YES) { // 第五条升
        //看第七条
        if (rise_7 == YES) { // 第七条升
            model.result = YES;
            model.prompt = @"7_A(满足) 第五条升, 第七条升";
        } else { // 第七条跌
            if (model_7.open > model_5.close) {
                float percentage_7_5 = (model_7.open - model_5.close) / model_7.open;
                if (percentage_7_5 < 0.0015) {
                    model.result = YES;
                    model.prompt = [NSString stringWithFormat:@"7_B(满足) 第五条升, 第七条跌, \n第七条开盘价跟第五条收盘价小于0.15%%的差距 实际%0.2f%%",percentage_7_5*100];
                } else {
                    model.result = NO;
                    model.prompt = [NSString stringWithFormat:@"7_C(不满足) 第五条升, 第七条跌, \n第七条开盘价跟第五条收盘价大于0.15%%的差距 实际%0.2f%%",percentage_7_5*100];
                }
            } else {
                model.result = YES;
                model.prompt = @"7_D(满足) 第五条升,第七条跌,第七条开盘价没有超过第五条收盘价";
            }
        }
    } else { // 第五条跌
        model.result = NO;
        model.prompt = @"7_E(不满足) 第五条跌 形态破坏";
    }
    return model;
}

-(ResultModel *)judge_kLine_6_rise_6:(BOOL)rise_6 withModel_6:(KLineModel *)model_6 withRise_5:(BOOL)rise_5 withModel_5:(KLineModel *)model_5 {
    ResultModel *model = [ResultModel new];
    if (rise_5 == YES) { // 第五条升
        //看第六条
        if (rise_6 == YES) { // 第六条升
            model.result = YES;
            model.prompt = @"6_A(满足) 第五条升, 第六条升";
        } else { // 第六条跌
            if (model_6.open > model_5.close) {
                float percentage_6_5 = (model_6.open - model_5.close) / model_6.open;
                if (percentage_6_5 < 0.0015) {
                    model.result = YES;
                    model.prompt = [NSString stringWithFormat:@"6_B(满足) 第五条升, 第六条跌, 第六条开盘价跟第五条收盘价\n小于0.15%%的差距 实际%0.2f%%",percentage_6_5*100];
                } else {
                    model.result = NO;
                    model.prompt = [NSString stringWithFormat:@"6_C(不满足) 第五条升, 第六条跌, 第六条开盘价跟第五条收盘价\n大于0.15%%的差距 实际%0.2f%%",percentage_6_5*100];
                }
            } else {
                model.result = YES;
                model.prompt = @"6_D(满足) 第五条升, 第六条跌, \n第六条开盘价没有超过第五条收盘价";
            }
        }
    } else { // 第五条跌
        model.result = NO;
        model.prompt = @"6_E(不满足) 第五条跌 形态破坏";
    }
    return model;
}

-(ResultModel *)judge_kLine_5_rise_5:(BOOL)rise5 {
    ResultModel *model = [ResultModel new];
    if (rise5 == YES) {
        model.result = YES;
        model.prompt = @"5_A(满足) 第五条升";
    } else {
        model.result = NO;
        model.prompt = @"5_B(不满足) 第五条跌,形态破坏";
    }
    return model;
}

//特殊1
-(ResultModel *)special_judge_kLine_7_rise_7:(BOOL)rise_7 withModel_7:(KLineModel *)model_7 withRise_5:(BOOL)rise_5 withModel_5:(KLineModel *)model_5 {
    ResultModel *model = [ResultModel new];
    if (rise_5 == YES) { // 第五条升
        //看第七条
        if (rise_7 == YES) { // 第七条升
            model.result = YES;
            model.prompt = @"特殊1_7_A(满足) 第五条升, 第七条升";
        } else { // 第七条跌
            if (model_7.open > model_5.close) {
                float percentage_7_5 = (model_7.open - model_5.close) / model_7.open;
                if (percentage_7_5 < 0.003) {
                    model.result = YES;
                    model.prompt = [NSString stringWithFormat:@"特殊1_7_B(满足) 第五条升, 第七条跌, 第七条开盘价跟第五条收盘价\n小于0.3%%的差距 实际%0.2f%%",percentage_7_5*100];
                } else {
                    model.result = NO;
                    model.prompt = [NSString stringWithFormat:@"特殊1_7_C(不满足) 第五条升, 第七条跌, 第七条开盘价跟第五条收盘价\n大于0.3%%的差距 实际%0.2f%%",percentage_7_5*100];
                }
            } else {
                model.result = YES;
                model.prompt = @"特殊1_7_D(满足) 第五条升, 第七条跌, \n第七条开盘价没有超过第五条收盘价";
            }
        }
    } else { // 第五条跌
        model.result = NO;
        model.prompt = @"特殊1_7_E(不满足) 第五条跌 形态破坏";
    }
    return model;
}

//特殊2: 一条跌,3条升
-(ResultModel *)special_falling_1_falling_3_rise_rise_1:(BOOL)rise1
                                           withModel_1:(KLineModel *)model_1
                                            withRise_2:(BOOL)rise2
                                           withModel_2:(KLineModel *)model_2
                                            withRise_3:(BOOL)rise3
                                           withModel_3:(KLineModel *)model_3
                                            withRise_4:(BOOL)rise4
                                           withModel_4:(KLineModel *)model_4 {
    ResultModel *model = [ResultModel new];
    if (rise4 == NO) {//第四条跌
        if ((model_4.open - model_4.close) / model_4.open > 0.005) {
            //看第三条
            if (rise3 == YES) {//第三条升
                float percentage_4 = (model_4.open - model_4.close) / model_4.open;
                float percentage_3 = (model_3.close - model_3.open) / model_3.open;
                if (percentage_4 / percentage_3 > 2) {
                    //看第二条
                    if (rise2== YES) {//第二条升
                        //看第一条
                        if (rise1== YES) {//第一条升
                            model.result = YES;
                            model.prompt = @"特殊2_A(满足)第四条跌,第三条升,第二条升,第一条升 \n第四条跌幅跟第三条升幅达到2倍以上";
                        } else {
                            model.result = NO;
                            model.prompt = @"特殊2_B(不满足) 第一条跌 形态破坏";
                        }
                    } else {
                        model.result = NO;
                        model.prompt = @"特殊2_C(不满足) 第二条跌 形态破坏";
                    }
                } else {
                    model.result = NO;
                    model.prompt = @"特殊2_D(不满足) 第四条跌幅跟第三条升幅没有达到2倍以上";
                }
            } else {//第三条跌
                model.result = NO;
                model.prompt = @"特殊2_E(不满足) 第三条升 形态破坏";
            }
        } else {
            model.result = NO;
            model.prompt = @"特殊2_F(不满足) 第四条下跌幅度没有超过0.5%";
        }
    } else {//第四条升
        model.result = NO;
        model.prompt = @"特殊2_G(不满足) 第四条升 形态破坏";
    }
    return model;
}

//特殊3: 两条跌,两条升
-(ResultModel *)special_falling_2_falling_2_rise_rise_1:(BOOL)rise1
                                           withModel_1:(KLineModel *)model_1
                                            withRise_2:(BOOL)rise2
                                           withModel_2:(KLineModel *)model_2
                                            withRise_3:(BOOL)rise3
                                           withModel_3:(KLineModel *)model_3
                                            withRise_4:(BOOL)rise4
                                           withModel_4:(KLineModel *)model_4 {
    ResultModel *model = [ResultModel new];
    
    if (rise4 == NO) {//第四条跌
        //看第三条
        if (rise3 == NO) {//第三条跌
            if ((model_4.open - model_3.close) / model_4.open > 0.0045) {
                //看第二条
                if (rise2 == YES) {//第二条升
                    //看第一条
                    if (rise1 == YES) {//第一条升
                        model.result = YES;
                        model.prompt = @"特殊3_A(满足) 第四条跌,第三条跌,第二条升,第一条升, \n第四条和第三条加起来下跌幅度小于0.45%";
                    } else {
                        model.result = NO;
                        model.prompt = @"特殊3_B(不满足) 第一条跌 形态破坏";
                    }
                } else {
                    model.result = NO;
                    model.prompt = @"特殊3_C(不满足) 第二条跌 形态破坏";
                }
            } else {
                model.result = NO;
                model.prompt = @"特殊3_D(不满足) 第四条跌,第三条跌,第四条和第三条加起来下跌幅度小于0.45%";
            }
        } else {
            model.result = NO;
            model.prompt = @"特殊3_E(不满足) 第三条升 形态破坏";
        }
    } else {//第四条升
        model.result = NO;
        model.prompt = @"特殊3_F(不满足) 第四条升 形态破坏";
    }

    return model;
}

//特殊4: 三条跌,一条升
-(ResultModel *)special_falling_3_falling_1_rise_rise_1:(BOOL)rise1
                                           withModel_1:(KLineModel *)model_1
                                            withRise_2:(BOOL)rise2
                                           withModel_2:(KLineModel *)model_2
                                            withRise_3:(BOOL)rise3
                                           withModel_3:(KLineModel *)model_3
                                            withRise_4:(BOOL)rise4
                                           withModel_4:(KLineModel *)model_4 {
    ResultModel *model = [ResultModel new];
    if (rise4 == NO) {//第四条跌
        //看第三条
        if (rise3 == NO) {
            //看第二条
            if (rise2 == NO) {
                if ((model_4.open - model_2.close) / model_4.open > 0.0046) {//0.46%
                    //看第一条
                    if (rise1 == YES) {
                        model.result = YES;
                        model.prompt = @"特殊4_A第四条跌,第三条跌,第二条跌,第一条升,\n第四条到第二条跌幅大于0.46%";
                    } else {
                        model.result = NO;
                        model.prompt = @"特殊4_B(不满足) 第一条跌 形态破坏";
                    }
                } else {
                    model.result = NO;
                    model.prompt = @"特殊4_C(不满足)第四条跌,第三条跌,第二条跌 第四条到第二条跌幅小于0.46%";
                }
            } else {
                model.result = NO;
                model.prompt = @"特殊4_D(不满足) 第二条升 形态破坏";
            }
        } else {
            model.result = NO;
            model.prompt = @"特殊4_F(不满足) 第三条升 形态破坏";
        }
    } else {//第四条升
        model.result = NO;
        model.prompt = @"特殊4_H(不满足) 第四条升 形态破坏";
    }
    return model;
}

#pragma mark - 寻找低谷
-(void)findCanyon {
    
    if (self.loadedKLineData.count < 8) return;
    
    for (NSInteger i = 7; i < self.loadedKLineData.count; i++) {
        
        [self clearConditionPropertiesForIndex:i];
        
        KLineModel *model_1 = self.loadedKLineData[i];
        KLineModel *model_2 = self.loadedKLineData[i - 1];
        KLineModel *model_3 = self.loadedKLineData[i - 2];
        KLineModel *model_4 = self.loadedKLineData[i - 3];
        KLineModel *model_5 = self.loadedKLineData[i - 4];
        KLineModel *model_6 = self.loadedKLineData[i - 5];
        KLineModel *model_7 = self.loadedKLineData[i - 6];
        KLineModel *model_8 = self.loadedKLineData[i - 7];
        
        BOOL model_1_fall = model_1.close < model_1.open;
        BOOL model_2_fall = model_2.close < model_2.open;
        BOOL model_3_fall = model_3.close < model_3.open;
        BOOL model_4_fall = model_4.close < model_4.open;
        BOOL model_5_fall = model_5.close < model_5.open;
        BOOL model_6_fall = model_6.close < model_6.open;
        BOOL model_7_fall = model_7.close < model_7.open;
        BOOL model_8_fall = model_8.close < model_8.open;
        
        // =============================
        // 基础 8 条判断
        // =============================
        
        ResultModel *r5 = [self judge_kLine_5_fall_5:model_5_fall];
        ResultModel *r6 = [self judge_kLine_6_fall_6:model_6_fall withModel_6:model_6 withFall_5:model_5_fall withModel_5:model_5];
        ResultModel *r7 = [self judge_kLine_7_fall_7:model_7_fall withModel_7:model_7 withFall_5:model_5_fall withModel_5:model_5];
        ResultModel *r8 = [self judge_kLine_8_fall_8:model_8_fall withModel_8:model_8 withFall_5:model_5_fall withModel_5:model_5];
        
        ResultModel *r4 = [self judge_KLine_4_fall_1:model_1_fall withModel_1:model_1
                                          withFall_2:model_2_fall withModel_2:model_2
                                          withFall_3:model_3_fall withModel_3:model_3
                                          withFall_4:model_4_fall withModel_4:model_4];
        
        ResultModel *r3 = [self judge_KLine_3_fall_1:model_1_fall withModel_1:model_1
                                          withFall_2:model_2_fall withModel_2:model_2
                                          withFall_3:model_3_fall withModel_3:model_3
                                          withFall_4:model_4_fall withModel_4:model_4];
        
        ResultModel *r2 = [self judge_KLine_2_fall_1:model_1_fall withModel_1:model_1
                                          withFall_2:model_2_fall withModel_2:model_2
                                          withFall_3:model_3_fall withModel_3:model_3
                                          withFall_4:model_4_fall withModel_4:model_4];
        
        ResultModel *r1 = [self judge_KLine_1_fall_1:model_1_fall withModel_1:model_1
                                          withFall_2:model_2_fall withModel_2:model_2
                                          withFall_3:model_3_fall withModel_3:model_3
                                          withFall_4:model_4_fall withModel_4:model_4];
        
        if (r1.result && r2.result && r3.result && r4.result &&
            r5.result && r6.result && r7.result && r8.result) {
            self.loadedKLineData[i - 3].mountainPeakTag = @"低谷";
        }
        
        self.loadedKLineData[i - 3].condition_1 = r1.prompt;
        self.loadedKLineData[i - 3].condition_2 = r2.prompt;
        self.loadedKLineData[i - 3].condition_3 = r3.prompt;
        self.loadedKLineData[i - 3].condition_4 = r4.prompt;
        self.loadedKLineData[i - 3].condition_5 = r5.prompt;
        self.loadedKLineData[i - 3].condition_6 = r6.prompt;
        self.loadedKLineData[i - 3].condition_7 = r7.prompt;
        self.loadedKLineData[i - 3].condition_8 = r8.prompt;
        
        // =============================
        // 特殊 1
        // =============================
        if (!self.loadedKLineData[i - 3].mountainPeakTag) {
            ResultModel *sp7 = [self special_judge_kLine_7_fall_7:model_7_fall
                                                    withModel_7:model_7
                                                     withFall_5:model_5_fall
                                                    withModel_5:model_5];
            
            if (r1.result && r2.result && r3.result && r4.result &&
                r5.result && r6.result && sp7.result) {
                
                self.loadedKLineData[i - 3].mountainPeakTag = @"特1";
                
                self.loadedKLineData[i - 3].condition_1 = r1.prompt;
                self.loadedKLineData[i - 3].condition_2 = r2.prompt;
                self.loadedKLineData[i - 3].condition_3 = r3.prompt;
                self.loadedKLineData[i - 3].condition_4 = r4.prompt;
                self.loadedKLineData[i - 3].condition_5 = r5.prompt;
                self.loadedKLineData[i - 3].condition_6 = r6.prompt;
                self.loadedKLineData[i - 3].condition_7 = sp7.prompt;
                self.loadedKLineData[i - 3].condition_8 = @"不需要";
            }

        }
        
        // =============================
        // 特殊 2
        // =============================
        if (!self.loadedKLineData[i - 3].mountainPeakTag) {
            ResultModel *sp2 = [self special_rise_1_rise_3_fall_fall_1:model_1_fall withModel_1:model_1
                                         withFall_2:model_2_fall withModel_2:model_2
                                         withFall_3:model_3_fall withModel_3:model_3
                                         withFall_4:model_4_fall withModel_4:model_4];
            
            ResultModel *sp7 = [self special_judge_kLine_7_fall_7:model_7_fall
                                                    withModel_7:model_7
                                                     withFall_5:model_5_fall
                                                    withModel_5:model_5];
            
            if (sp2.result && r5.result && r6.result && r7.result) {
                self.loadedKLineData[i - 3].mountainPeakTag = @"特2";
                
                self.loadedKLineData[i - 3].condition_1 = sp2.prompt;
                self.loadedKLineData[i - 3].condition_2 = @"不需要";
                self.loadedKLineData[i - 3].condition_3 = @"不需要";
                self.loadedKLineData[i - 3].condition_4 = @"不需要";
                self.loadedKLineData[i - 3].condition_5 = r5.prompt;
                self.loadedKLineData[i - 3].condition_6 = r6.prompt;
                self.loadedKLineData[i - 3].condition_7 = sp7.prompt;
                self.loadedKLineData[i - 3].condition_8 = @"不需要";
            }

        }
        
        // =============================
        // 特殊 3
        // =============================
        if (!self.loadedKLineData[i - 3].mountainPeakTag) {
            ResultModel *sp3 =
            [self special_rise_2_rise_2_fall_fall_1:model_1_fall withModel_1:model_1
                                         withFall_2:model_2_fall withModel_2:model_2
                                         withFall_3:model_3_fall withModel_3:model_3
                                         withFall_4:model_4_fall withModel_4:model_4];
            
            ResultModel *sp7 = [self special_judge_kLine_7_fall_7:model_7_fall
                                                    withModel_7:model_7
                                                     withFall_5:model_5_fall
                                                    withModel_5:model_5];
            
            if (sp3.result && r5.result && r6.result && r7.result) {
                self.loadedKLineData[i - 3].mountainPeakTag = @"特3";
                
                self.loadedKLineData[i - 3].condition_1 = sp3.prompt;
                self.loadedKLineData[i - 3].condition_2 = @"不需要";
                self.loadedKLineData[i - 3].condition_3 = @"不需要";
                self.loadedKLineData[i - 3].condition_4 = @"不需要";
                self.loadedKLineData[i - 3].condition_5 = r5.prompt;
                self.loadedKLineData[i - 3].condition_6 = r6.prompt;
                self.loadedKLineData[i - 3].condition_7 = sp7.prompt;
                self.loadedKLineData[i - 3].condition_8 = @"不需要";
            }

        }
        
        // =============================
        // 特殊 4
        // =============================
        if (!self.loadedKLineData[i - 3].mountainPeakTag) {
            ResultModel *sp4 =[self special_rise_3_rise_1_fall_fall_1:model_1_fall withModel_1:model_1
                                         withFall_2:model_2_fall withModel_2:model_2
                                         withFall_3:model_3_fall withModel_3:model_3
                                         withFall_4:model_4_fall withModel_4:model_4];
            
            ResultModel *sp7 = [self special_judge_kLine_7_fall_7:model_7_fall
                                                    withModel_7:model_7
                                                     withFall_5:model_5_fall
                                                    withModel_5:model_5];
            
            if (sp4.result && r5.result && r6.result && r7.result) {
                self.loadedKLineData[i - 3].mountainPeakTag = @"特4";
                
                self.loadedKLineData[i - 3].condition_1 = sp4.prompt;
                self.loadedKLineData[i - 3].condition_2 = @"不需要";
                self.loadedKLineData[i - 3].condition_3 = @"不需要";
                self.loadedKLineData[i - 3].condition_4 = @"不需要";
                self.loadedKLineData[i - 3].condition_5 = r5.prompt;
                self.loadedKLineData[i - 3].condition_6 = r7.prompt;
                self.loadedKLineData[i - 3].condition_7 = sp7.prompt;
                self.loadedKLineData[i - 3].condition_8 = @"不需要";
            }

        }
    }
}


-(ResultModel *)judge_KLine_1_fall_1:(BOOL)fall1
                        withModel_1:(KLineModel *)model_1
                         withFall_2:(BOOL)fall2
                        withModel_2:(KLineModel *)model_2
                         withFall_3:(BOOL)fall3
                        withModel_3:(KLineModel *)model_3
                         withFall_4:(BOOL)fall4
                        withModel_4:(KLineModel *)model_4 {

    ResultModel *model = [ResultModel new];

    if (fall1 == NO) {
        model.result = YES;
        model.prompt = @"1_A(满足) 第一条涨";
    } else { // 第一条跌

        if (fall2 == NO) { // 第二条涨
            float percentage_2_1 = (model_1.close - model_2.open) / model_2.open;

            if (percentage_2_1 > 0.001) {
                model.result = YES;
                model.prompt = [NSString stringWithFormat:
                    @"1_B(满足) 第一条跌 第二条涨\n第一条与第二条上涨幅度 >0.1%% 实际 %0.2f%%",
                    percentage_2_1 * 100];
            } else {

                if (fall3 == NO) { // 第三条涨
                    float percentage_3_1 = (model_1.close - model_3.open) / model_3.open;

                    if (percentage_3_1 > 0.001) {
                        model.result = YES;
                        model.prompt = [NSString stringWithFormat:
                            @"1_C(满足) 第一条跌,第二条涨,第三条涨\n第一第二条不足0.1%% 实际 %0.2f%%\n第三条与第一条涨幅 >0.1%% 实际 %0.2f%%",
                            percentage_2_1 * 100,
                            percentage_3_1 * 100];
                    } else {

                        if (fall4 == NO) { // 第四条涨
                            float percentage_4_1 = (model_1.close - model_4.open) / model_4.open;

                            if (percentage_4_1 > present_0_23) {
                                model.result = YES;
                                model.prompt = [NSString stringWithFormat:
                                    @"1_D(满足) 第一条跌,第二条涨,第三条涨,第四条涨\n前两条涨幅不足\n第四条上涨 >0.23%% 实际 %0.2f%%",
                                    percentage_4_1 * 100];
                            } else {
                                model.result = NO;
                                model.prompt = [NSString stringWithFormat:
                                    @"1_E(不满足) 第一条跌,第二条涨,第三条涨,第四条涨\n第四条上涨不足0.23%% 实际 %0.2f%%",
                                    percentage_4_1 * 100];
                            }

                        } else {
                            model.result = NO;
                            model.prompt = @"1_F(不满足) 第一条跌,第二条涨,第三条涨,第四条跌 形态破坏";
                        }
                    }

                } else { // 第三条跌
                    if (fall4 == NO) {
                        float percentage_4_1 = (model_1.close - model_4.open) / model_4.open;

                        if (percentage_4_1 > present_0_23) {
                            model.result = YES;
                            model.prompt = [NSString stringWithFormat:
                                @"1_G(满足) 第一条跌,第二条涨,第三条跌,第四条涨\n第四条上涨 >0.23%% 实际 %0.2f%%",
                                percentage_4_1 * 100];
                        } else {
                            model.result = NO;
                            model.prompt = [NSString stringWithFormat:
                                @"1_H(不满足) 第一条跌,第二条涨,第三条跌,第四条涨\n第四条上涨不足0.23%% 实际 %0.2f%%",
                                percentage_4_1 * 100];
                        }
                    } else {
                        model.result = NO;
                        model.prompt = @"1_I(不满足) 第一条跌,第二条涨,第三条跌,第四条跌 形态破坏";
                    }
                }
            }

        } else { // 第二条跌

            if (fall3 == NO) { // 第三条涨
                float percentage_3_1 = (model_1.close - model_3.open) / model_3.open;

                if (percentage_3_1 > present_0_23) {
                    model.result = YES;
                    model.prompt = [NSString stringWithFormat:
                        @"1_J(满足) 第一条跌,第二条跌,第三条涨\n上涨幅度 >0.23%% 实际 %0.2f%%",
                        percentage_3_1 * 100];
                } else {

                    if (fall4 == NO) {
                        float percentage_4_1 = (model_1.close - model_4.open) / model_4.open;

                        if (percentage_4_1 > present_0_23) {
                            model.result = YES;
                            model.prompt = [NSString stringWithFormat:
                                @"1_K(满足) 第一条跌,第二条跌,第三条涨,第四条涨\n第四条上涨 >0.23%% 实际 %0.2f%%",
                                percentage_4_1 * 100];
                        } else {
                            model.result = NO;
                            model.prompt = [NSString stringWithFormat:
                                @"1_L(不满足) 第一条跌,第二条跌,第三条涨,第四条涨\n第四条上涨不足0.23%% 实际 %0.2f%%",
                                percentage_4_1 * 100];
                        }
                    } else {
                        model.result = NO;
                        model.prompt = @"1_M(不满足) 第一条跌,第二条跌,第三条涨,第四条跌";
                    }
                }

            } else { // 第三条跌
                if (fall4 == NO) {
                    float percentage_4_1 = (model_1.close - model_4.open) / model_4.open;

                    if (percentage_4_1 > present_0_23) {
                        model.result = YES;
                        model.prompt = [NSString stringWithFormat:
                            @"1_N(满足) 第一条跌,第二条跌,第三条跌,第四条涨\n上涨幅度 >0.23%% 实际 %0.2f%%",
                            percentage_4_1 * 100];
                    } else {
                        model.result = NO;
                        model.prompt = [NSString stringWithFormat:
                            @"1_O(不满足) 第一条跌,第二条跌,第三条跌,第四条涨\n上涨幅度不足0.23%% 实际 %0.2f%%",
                            percentage_4_1 * 100];
                    }
                } else {
                    model.result = NO;
                    model.prompt = @"1_P(不满足) 第一条跌,第二条跌,第三条跌,第四条跌 形态破坏";
                }
            }
        }
    }

    return model;
}

-(ResultModel *)judge_KLine_2_fall_1:(BOOL)fall1
                        withModel_1:(KLineModel *)model_1
                         withFall_2:(BOOL)fall2
                        withModel_2:(KLineModel *)model_2
                         withFall_3:(BOOL)fall3
                        withModel_3:(KLineModel *)model_3
                         withFall_4:(BOOL)fall4
                        withModel_4:(KLineModel *)model_4 {

    ResultModel *model = [ResultModel new];

    if (fall2 == NO) { // 第二条涨
        model.result = YES;
        model.prompt = @"2_A(满足) 第二条涨";

    } else { // 第二条跌

        // 看第一条
        if (fall1 == NO) { // 第一条涨
            float percentage_2_1 = (model_1.close - model_2.open) / model_2.open;

            if (percentage_2_1 > present_0_23) {
                model.result = YES;
                model.prompt = [NSString stringWithFormat:
                    @"2_B(满足) 第二条跌,第一条涨,\n第二条跟第一条上涨幅度 >0.23%% 实际%0.2f%%",
                    percentage_2_1 * 100];
            } else {

                // 看第三条
                if (fall3 == NO) { // 第三条涨
                    float percentage_3_1 = (model_1.close - model_3.open) / model_3.open;

                    if (percentage_3_1 > present_0_23) {
                        model.result = YES;
                        model.prompt = [NSString stringWithFormat:
                            @"2_C(满足) 第三条涨,第二条跌,第一条涨,\n第三条涨幅大于0.23%% 实际%0.2f%%",
                            percentage_3_1 * 100];
                    } else {

                        // 看第四条
                        if (fall4 == NO) { // 第四条涨
                            float percentage_4_1 = (model_1.close - model_4.open) / model_4.open;

                            if (percentage_4_1 > present_0_23) {
                                model.result = YES;
                                model.prompt = [NSString stringWithFormat:
                                    @"2_D(满足) 第四条涨,第三条涨,第二条跌,第一条涨,\n第四条涨幅 >0.23%% 实际%0.2f%%",
                                    percentage_4_1 * 100];
                            } else {
                                model.result = NO;
                                model.prompt = [NSString stringWithFormat:
                                    @"2_E(不满足) 第四条涨,第三条涨,第二条跌,第一条涨,\n第四条涨幅 <0.23%% 实际%0.2f%%",
                                    percentage_4_1 * 100];
                            }
                        } else {
                            model.result = NO;
                            model.prompt = @"2_F(不满足) 第一条涨,第二条跌,第三条涨,第四条跌,形态破坏";
                        }
                    }

                } else { // 第三条跌
                    if (fall4 == NO) { // 第四条涨
                        float percentage_4_1 = (model_1.close - model_4.open) / model_4.open;

                        if (percentage_4_1 > present_0_23) {
                            model.result = YES;
                            model.prompt = [NSString stringWithFormat:
                                @"2_G(满足) 第四条涨,第三条跌,第二条跌,第一条涨,\n第四条涨幅 >0.23%% 实际%0.2f%%",
                                percentage_4_1 * 100];
                        } else {
                            model.result = NO;
                            model.prompt = [NSString stringWithFormat:
                                @"2_H(不满足) 第四条涨,第三条跌,第二条跌,第一条涨,\n第四条涨幅 <0.23%% 实际%0.2f%%",
                                percentage_4_1 * 100];
                        }
                    } else {
                        model.result = NO;
                        model.prompt = @"2_I(不满足) 第一条涨,第二条跌,第三条跌,第四条跌,形态破坏";
                    }
                }
            }

        } else { // 第一条跌

            if (fall3 == NO) { // 第三条涨
                float percentage_3_1 = (model_1.close - model_3.open) / model_3.open;

                if (percentage_3_1 > present_0_23) {
                    model.result = YES;
                    model.prompt = [NSString stringWithFormat:
                        @"2_J(满足) 第一条跌,第二条跌,第三条涨,\n涨幅 >0.23%% 实际%0.2f%%",
                        percentage_3_1 * 100];
                } else {

                    if (fall4 == NO) {
                        float percentage_4_1 = (model_1.close - model_4.open) / model_4.open;

                        if (percentage_4_1 > present_0_23) {
                            model.result = YES;
                            model.prompt = [NSString stringWithFormat:
                                @"2_K(满足) 第一条跌,第二条跌,第三条涨,第四条涨,\n涨幅 >0.23%% 实际%0.2f%%",
                                percentage_4_1 * 100];
                        } else {
                            model.result = NO;
                            model.prompt = [NSString stringWithFormat:
                                @"2_L(不满足) 第一条跌,第二条跌,第三条涨,第四条涨,\n涨幅 <0.23%% 实际%0.2f%%",
                                percentage_4_1 * 100];
                        }
                    } else {
                        model.result = NO;
                        model.prompt = @"2_M(不满足) 第一条跌,第二条跌,第三条涨,第四条跌,形态破坏";
                    }
                }

            } else { // 第三条跌
                if (fall4 == NO) {
                    float percentage_4_1 = (model_1.close - model_4.open) / model_4.open;

                    if (percentage_4_1 > present_0_23) {
                        model.result = YES;
                        model.prompt = [NSString stringWithFormat:
                            @"2_N(满足) 第一条跌,第二条跌,第三条跌,第四条涨,\n涨幅 >0.23%% 实际%0.2f%%",
                            percentage_4_1 * 100];
                    } else {
                        model.result = NO;
                        model.prompt = [NSString stringWithFormat:
                            @"2_O(不满足) 第一条跌,第二条跌,第三条跌,第四条涨,\n涨幅 <0.23%% 实际%0.2f%%",
                            percentage_4_1 * 100];
                    }
                } else {
                    model.result = NO;
                    model.prompt = @"2_P(不满足) 第一条跌,第二条跌,第三条跌,第四条跌,形态破坏";
                }
            }
        }
    }

    return model;
}

-(ResultModel *)judge_KLine_3_fall_1:(BOOL)fall1
                        withModel_1:(KLineModel *)model_1
                         withFall_2:(BOOL)fall2
                        withModel_2:(KLineModel *)model_2
                         withFall_3:(BOOL)fall3
                        withModel_3:(KLineModel *)model_3
                         withFall_4:(BOOL)fall4
                        withModel_4:(KLineModel *)model_4 {

    ResultModel *model = [ResultModel new];

    if (fall3 == NO) { // 第三条涨
        model.result = YES;
        model.prompt = @"3_A(满足) 第三条涨";

    } else { // 第三条跌

        // 看第四条
        if (fall4 == NO) { // 第四条涨
            float percentage_4_3 = (model_3.close - model_4.open) / model_4.open;

            if (percentage_4_3 > 0.001) {
                model.result = YES;
                model.prompt = [NSString stringWithFormat:
                    @"3_B(满足) 第三条跌,第四条涨\n第四条涨幅相对第三条 >0.1%% 实际%0.2f%%",
                    percentage_4_3 * 100];
            } else {

                // 看第二条
                if (fall2 == NO) { // 第二条涨

                    // 看第一条
                    if (fall1 == NO) { // 第一条涨
                        float percentage_4_1 = (model_1.close - model_4.open) / model_4.open;

                        if (percentage_4_1 > present_0_23) {
                            model.result = YES;
                            model.prompt = [NSString stringWithFormat:
                                @"3_C(满足) 第四条涨,第三条跌,第二条涨,第一条涨\n第四条涨幅 >0.23%% 实际%0.2f%%",
                                percentage_4_1 * 100];
                        } else {
                            model.result = NO;
                            model.prompt = [NSString stringWithFormat:
                                @"3_D(不满足) 第四条涨,第三条跌,第二条涨,第一条涨\n第四条涨幅 <0.23%% 实际%0.2f%%",
                                percentage_4_1 * 100];
                        }

                    } else { // 第一条跌
                        float percentage_4_1 = (model_1.close - model_4.open) / model_4.open;

                        if (percentage_4_1 > present_0_23) {
                            model.result = YES;
                            model.prompt = [NSString stringWithFormat:
                                @"3_E(满足) 第四条涨,第三条跌,第二条涨,第一条跌\n第四条涨幅 >0.23%% 实际%0.2f%%",
                                percentage_4_1 * 100];
                        } else {
                            model.result = NO;
                            model.prompt = [NSString stringWithFormat:
                                @"3_F(不满足) 第四条涨,第三条跌,第二条涨,第一条跌\n第四条涨幅 <0.23%% 实际%0.2f%%",
                                percentage_4_1 * 100];
                        }
                    }

                } else { // 第二条跌

                    // 看第一条
                    if (fall1 == NO) {
                        float percentage_4_1 = (model_1.close - model_4.open) / model_4.open;

                        if (percentage_4_1 > present_0_23) {
                            model.result = YES;
                            model.prompt = [NSString stringWithFormat:
                                @"3_G(满足) 第一条涨,第二条跌,第三条跌,第四条涨\n第四条涨幅 >0.23%% 实际%0.2f%%",
                                percentage_4_1 * 100];
                        } else {
                            model.result = NO;
                            model.prompt = [NSString stringWithFormat:
                                @"3_H(不满足) 第一条涨,第二条跌,第三条跌,第四条涨\n第四条涨幅 <0.23%% 实际%0.2f%%",
                                percentage_4_1 * 100];
                        }
                    } else {
                        model.result = NO;
                        model.prompt = @"3_I(不满足) 第一条跌,第二条跌,第三条跌,第四条涨,形态破坏";
                    }
                }
            }

        } else { // 第四条跌
            model.result = NO;
            model.prompt = @"3_J(不满足) 第三条跌,第四条跌,形态破坏";
        }
    }

    return model;
}

-(ResultModel *)judge_KLine_4_fall_1:(BOOL)fall1
                        withModel_1:(KLineModel *)model_1
                         withFall_2:(BOOL)fall2
                        withModel_2:(KLineModel *)model_2
                         withFall_3:(BOOL)fall3
                        withModel_3:(KLineModel *)model_3
                         withFall_4:(BOOL)fall4
                        withModel_4:(KLineModel *)model_4 {

    ResultModel *model = [ResultModel new];

    if (fall4 == NO) { // 第四条涨

        // 看第三条
        if (fall3 == NO) { // 第三条涨

            // 看第二条
            if (fall2 == NO) { // 第二条涨

                // 看第一条
                if (fall1 == NO) { // 第一条涨
                    float percentage_4_1 = (model_1.close - model_4.open) / model_4.open;
                    if (percentage_4_1 > present_0_23) {
                        model.result = YES;
                        model.prompt = [NSString stringWithFormat:
                            @"4_A(满足) 第四条涨,第三条涨,第二条涨,第一条涨\n第四条与第一条涨幅 >0.23%% 实际%0.2f%%",
                            percentage_4_1 * 100];
                    } else {
                        model.result = NO;
                        model.prompt = [NSString stringWithFormat:
                            @"4_B(不满足) 第四条涨,第三条涨,第二条涨,第一条涨\n第四条与第一条涨幅 <0.23%% 实际%0.2f%%",
                            percentage_4_1 * 100];
                    }

                } else { // 第一条跌
                    float percentage_4_1 = (model_1.close - model_4.open) / model_4.open;
                    if (percentage_4_1 > present_0_23) {
                        model.result = YES;
                        model.prompt = [NSString stringWithFormat:
                            @"4_C(满足) 第四条涨,第三条涨,第二条涨,第一条跌\n第四条与第一条涨幅 >0.23%% 实际%0.2f%%",
                            percentage_4_1 * 100];
                    } else {
                        model.result = NO;
                        model.prompt = [NSString stringWithFormat:
                            @"4_D(不满足) 第四条涨,第三条涨,第二条涨,第一条跌\n第四条与第一条涨幅 <0.23%% 实际%0.2f%%",
                            percentage_4_1 * 100];
                    }
                }

            } else { // 第二条跌
                float percentage_4_2 = (model_2.close - model_4.open) / model_4.open;

                if (percentage_4_2 > 0.001) {

                    if (fall1 == NO) { // 第一条涨
                        float percentage_4_1 = (model_1.close - model_4.open) / model_4.open;
                        if (percentage_4_1 > present_0_23) {
                            model.result = YES;
                            model.prompt = [NSString stringWithFormat:
                                @"4_E(满足) 第四条涨,第三条涨,第二条跌,第一条涨\n第四条与第一条涨幅 >0.23%% 实际%0.2f%%",
                                percentage_4_1 * 100];
                        } else {
                            model.result = NO;
                            model.prompt = [NSString stringWithFormat:
                                @"4_F(不满足) 第四条涨,第三条涨,第二条跌,第一条涨\n第四条与第一条涨幅 <0.23%% 实际%0.2f%%",
                                percentage_4_1 * 100];
                        }
                    } else {
                        float percentage_4_1 = (model_1.close - model_4.open) / model_4.open;
                        if (percentage_4_1 > present_0_23) {
                            model.result = YES;
                            model.prompt = [NSString stringWithFormat:
                                @"4_G(满足) 第四条涨,第三条涨,第二条跌,第一条跌\n第四条与第一条涨幅 >0.23%% 实际%0.2f%%",
                                percentage_4_1 * 100];
                        } else {
                            model.result = NO;
                            model.prompt = [NSString stringWithFormat:
                                @"4_H(不满足) 第四条涨,第三条涨,第二条跌,第一条跌\n第四条与第一条涨幅 <0.23%% 实际%0.2f%%",
                                percentage_4_1 * 100];
                        }
                    }

                } else {
                    model.result = NO;
                    model.prompt = @"4_I(不满足) 第四条涨,第三条涨,第二条跌\n第四条与第二条涨幅 <0.1%";
                }
            }

        } else { // 第三条跌

            float percentage_4_3 = (model_3.close - model_4.open) / model_4.open;
            if (percentage_4_3 > 0.001) {

                if (fall2 == NO) { // 第二条涨

                    if (fall1 == NO) {
                        float percentage_4_1 = (model_1.close - model_4.open) / model_4.open;
                        if (percentage_4_1 > present_0_23) {
                            model.result = YES;
                            model.prompt = [NSString stringWithFormat:
                                @"4_J(满足) 第四条涨,第三条跌,第二条涨,第一条涨\n第四条与第一条涨幅 >0.23%% 实际%0.2f%%",
                                percentage_4_1 * 100];
                        } else {
                            model.result = NO;
                            model.prompt = [NSString stringWithFormat:
                                @"4_K(不满足) 第四条涨,第三条跌,第二条涨,第一条涨\n第四条与第一条涨幅 <0.23%% 实际%0.2f%%",
                                percentage_4_1 * 100];
                        }
                    } else {
                        float percentage_4_1 = (model_1.close - model_4.open) / model_4.open;
                        if (percentage_4_1 > present_0_23) {
                            model.result = YES;
                            model.prompt = [NSString stringWithFormat:
                                @"4_L(满足) 第四条涨,第三条跌,第二条涨,第一条跌\n第四条与第一条涨幅 >0.23%% 实际%0.2f%%",
                                percentage_4_1 * 100];
                        } else {
                            model.result = NO;
                            model.prompt = [NSString stringWithFormat:
                                @"4_M(不满足) 第四条涨,第三条跌,第二条涨,第一条跌\n第四条与第一条涨幅 <0.23%% 实际%0.2f%%",
                                percentage_4_1 * 100];
                        }
                    }

                } else { // 第二条跌
                    float percentage_4_1 = (model_1.close - model_4.open) / model_4.open;

                    if (percentage_4_1 > present_0_23) {
                        model.result = YES;
                        model.prompt = [NSString stringWithFormat:
                            @"4_N(满足) 第四条涨,第三条跌,第二条跌,第一条涨\n第四条与第一条涨幅 >0.23%% 实际%0.2f%%",
                            percentage_4_1 * 100];
                    } else {
                        model.result = NO;
                        model.prompt = [NSString stringWithFormat:
                            @"4_O(不满足) 第四条涨,第三条跌,第二条跌,第一条涨\n第四条与第一条涨幅 <0.23%% 实际%0.2f%%",
                            percentage_4_1 * 100];
                    }
                }

            } else {
                model.result = NO;
                model.prompt = [NSString stringWithFormat:
                    @"4_P(不满足) 第四条涨,第三条跌\n第三条与第四条涨幅 <0.1%% 实际%0.2f%%",
                    percentage_4_3 * 100];
            }
        }

    } else { // 第四条跌
        model.result = NO;
        model.prompt = @"4_Q(不满足) 第四条跌,形态破坏";
    }

    return model;
}

-(ResultModel *)judge_kLine_8_fall_8:(BOOL)fall_8
                      withModel_8:(KLineModel *)model_8
                      withFall_5:(BOOL)fall_5
                      withModel_5:(KLineModel *)model_5 {

    ResultModel *model = [ResultModel new];

    if (fall_5 == YES) { // 第五条跌
        // 看第八条
        if (fall_8 == YES) { // 第八条跌
            model.result = YES;
            model.prompt = @"8_A(满足) 第五条跌, 第八条跌";
        } else { // 第八条升
            if (model_8.open < model_5.close) {
                float percentage_8_5 = (model_5.close - model_8.open) / model_8.open;
                if (percentage_8_5 < 0.0015) {
                    model.result = YES;
                    model.prompt = [NSString stringWithFormat:
                        @"8_B(满足) 第五条跌, 第八条升,\n第八条开盘价跟第五条收盘价小于0.15%%差距 实际%0.2f%%",
                        percentage_8_5 * 100];
                } else {
                    model.result = NO;
                    model.prompt = [NSString stringWithFormat:
                        @"8_C(不满足) 第五条跌, 第八条升,\n第八条开盘价跟第五条收盘价大于0.15%%差距 实际%0.2f%%",
                        percentage_8_5 * 100];
                }
            } else {
                model.result = YES;
                model.prompt = @"8_D(满足) 第五条跌, 第八条升,\n第八条开盘价没有低于第五条收盘价";
            }
        }
    } else { // 第五条升
        model.result = NO;
        model.prompt = @"8_E(不满足) 第五条升 形态破坏";
    }

    return model;
}

-(ResultModel *)judge_kLine_7_fall_7:(BOOL)fall_7
                      withModel_7:(KLineModel *)model_7
                      withFall_5:(BOOL)fall_5
                      withModel_5:(KLineModel *)model_5 {

    ResultModel *model = [ResultModel new];

    if (fall_5 == YES) { // 第五条跌
        // 看第七条
        if (fall_7 == YES) { // 第七条跌
            model.result = YES;
            model.prompt = @"7_A(满足) 第五条跌, 第七条跌";
        } else { // 第七条升
            if (model_7.open < model_5.close) {
                float percentage_7_5 = (model_5.close - model_7.open) / model_7.open;
                if (percentage_7_5 < 0.0015) {
                    model.result = YES;
                    model.prompt = [NSString stringWithFormat:
                        @"7_B(满足) 第五条跌, 第七条升,\n第七条开盘价跟第五条收盘价小于0.15%%差距 实际%0.2f%%",
                        percentage_7_5 * 100];
                } else {
                    model.result = NO;
                    model.prompt = [NSString stringWithFormat:
                        @"7_C(不满足) 第五条跌, 第七条升,\n第七条开盘价跟第五条收盘价大于0.15%%差距 实际%0.2f%%",
                        percentage_7_5 * 100];
                }
            } else {
                model.result = YES;
                model.prompt = @"7_D(满足) 第五条跌, 第七条升,\n第七条开盘价没有低于第五条收盘价";
            }
        }
    } else { // 第五条升
        model.result = NO;
        model.prompt = @"7_E(不满足) 第五条升 形态破坏";
    }

    return model;
}

-(ResultModel *)judge_kLine_6_fall_6:(BOOL)fall_6
                      withModel_6:(KLineModel *)model_6
                      withFall_5:(BOOL)fall_5
                      withModel_5:(KLineModel *)model_5 {

    ResultModel *model = [ResultModel new];

    if (fall_5 == YES) { // 第五条跌
        // 看第六条
        if (fall_6 == YES) { // 第六条跌
            model.result = YES;
            model.prompt = @"6_A(满足) 第五条跌, 第六条跌";
        } else { // 第六条升
            if (model_6.open < model_5.close) {
                float percentage_6_5 = (model_5.close - model_6.open) / model_6.open;
                if (percentage_6_5 < 0.0015) {
                    model.result = YES;
                    model.prompt = [NSString stringWithFormat:
                        @"6_B(满足) 第五条跌, 第六条升,\n第六条开盘价跟第五条收盘价小于0.15%%差距 实际%0.2f%%",
                        percentage_6_5 * 100];
                } else {
                    model.result = NO;
                    model.prompt = [NSString stringWithFormat:
                        @"6_C(不满足) 第五条跌, 第六条升,\n第六条开盘价跟第五条收盘价大于0.15%%差距 实际%0.2f%%",
                        percentage_6_5 * 100];
                }
            } else {
                model.result = YES;
                model.prompt = @"6_D(满足) 第五条跌, 第六条升,\n第六条开盘价没有低于第五条收盘价";
            }
        }
    } else {
        model.result = NO;
        model.prompt = @"6_E(不满足) 第五条升 形态破坏";
    }

    return model;
}

-(ResultModel *)judge_kLine_5_fall_5:(BOOL)fall5 {
    ResultModel *model = [ResultModel new];
    if (fall5 == YES) {
        model.result = YES;
        model.prompt = @"5_A(满足) 第五条跌";
    } else {
        model.result = NO;
        model.prompt = @"5_B(不满足) 第五条升, 形态破坏";
    }
    return model;
}

-(ResultModel *)special_judge_kLine_7_fall_7:(BOOL)fall_7
                             withModel_7:(KLineModel *)model_7
                             withFall_5:(BOOL)fall_5
                             withModel_5:(KLineModel *)model_5 {

    ResultModel *model = [ResultModel new];

    if (fall_5 == YES) { // 第五条跌
        if (fall_7 == YES) { // 第七条跌
            model.result = YES;
            model.prompt = @"特殊1_7_A(满足) 第五条跌, 第七条跌";
        } else { // 第七条升
            if (model_7.open < model_5.close) {
                float percentage_7_5 = (model_5.close - model_7.open) / model_7.open;
                if (percentage_7_5 < 0.003) {
                    model.result = YES;
                    model.prompt = [NSString stringWithFormat:
                        @"特殊1_7_B(满足) 第五条跌, 第七条升,\n第七条开盘价跟第五条收盘价小于0.3%%差距 实际%0.2f%%",
                        percentage_7_5 * 100];
                } else {
                    model.result = NO;
                    model.prompt = [NSString stringWithFormat:
                        @"特殊1_7_C(不满足) 第五条跌, 第七条升,\n第七条开盘价跟第五条收盘价大于0.3%%差距 实际%0.2f%%",
                        percentage_7_5 * 100];
                }
            } else {
                model.result = YES;
                model.prompt = @"特殊1_7_D(满足) 第五条跌, 第七条升,\n第七条开盘价没有低于第五条收盘价";
            }
        }
    } else {
        model.result = NO;
        model.prompt = @"特殊1_7_E(不满足) 第五条升 形态破坏";
    }

    return model;
}

-(ResultModel *)special_rise_1_rise_3_fall_fall_1:(BOOL)fall1
                                      withModel_1:(KLineModel *)model_1
                                       withFall_2:(BOOL)fall2
                                      withModel_2:(KLineModel *)model_2
                                       withFall_3:(BOOL)fall3
                                      withModel_3:(KLineModel *)model_3
                                       withFall_4:(BOOL)fall4
                                      withModel_4:(KLineModel *)model_4 {

    ResultModel *model = [ResultModel new];

    if (fall4 == YES) { // 第四条跌
        if ((model_4.close - model_4.open) / model_4.open > 0.005) {
            if (fall3 == YES) {
                float percentage_4 = (model_4.close - model_4.open) / model_4.open;
                float percentage_3 = (model_3.open - model_3.close) / model_3.open;

                if (percentage_4 / percentage_3 > 2) {
                    if (fall2 == YES) {
                        if (fall1 == YES) {
                            model.result = YES;
                            model.prompt = @"特殊2_A(满足) 第四条跌, 第三条跌, 第二条跌, 第一条跌\n第四条跌幅是第三条的2倍以上";
                        } else {
                            model.result = NO;
                            model.prompt = @"特殊2_B(不满足) 第一条升 形态破坏";
                        }
                    } else {
                        model.result = NO;
                        model.prompt = @"特殊2_C(不满足) 第二条升 形态破坏";
                    }
                } else {
                    model.result = NO;
                    model.prompt = @"特殊2_D(不满足) 第四条跌幅未达到第三条2倍";
                }
            } else {
                model.result = NO;
                model.prompt = @"特殊2_E(不满足) 第三条升 形态破坏";
            }
        } else {
            model.result = NO;
            model.prompt = @"特殊2_F(不满足) 第四条跌幅未超过0.5%";
        }
    } else {
        model.result = NO;
        model.prompt = @"特殊2_G(不满足) 第四条升 形态破坏";
    }

    return model;
}

// 特殊3（镜像）：两条升 + 两条跌
-(ResultModel *)special_rise_2_rise_2_fall_fall_1:(BOOL)fall1
                                     withModel_1:(KLineModel *)model_1
                                      withFall_2:(BOOL)fall2
                                     withModel_2:(KLineModel *)model_2
                                      withFall_3:(BOOL)fall3
                                     withModel_3:(KLineModel *)model_3
                                      withFall_4:(BOOL)fall4
                                     withModel_4:(KLineModel *)model_4 {

    ResultModel *model = [ResultModel new];

    if (fall4 == YES) { // 第四条跌
        if (fall3 == YES) { // 第三条跌
            if ((model_3.close - model_4.open) / model_4.open > 0.0045) {

                if (fall2 == NO) { // 第二条升
                    if (fall1 == NO) { // 第一条升
                        model.result = YES;
                        model.prompt = @"特殊3_A(满足) 第四条跌,第三条跌,第二条升,第一条升,\n第四条和第三条合计涨幅超过0.45%";
                    } else {
                        model.result = NO;
                        model.prompt = @"特殊3_B(不满足) 第一条跌 形态破坏";
                    }
                } else {
                    model.result = NO;
                    model.prompt = @"特殊3_C(不满足) 第二条跌 形态破坏";
                }

            } else {
                model.result = NO;
                model.prompt = @"特殊3_D(不满足) 第四条与第三条合计涨幅不足0.45%";
            }
        } else {
            model.result = NO;
            model.prompt = @"特殊3_E(不满足) 第三条升 形态破坏";
        }
    } else {
        model.result = NO;
        model.prompt = @"特殊3_F(不满足) 第四条升 形态破坏";
    }

    return model;
}

// 特殊4（镜像）：三条升 + 一条跌
-(ResultModel *)special_rise_3_rise_1_fall_fall_1:(BOOL)fall1
                                     withModel_1:(KLineModel *)model_1
                                      withFall_2:(BOOL)fall2
                                     withModel_2:(KLineModel *)model_2
                                      withFall_3:(BOOL)fall3
                                     withModel_3:(KLineModel *)model_3
                                      withFall_4:(BOOL)fall4
                                     withModel_4:(KLineModel *)model_4 {

    ResultModel *model = [ResultModel new];

    if (fall4 == YES) { // 第四条跌
        if (fall3 == YES) {
            if (fall2 == YES) {

                if ((model_2.close - model_4.open) / model_4.open > 0.0046) {

                    if (fall1 == NO) {
                        model.result = YES;
                        model.prompt = @"特殊4_A(满足) 第四条跌,第三条跌,第二条跌,第一条升,\n第四条到第二条涨幅大于0.46%";
                    } else {
                        model.result = NO;
                        model.prompt = @"特殊4_B(不满足) 第一条跌 形态破坏";
                    }

                } else {
                    model.result = NO;
                    model.prompt = @"特殊4_C(不满足) 第四条到第二条涨幅小于0.46%";
                }

            } else {
                model.result = NO;
                model.prompt = @"特殊4_D(不满足) 第二条升 形态破坏";
            }
        } else {
            model.result = NO;
            model.prompt = @"特殊4_F(不满足) 第三条升 形态破坏";
        }
    } else {
        model.result = NO;
        model.prompt = @"特殊4_H(不满足) 第四条升 形态破坏";
    }

    return model;
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

- (NSString *)timeString:(NSTimeInterval)ts {
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:ts];
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd HH:mm";
    return [fmt stringFromDate:date];
}

// 买入,卖出
- (void)backtestByPeakAndValleyRule {
    //初始资金 = 1
    double capital = 1.0;
    //总的交易笔数
    int tradeCount = 0;
    //盈利的交易笔数
    int winCount = 0;
    //当前连续亏损次数
    int currentLoseStreak = 0;
    //出现过 n 连败的次数
    int loseStreakCount[13] = {0};
    //当前是否持仓
    BOOL hasPosition = NO;
    //YES → 做多。  NO → 做空
    BOOL isLong = NO;
    //开仓价（用 close）
    double entryPrice = 0;
    //开仓时间（字符串，仅用于日志）
    NSString *entryTime = nil;
    //最近一个「已确认可用于判断趋势的山峰」
    KLineModel *referencePeak = nil;
    //最近一个「已确认可用于判断趋势的低谷」
    KLineModel *referenceValley = nil;
    
    //候选山峰
    KLineModel *pendingPeak = nil;
    //候选低谷
    KLineModel *pendingValley = nil;
    
    for (NSInteger i = 0; i < self.loadedKLineData.count; i++) {
        KLineModel *model = self.loadedKLineData[i];
        
        // ========= 1️⃣ 先让“上一根”的候选生效 =========
        if (pendingPeak) {
            referencePeak = pendingPeak;
            pendingPeak = nil;
        }
        if (pendingValley) {
            referenceValley = pendingValley;
            pendingValley = nil;
        }
        
        // ========= 2️⃣ 标记新的候选山峰 / 低谷 =========
        if ([model.mountainPeakTag isEqualToString:@"山峰"]) {
            pendingPeak = model;
        } else if ([model.mountainPeakTag isEqualToString:@"低谷"]) {
            pendingValley = model;
        }
        
        // =================================================
        // 已持仓 → 判断卖出
        // =================================================
        if (hasPosition) {//如果当前已经有仓位
            
            // ---- 做多：新山峰回落 ----
            /**
             1.当前是做多 2.当前 K 线是山峰  3.已经有一个参考山峰
             */
            if (isLong && [model.mountainPeakTag isEqualToString:@"山峰"] && referencePeak) {
                //新一轮上涨的山峰，开盘价已经低于上一个山峰
                if (model.open < referencePeak.open) {
                    //盈亏计算（做多）
                    double profit = (model.close - entryPrice) / entryPrice;
                    //复利叠加
                    capital *= (1 + profit);
                    //统计胜负 & 连败
                    tradeCount++;
                    BOOL win = profit > 0;
                    
                    if (win) {
                        winCount++;
                        if (currentLoseStreak > 0 && currentLoseStreak <= 12) {
                            loseStreakCount[currentLoseStreak]++;
                        }
                        //连败清0
                        currentLoseStreak = 0;
                    } else {
                        //连败清 +1
                        currentLoseStreak++;
                    }
                    
                    NSString *timeString = [self timeString:model.timestamp];
                    NSLog(@"做多 | 买入时间 %@ | 卖出时间 %@ | 买入价 %.6f | 卖出价 %.6f | %@ | 盈利 %.3f%%",
                          entryTime, timeString, entryPrice, model.close,
                          win ? @"WIN" : @"LOSE", profit * 100);
                    //平仓完成
                    hasPosition = NO;
                }
                //当前这个山峰，升级为新的参考峰
                referencePeak = model;
            }
            
            // ---- 做空：新低谷反弹 ----
            //1.当前是做空 2.当前 K 线是低谷 3.已有参考低谷
            if (!isLong && [model.mountainPeakTag isEqualToString:@"低谷"] && referenceValley) {
                //新一轮下跌的低谷，反而比上一次低谷更高
                if (model.open > referenceValley.open) {
                    //做空收益计算
                    double profit = (entryPrice - model.close) / entryPrice;
                    //复利叠加
                    capital *= (1 + profit);
                    //统计胜负 & 连败
                    tradeCount++;
                    BOOL win = profit > 0;
                    
                    if (win) {
                        winCount++;
                        if (currentLoseStreak > 0 && currentLoseStreak <= 12) {
                            loseStreakCount[currentLoseStreak]++;
                        }
                        //连败清0
                        currentLoseStreak = 0;
                    } else {
                        //连败 +1
                        currentLoseStreak++;
                    }
                    
                    NSString *timeString = [self timeString:model.timestamp];
                    NSLog(@"做空 | 买入时间 %@ | 卖出时间 %@ | 买入价 %.6f | 卖出价 %.6f | %@ | 盈利 %.3f%%",
                          entryTime, timeString, entryPrice, model.close,
                          win ? @"WIN" : @"LOSE", profit * 100);
                    
                    hasPosition = NO;
                }
                //当前这个低谷，升级为新的参考峰
                referenceValley = model;
            }
            
            continue;
        }
        
        NSString *timeString = [self timeString:model.timestamp];
        
        // =================================================
        // 空仓 → 判断买入（先做多）
        // =================================================
        //做多判断
        if (referencePeak && model.close > referencePeak.open) {
            //已经持仓
            hasPosition = YES;
            //做多
            isLong = YES;
            //买入价
            entryPrice = model.close;
            //买入时间
            entryTime = timeString;
            continue;
        }
        //做空判断
        if (referenceValley && model.close < referenceValley.open) {
            //已经持仓
            hasPosition = YES;
            //做空
            isLong = NO;
            //卖出价
            entryPrice = model.close;
            //卖出时间
            entryTime = timeString;
            continue;
        }
    }
    
    // ================== 结果 ==================
    NSLog(@"============================");
    NSLog(@"===== 固定参数回测结果 =====");
    NSLog(@"============================");
    NSLog(@"最终资金乘数(起始资金为1) = %.6f", capital);
    NSLog(@"交易笔数 = %d", tradeCount);
    NSLog(@"获利笔数 = %d", winCount);
    NSLog(@"胜率 = %.2f%%", tradeCount ? (double)winCount / tradeCount * 100 : 0);
    NSLog(@"平均每笔回报（%%） = %.4f", tradeCount ? (capital - 1) / tradeCount * 100 : 0);
    
    NSLog(@"========== 连败统计（1..12） ==========");
    for (int i = 1; i <= 12; i++) {
        NSLog(@"连输%d: %d", i, loseStreakCount[i]);
    }
}






@end


