//
//  HomeController.m
//  CocoaUIDemo
//
//  Created by ideawu on 4/16/15.
//  Copyright (c) 2015 ideawu. All rights reserved.
//

#import "HomeController.h"
#import "LoginController.h"
#import "BuyController.h"
#import "ThreeColumnController.h"
#import "ITableController.h"
#import "ITableXmlController.h"
#import "ITableAutoHeightController.h"

@interface HomeController ()

@end

@implementation HomeController

- (void)add_btn:(NSString *)text{
	IButton *btn = [IButton buttonWithText:text];
	[btn.style set:@"margin-bottom: 0; width: 100%; height: 40; background: #fff; border-bottom: 1px solid #ddd;"];
	//[btn.button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
	[self addIViewRow:btn];
	
	__weak typeof(self) me = self;
	[btn addEvent:IEventHighlight|IEventUnhighlight|IEventClick handler:^(IEventType event, IView *view) {
		NSLog(@"%d", event);
		if(event == IEventHighlight){
			[view.style set:@"background: #ffe;"];
		}
		if(event == IEventUnhighlight){
			[view.style set:@"background: #fff;"];
		}
		if(event == IEventClick){
			IButton *ib = (IButton *)view;
			[me click:ib.button];
		}
	}];
}

- (void)viewDidLoad {
    [super viewDidLoad];
	self.navigationItem.title = @"Home";
	self.navigationController.navigationBar.translucent = NO;
	self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];

	[self add_btn:@"Login"];
	[self add_btn:@"Buy"];
	[self add_btn:@"Three Column"];
	[self add_btn:@"ITable"];
	[self add_btn:@"ITableXml"];
	[self add_btn:@"ITableAutoHeight"];
}

- (void)click:(UIButton *)btn{
	NSString *text = btn.titleLabel.text;
	NSLog(@"click %@", text);
	UIViewController *controller;
	
	if([text isEqualToString:@"Login"]){
		controller = [[LoginController alloc] init];
	}
	if([text isEqualToString:@"Buy"]){
		controller = [[BuyController alloc] init];
	}
	if([text isEqualToString:@"Three Column"]){
		controller = [[ThreeColumnController alloc] init];
	}
	if([text isEqualToString:@"ITable"]){
		controller = [[ITableController alloc] init];
	}
	if([text isEqualToString:@"ITableXml"]){
		controller = [[ITableXmlController alloc] init];
	}
	if([text isEqualToString:@"ITableAutoHeight"]){
		controller = [[ITableAutoHeightController alloc] init];
	}
	[self.navigationController pushViewController:controller animated:YES];
}

@end
