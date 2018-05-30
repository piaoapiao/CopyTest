//
//  ViewController.m
//  CopyTest
//
//  Created by guodong on 2018/5/29.
//  Copyright © 2018年 guodong. All rights reserved.
//

#import "ViewController.h"

#import "Person.h"

@interface ViewController ()
@property (nonatomic, copy) NSArray        *array;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self copyTest];
    
    [self testArray];
    // Do any additional setup after loading the view, typically from a nib.
}


//Note：对于系统提供的所有既支持NSCopying，又支持NSMutableCopying的类。
//copy方法，得到的是不可变对象，不管以前的是可变还是不可变。
//mutableCopy方法，得到的是可变对象，不管以前的是可变还是不可变。

-(void)copyTest
{
    Person *p= [[Person alloc] init];
    
    Person *p2 = [p copy];
    
    Person *p3 = [p mutableCopy];
    
    NSLog(@"p1:%@  p2:%@  p3:%@",p,p2,p3);
    
    NSMutableString *str = [[NSMutableString alloc] initWithString:@"test"];
    
    NSMutableDictionary *testDict = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"hello", @"test",str,@"key2",nil];
    
    NSMutableDictionary *destDict = [testDict mutableCopy];   //copy 会奔溃，mutablecopy 不会
    
     [destDict setObject:@"what" forKey:@"test2"];
    
    NSLog(@"testDict:%@ destDict:%@ ",testDict,destDict);
    
    NSLog(@"testDict:%p destDict:%p ",testDict,destDict);
    
    NSLog(@"testDict key2:%p ",[testDict objectForKey:@"key2"]);
    
    NSLog(@"destDict key2:%p ",[destDict objectForKey:@"key2"]);
    
// [testDict setObject:@"test2" forKey:@"key2"];
    
    [str stringByAppendingString:@"pad"];
    
    
    NSLog(@"testDict key2:%p ",[testDict objectForKey:@"key2"]);
    
    NSLog(@"destDict key2:%p ",[destDict objectForKey:@"key2"]);

    
    NSLog(@"testDict key2:%@ ",[testDict objectForKey:@"key2"]);
    
    NSLog(@"destDict key2:%@ ",[destDict objectForKey:@"key2"]);
    
    
    NSString *mystr = [NSString stringWithFormat:@"123"];
    
    NSString *copyStr = [mystr mutableCopy];
    
    NSLog(@"copyStr:%@",copyStr);
    
    NSString *copy2Str = [copyStr stringByAppendingString:@"4"];
    
//    [copyStr setst]
    
    
    NSLog(@"copyStr:%p",copyStr);
//    NSMutableString *d;
    [(NSMutableString *)copyStr setString:@"22222"];
    
    NSLog(@"copyStr:%p",copyStr);
    
    [(NSMutableString *)copyStr appendString:@"344"];
    
    NSLog(@"copyStr:%p",copyStr);
    
    NSLog(@"copyStr:%@",copyStr);
    
    NSLog(@"copy2Str:%@",copy2Str);
    
//    NSMutableString *mStr;
//    [mStr setString:@]
    
    NSLog(@"copy2Str:%@",copy2Str);

    
    
//    NSMutableArray *mutableArray = [NSMutableArray array];
//    
//    [mutableArray addObject:@"1"];
//    
//    self.array = [NSArray array];
//    self.array = mutableArray;
//    
//    NSLog(@"array---%@",self.array);
//    
//    [mutableArray addObject:@"2"];
//    
//    NSLog(@"array---%@",self.array);
}

-(void)testArray
{
    NSArray *array = [NSArray arrayWithObjects:@"1",@"2",@"3", nil];
    
    NSArray *copyArray = [array copy];
    
    NSArray *copyMArray = [array mutableCopy];
    
    NSMutableArray *mArray = (NSMutableArray *)copyMArray;
    
    [mArray removeObjectAtIndex:0];
    
    NSLog(@"copyMArray:%@",copyMArray);
    
    NSLog(@"mArray:%@",mArray);
    
    
    Person *pp = [[Person alloc] init];
    pp.name = @"wag";
    
    
    NSMutableArray *mArray2 =  [NSMutableArray arrayWithObjects:@"1",@"2",@"3",pp, nil];
    NSArray *copyArray2 = [mArray2 copy];
    
    NSMutableArray *copyMArray2 = [mArray2 mutableCopy];
    
    [copyMArray2 removeObjectAtIndex:2];
    
    NSLog(@"mArray2:%@",mArray2);
    NSLog(@"copyMArray2:%@",copyMArray2);
    
    NSLog(@"pp:%p",pp);
    
    NSLog(@"pp:%@",pp);
    
    NSLog(@"copyArray2 pp:%p",[copyArray2 objectAtIndex:3]);
    
    NSLog(@"copyMArray2 pp:%p",[copyMArray2 objectAtIndex:2]);
    

    
    pp.name = @"modifi";
    
    Person *pp3 = [copyArray2 objectAtIndex:3];
    
    Person *pp2 = [copyMArray2 objectAtIndex:2];
    
    NSLog(@"copyArray2 pp:%@",pp3.name);
    
    NSLog(@"copyMArray2 pp:%@",pp2.name);
    
    NSLog(@"copyMArray2 pp:%@",pp2.name);
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
