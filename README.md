# **Animation Application**


### This is a simple application to practice building animation 

# **Main Points**
* InitState
* TickerProvider
* Tweens & Curves
* GestureDectector 
* Positioned Widget
* Adding animated controller
* Toggling Animation

 ***
initState function
```dart
  initState() {
    super.initState();

    boxController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    boxAnimation = Tween(
      begin: pi * 0.6,
      end: pi * 0.65,
    ).animate(
      CurvedAnimation(
        parent: boxController,
        curve: Curves.easeInOut,
      ),
    );
    boxAnimation.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          boxController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          boxController.forward();
        }
      },
    );
    boxController.forward();

    catController = AnimationController(
      duration: const Duration(microseconds: 200),
      vsync: this,
    );
    catAnimation = Tween(begin: -35.0, end: -100.0).animate(
      CurvedAnimation(
        parent: catController,
        curve: Curves.easeIn,
      ),
    );
  }
```
***
On tap function
```dart
onTap() {
    boxController.stop();
    if (catController.status == AnimationStatus.completed) {
      boxController.forward();
      catController.reverse();
    } else if (catController.status == AnimationStatus.dismissed) {
      boxController.stop();
      catController.forward();
    }
  }
```
***
 Build Widget
```dart
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation!'),
      ),
      body: GestureDetector(
        onTap: onTap,
        child: Center(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              buildCatAnimation(),
              buildBox(),
              buildLeftFlap(),
              buildRightFlap(),
            ],
          ),
        ),
      ),
    );
  }
```
***
 Build Cat Animation Widget
```dart
Widget buildCatAnimation() {
    return AnimatedBuilder(
      animation: catAnimation,
      builder: (context, child) {
        return Positioned(
          top: catAnimation.value,
          right: 0.0,
          left: 0.0,
          child: child!,
        );
      },
      child: const Cat(),
    );
  }
```
***
Build Box Widget 
```dart
 Widget buildBox() {
    return Container(
      height: 200.0,
      width: 200.0,
      color: Colors.brown,
    );
  }
```
***
Build Left Flap Widget
```dart
Widget buildLeftFlap() {
    return Positioned(
      left: 3.0,
      child: AnimatedBuilder(
        animation: boxAnimation,
        child: Container(
          height: 10,
          width: 125,
          color: Colors.brown,
        ),
        builder: (context, child) {
          return Transform.rotate(
            alignment: Alignment.topLeft,
            angle: boxAnimation.value,
            child: child,
          );
        },
      ),
    );
  }
```
***

Build Right Flap Widget
```dart
Widget buildRightFlap() {
    return Positioned(
      right: 3.0,
      child: AnimatedBuilder(
        animation: boxAnimation,
        child: Container(
          height: 10,
          width: 125,
          color: Colors.brown,
        ),
        builder: (context, child) {
          return Transform.rotate(
            alignment: Alignment.topRight,
            angle: -boxAnimation.value,
            child: child,
          );
        },
      ),
    );
  }
```
## when the cat inside the box the flaps wil be moving 
![img.png](img.png)
## on tap the cat move out the box and flaps stop moving
![img_1.png](img_1.png)
