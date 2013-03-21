# DMBlockUIKit

simple wrapper for UIAlertView & UIActionSheet to support block based call back.


I love [Blockit](https://github.com/pandamonia/BlocksKit), because it show me the power of block.

I hate Blockit, because:

- it crash my app
- it isn't compitable with ios4.3
- it use some magic which I can't understand soon.

So I implement the block based alertView & actionSheet in a simple way. the code is short and clear; even if there is something wrong, the defect should be easy to fix.


##usage

DMUIActionSheet

```
   UIActionSheet *sheet = [UIActionSheet DMUIActionSheetWithTitle:@"title"];
    [sheet DMUIAddButtonWithTitle:@"button1" action:^{
        [self log:@"button1"];
    }];
    [sheet DMUIAddButtonWithTitle:@"button2" action:^{
        NSLog(@"button2");
    }];
    [sheet DMUIAddButtonWithTitle:@"button3" action:^{
        NSLog(@"button3");
    }];
    [sheet DMUIAddButtonWithTitle:@"button4"];
    [sheet DMUIAddDestructiveButtonWithTitle:@"cancel" action:^{
        NSLog(@"cancel");
    }];
   [sheet showInView:self.view];
```

DMUIAlertView:

```
    UIAlertView *alert = [UIAlertView DMUIAlertViewWithTitle:@"title" message:@"message"];
    [alert DMUIAddButtonWithTitle:@"button1" action:^{
        NSLog(@"button1");
    }];
    
    [alert DMUIAddButtonWithTitle:@"button2"];
    [alert show];
```

