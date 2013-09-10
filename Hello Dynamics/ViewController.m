//
//  ViewController.m
//  Hello Dynamics
//

#import "ViewController.h"


@interface ViewController ()

@property (nonatomic, retain) UIButton* button;
@property (nonatomic, retain) UIDynamicAnimator* animator;
@property (nonatomic, retain) UIPushBehavior* pushBehavior;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGSize parentSize = self.view.frame.size;
    
    const CGFloat diameter = 100.0;
    const CGPoint origin = {(parentSize.width - diameter) / 2.0, (parentSize.height - diameter) / 2.0};
    
    // Step 1: Create a round button
    self.button = [[UIButton alloc] initWithFrame:(CGRect){origin, {diameter, diameter}}];
    [self styleButton:self.button];
    [self.button setTitle:@"Tap" forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(buttonWasTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.button];
    
    // Step 2: Create the animator
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    // Step 3: Add behaviors
    
    // Gravity
    UIGravityBehavior* gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[self.button]];
    [self.animator addBehavior:gravityBehavior];
    
    // Collisions
    //UICollisionBehavior* collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[self.button]];
    //collisionBehavior.collisionMode = UICollisionBehaviorModeBoundaries;
    //collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    
    //[self.animator addBehavior:collisionBehavior];

    // Step 4: Use the force!

    // Push
    //self.pushBehavior = [[UIPushBehavior alloc] initWithItems:@[self.button] mode:UIPushBehaviorModeInstantaneous];
    //self.pushBehavior.active = NO;
    //CGFloat magnitude = 20.0;
    //[self.pushBehavior setAngle:-M_PI_2 magnitude:magnitude];
    //self.pushBehavior.pushDirection = (CGVector){0.0, -magnitude};
        // you can also use a 2-dimensional vector to specify the push magnitude and direction
    
    //[self.animator addBehavior:self.pushBehavior];

    // Dynamic Item Properties
    //UIDynamicItemBehavior* dynamicItemBehavior = [[UIDynamicItemBehavior alloc] initWithItems:@[self.button]];
    //dynamicItemBehavior.elasticity = 0.5;
    //dynamicItemBehavior.resistance = 10.0;

    //[self.animator addBehavior:dynamicItemBehavior];
}

- (void) styleButton:(UIButton*)button
{
    button.backgroundColor = [UIColor purpleColor];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:36.0];
    button.layer.cornerRadius = floor(self.button.bounds.size.height / 2.0);
}


- (void) buttonWasTapped:(id)sender
{
    self.pushBehavior.active = YES;
}

@end
