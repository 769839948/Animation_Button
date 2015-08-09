//
//  ViewController.m
//  Animation_button
//
//  Created by Jane on 8/8/15.
//  Copyright (c) 2015 Jane. All rights reserved.
//

#import "ViewController.h"
#import "QuartzCore/QuartzCore.h"
#import "Animation.h"

#define BUTTON_WIDTH 80
#define LABLEVIEW_WIDTH 100
#define LABLEVIEW_HEIGHT 30
@interface ViewController ()<UIScrollViewDelegate>
{
    UIScrollView *scollView;
    UIButton *firstBt;
    NSInteger firstFrame;
    NSInteger secondeFrame;
    NSInteger thirdFrame;
    NSInteger fourFrame;
    UIImageView *firstImgView;
    NSMutableArray *buttonArray;
    NSMutableArray *lableArray;
    
    UIButton *button;
    UIView *labelView;
    
}


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    firstFrame = 0;
    secondeFrame = 0;
    thirdFrame = 0;
    fourFrame = 0;
    //,@"常用网址",@"考试大纲",@"考研报名",@"现场确认",@"打印准考证",@"初试",@"成绩查询",@"调剂复试录取",@"学院介绍",@"招生简章",@"专业目录",@"参考数目",@"分数报录比",@"导师信息",@"联系方式",@"培养政策",@"历年真题",@"调剂信息",@"复试信息",@"其他",
    buttonArray = [NSMutableArray arrayWithObjects:@"考研介绍",@"常用网址",@"考试大纲",@"考研报名",@"现场确认",@"打印准考证",@"初试",@"成绩查询",@"调剂复试录取",@"学院介绍",@"招生简章",@"专业目录",@"参考数目",@"分数报录比",@"导师信息",@"联系方式",@"培养政策",@"历年真题",@"调剂信息",@"复试信息",@"其他", nil];
    scollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    scollView.backgroundColor = [UIColor colorWithRed:0.2671 green:0.7495 blue:1.0 alpha:1.0];
    scollView.delegate = self;
    scollView.contentSize = CGSizeMake(self.view.frame.size.width, 800+buttonArray.count*100);
    UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2-8, self.view.frame.size.height-70, 16, scollView.contentSize.height-70)];
    [image setBackgroundColor:[UIColor whiteColor]];
    [scollView addSubview:image];
    [self.view addSubview:scollView];
    //[self initFirstButton];
    [self initButton];
    

}

-(void)initButton
{
    for (int i = 1; i < buttonArray.count+1; i++) {
        
        button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = i;
        labelView = [[UIView alloc] initWithFrame:CGRectMake((i+1)%2*(-140)+((i)%2)*(self.view.frame.size.width), 100*i+630, LABLEVIEW_WIDTH, LABLEVIEW_HEIGHT)];
        labelView.tag = i*100;
        [labelView setBackgroundColor:[UIColor colorWithRed:0.1751 green:0.6195 blue:0.8207 alpha:1.0]];
        UILabel *labelText = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, labelView.frame.size.width, labelView.frame.size.height)];
        labelText.text = [buttonArray objectAtIndex:i-1];
        [labelView addSubview:labelText];
        labelText.textColor = [UIColor whiteColor];
        [scollView addSubview:labelView];
        [button setFrame:CGRectMake(40+((i+1)%2)*(self.view.frame.size.width-BUTTON_WIDTH-80), 100*i+600, BUTTON_WIDTH/2, BUTTON_WIDTH/2)];
        [button setTitleColor:[UIColor colorWithRed:0.421 green:0.472 blue:0.962 alpha:1.000] forState:UIControlStateNormal];
        [button setBackgroundColor:[UIColor whiteColor]];
        [button setTitle:[buttonArray objectAtIndex:i-1] forState:UIControlStateNormal];
        [scollView addSubview:button];
    }
}

/*
-(void)initFirstButton
{
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    firstBt.backgroundColor=[UIColor colorWithRed:0.4146 green:0.7832 blue:0.9761 alpha:1.0];
    [firstBt setTitle:@"考研" forState:UIControlStateNormal];
    [scollView addSubview:firstBt];
    [firstBt addTarget:self action:@selector(redeView:) forControlEvents:UIControlEventTouchUpInside];
    
    [firstImgView setFrame:CGRectMake(-150, 600, 130, 40)];
    UILabel *lable = [[UILabel alloc] init];
    lable.text = @"考研介绍";
    lable.textColor = [UIColor whiteColor];
    [lable setFrame:CGRectMake(0, 0, 90, 30)];
    firstImgView = [[UIImageView alloc] init];
    [firstImgView addSubview:lable];
    
    [firstImgView setBackgroundColor:[UIColor colorWithRed:0.4146 green:0.7832 blue:0.9761 alpha:1.0]];
    [scollView addSubview:firstImgView];
}
*/

-(void)FirstBtAnimation:(CGFloat)currentOffset withTag:(NSInteger)buttonTag
{
    //NSLog(@"%f",currentOffset-600);
    CGFloat cuttentoffset = currentOffset-600.f;
    //CGFloat buttonTagX = (buttonTag-1)*100+100;
    CGFloat buttonTagfolat = (buttonTag-1)*100+150;
    NSLog(@"(buttonTag-1)*100+150=======%ld",(buttonTag-1)*100+150);
    NSLog(@"buttonTag-------->%ld",(long)buttonTag);
    NSLog(@"cuttentoffset------%f",cuttentoffset);
    if ((buttonTag-1)*100+150>=250) {
        if (buttonTagfolat-50<cuttentoffset&&cuttentoffset<buttonTagfolat)
        {
            UIButton *myButton1 = (UIButton *)[self.view viewWithTag:buttonTag-1];
            if (myButton1.frame.size.width != BUTTON_WIDTH)
            {
                UIView *myView = (UIView *)[self.view viewWithTag:(buttonTag-1)*100];
                if ((buttonTag-1)%2==1) {
                    [self animationBig:myButton1 withView:myView];
                }else{
                    [self rightAnimationBig:myButton1 withView:myView];
                }
            }
            
            
        }else if (buttonTagfolat<cuttentoffset&&cuttentoffset<buttonTagfolat+50) {
            UIButton *myButton1 = (UIButton *)[self.view viewWithTag:buttonTag];
            if (myButton1.frame.size.width == BUTTON_WIDTH) {
                UIView *myView = (UIView *)[self.view viewWithTag:(buttonTag)*100];
                if ((buttonTag-1)%2==1) {
                    [self rightAnimationSmall:myButton1 withView:myView];
                    
                }else{
                    [self animationSmall:myButton1 withView:myView];
                }
                
            }
            
        }
    }
    else if (150<cuttentoffset&&cuttentoffset<200)
    {
        UIButton *myButton1 = (UIButton *)[self.view viewWithTag:1];
        if (myButton1.frame.size.width == BUTTON_WIDTH) {
            UIView *myView = (UIView *)[self.view viewWithTag:100];
            [self animationSmall:myButton1 withView:myView];
        }
    }
    /*
    else if (300<cuttentoffset&&cuttentoffset<350) {
        UIButton *myButton1 = (UIButton *)[self.view viewWithTag:buttonTag-1];
        if (myButton1.frame.size.width != BUTTON_WIDTH)
        {
            UIView *myView = (UIView *)[self.view viewWithTag:(buttonTag-1)*100];
            [self rightAnimationBig:myButton1 withView:myView];
        }
        
    }else if (250<cuttentoffset&&cuttentoffset<300)
    {
        UIButton *myButton1 = (UIButton *)[self.view viewWithTag:buttonTag];
        if (myButton1.frame.size.width == BUTTON_WIDTH)
        {
            UIView *myView = (UIView *)[self.view viewWithTag:buttonTag*100];
            [self rightAnimationSmall:myButton1 withView:myView];
        }
    }
    
    else if (400<cuttentoffset&&cuttentoffset<450)
    {
        UIButton *myButton1 = (UIButton *)[self.view viewWithTag:buttonTag-1];
        if (myButton1.frame.size.width != BUTTON_WIDTH)
        {
            UIView *myView = (UIView *)[self.view viewWithTag:(buttonTag-1)*100];
            [self animationBig:myButton1 withView:myView];
        }
    }else if (350<cuttentoffset&&cuttentoffset<400)
    {
        UIButton *myButton1 = (UIButton *)[self.view viewWithTag:buttonTag];
        if (myButton1.frame.size.width == BUTTON_WIDTH) {
            UIView *myView = (UIView *)[self.view viewWithTag:buttonTag*100];
            [self animationSmall:myButton1 withView:myView];
        }
    }
    else if (500<cuttentoffset&&cuttentoffset<550) {
        UIButton *myButton1 = (UIButton *)[self.view viewWithTag:buttonTag-1];
        if (myButton1.frame.size.width != BUTTON_WIDTH)
        {
            UIView *myView = (UIView *)[self.view viewWithTag:(buttonTag-1)*100];
            [self rightAnimationBig:myButton1 withView:myView];
        }
    }else if (450<cuttentoffset&&cuttentoffset<500)
    {
        UIButton *myButton1 = (UIButton *)[self.view viewWithTag:buttonTag];
        if (myButton1.frame.size.width == BUTTON_WIDTH)
        {
            UIView *myView = (UIView *)[self.view viewWithTag:buttonTag*100];
            [self rightAnimationSmall:myButton1 withView:myView];
        }
    }
     */
}

-(void)animationBig:(UIButton *)current withView:(UIView*)lableView
{
    firstFrame = 1;
    CGPoint lableOrgin = lableView.frame.origin;
    //CGSize size = labelView.frame.size;
    CGPoint btOrgin = current.frame.origin;
    [lableView setFrame:CGRectMake(self.view.frame.size.width,lableOrgin.y, LABLEVIEW_WIDTH, LABLEVIEW_HEIGHT)];
    CABasicAnimation *animation = [Animation moveX:1.0 X:@(-120)];
    // 添加动画
    [lableView.layer addAnimation:animation forKey:@"move-layer"];
    [current setFrame:CGRectMake(btOrgin.x, btOrgin.y, BUTTON_WIDTH, BUTTON_WIDTH)];
    CABasicAnimation *animations = [Animation scale:@1.0 orgin:@0.5 durTimes:0.3 Rep:0];
    [current.layer addAnimation:animations forKey:@"scale"];
}

-(void)animationSmall:(UIButton *)current withView:(UIView*)lableView
{
    firstFrame = 0;
    CGPoint lableOrgin = lableView.frame.origin;
    //CGSize size = labelView.frame.size;
    CGPoint btOrgin = current.frame.origin;
    [lableView setFrame:CGRectMake(200,lableOrgin.y, LABLEVIEW_WIDTH, LABLEVIEW_HEIGHT)];
    CABasicAnimation *animation = [Animation moveX:1.0 X:@250];
    // 添加动画
    [lableView.layer addAnimation:animation forKey:@"move-layer"];
    [current setFrame:CGRectMake(btOrgin.x, btOrgin.y, BUTTON_WIDTH/2, BUTTON_WIDTH/2)];
    CABasicAnimation *animations = [Animation scale:@1.0 orgin:@2.0 durTimes:0.3 Rep:0];
    
    [current.layer addAnimation:animations forKey:@"scale"];
}

-(void)rightAnimationBig:(UIButton *)current withView:(UIView*)lableView
{
    secondeFrame = 1;
    CGPoint lableOrgin = lableView.frame.origin;
    //CGSize size = labelView.frame.size;
    CGPoint btOrgin = current.frame.origin;
    [lableView setFrame:CGRectMake(-120,lableOrgin.y, LABLEVIEW_WIDTH, LABLEVIEW_HEIGHT)];
    CABasicAnimation *animation = [Animation moveX:1.0 X:@(150)];
    // 添加动画
    [lableView.layer addAnimation:animation forKey:@"move-layer"];
    [current setFrame:CGRectMake(btOrgin.x, btOrgin.y, BUTTON_WIDTH, BUTTON_WIDTH)];
    CABasicAnimation *animations = [Animation scale:@1.0 orgin:@0.5 durTimes:0.3 Rep:0];
    [current.layer addAnimation:animations forKey:@"scale"];
}

-(void)rightAnimationSmall:(UIButton *)current withView:(UIView*)lableView
{
    secondeFrame = 0;
    CGPoint lableOrgin = lableView.frame.origin;
    //CGSize size = labelView.frame.size;
    CGPoint btOrgin = current.frame.origin;
    [lableView setFrame:CGRectMake(30,lableOrgin.y, LABLEVIEW_WIDTH, LABLEVIEW_HEIGHT)];
    CABasicAnimation *animation = [Animation moveX:1.0 X:@(-320)];
    // 添加动画
    [lableView.layer addAnimation:animation forKey:@"move-layer"];
    [current setFrame:CGRectMake(btOrgin.x, btOrgin.y, BUTTON_WIDTH/2, BUTTON_WIDTH/2)];
    CABasicAnimation *animations = [Animation scale:@1.0 orgin:@2.0 durTimes:0.3 Rep:0];
    
    [current.layer addAnimation:animations forKey:@"scale"];
}


//只要view有滚动（不管是拖、拉、放大、缩小等导致）都会执行此函数
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    CGPoint offset = scrollView.contentOffset;
    CGRect bounds = scrollView.bounds;
    //CGSize size = scrollView.contentSize;
    UIEdgeInsets inset = scrollView.contentInset;
    CGFloat currentOffset = offset.y + bounds.size.height - inset.bottom;
    NSInteger buttonTag = currentOffset/100 - 6;
    //CGFloat maximumOffset = size.height;
    NSLog(@"%f",currentOffset);
    [self FirstBtAnimation:currentOffset withTag:buttonTag];
    
}
//将要开始拖拽，手指已经放在view上并准备拖动的那一刻
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    
}
//将要结束拖拽，手指已拖动过view并准备离开手指的那一刻，注意：当属性pagingEnabled为YES时，此函数不被调用
-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    
    //NSLog(@"%f",targetContentOffset);
}
//已经结束拖拽，手指刚离开view的那一刻
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    
}
//view将要开始减速，view滑动之后有惯性
-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    
}
//view已经停止滚动
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
}
//view的缩放
-(void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    
}
//有动画时调用
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    
}

-(void)redeView:(UIButton *)sender
{
    NSLog(@"ddd");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
