import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Custom Navigation Bar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Custom NavBar'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();
  int _cIndex = 0;
  bool showExpansion = false;
  //final List<bool> _pageSelected = List.generate(4, (index) => index == 0);
  bool _isCrossVisible = false;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  void _toggleAnimation() {
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        showWidgets = true;
      });
    });
    setState(() {
      if (showWidgets) {
        showWidgets = false;
      }
      _isCrossVisible = !_isCrossVisible;
      if (_isCrossVisible) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _toggleExpansion() {
    setState(() {
      showExpansion = !showExpansion;
    });
  }

  //int _cIndex = 0;

  bool showWidgets = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.withOpacity(0.9),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _cIndex = index;
          });
        },
        children: const [
          // Content for the first navigation item
          Center(
            child: Text(
              "Content for the first item",
              style: TextStyle(
                fontSize: 30,
                color: Colors.grey,
              ),
            ),
          ),
          // Content for the second navigation item
          Center(
            child: Text(
              "Content for the second item",
              style: TextStyle(
                fontSize: 30,
                color: Colors.grey,
              ),
            ),
          ),
          // Content for the third navigation item
          Center(
            child: Text(
              "Content for the third item",
              style: TextStyle(
                fontSize: 30,
                color: Colors.grey,
              ),
            ),
          ),
          // Content for the fourth navigation item
          Center(
            child: Text(
              "Content for the fourth item",
              style: TextStyle(
                fontSize: 30,
                color: Colors.grey,
              ),
            ),
          ),
        ],
        /*
        onPageChanged: (index) {
          setState(
            () {
              _pageSelected[_cIndex] = false;
              _pageSelected[index] = true;
              _cIndex = index;
            },
          );
        },
        */
      ),

      /*
      const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),

            /*
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            */
          ],
        ),
      ),
*/

      bottomNavigationBar: Container(
        height: 100,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(60),
            topLeft: Radius.circular(60),
          ),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _cIndex,
            onTap: _incrementTab,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    //color: Colors.blue,
                  ),
                  child: Image.asset(
                    _cIndex == 3 ? 'lib/icons/sun.png' : 'lib/icons/sun.png',
                    color: Colors.grey.withOpacity(0.9),
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(right: 40),
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Stack(
                    children: [
                      Container(
                        //margin: EdgeInsets.only(right: 10.0),
                        height: 80,
                        padding: const EdgeInsets.all(10),
                        width: double.infinity,
                        child: Image.asset(
                          _cIndex == 1
                              ? 'lib/icons/apostrophe.png'
                              : 'lib/icons/apostrophe.png',
                          fit: BoxFit.cover,
                          color: Colors.grey.withOpacity(0.9),
                        ),
                      ),
                      //if (_cIndex == 1)
                      Positioned(
                        top: 3,
                        right: 3,
                        child: Container(
                          width: 10, // Adjust the size of the purple dot
                          height: 10, // Adjust the size of the purple dot
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(left: 40),
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    //color: Colors.blue,
                  ),
                  child: Image.asset(
                    _cIndex == 2
                        ? 'lib/icons/custome_line.png'
                        : 'lib/icons/custome_line.png',
                    color: Colors.grey.withOpacity(0.9),
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    //color: Colors.blue,
                  ),
                  child: Image.asset(
                    _cIndex == 3 ? 'lib/icons/copy.png' : 'lib/icons/copy.png',
                    color: Colors.grey.withOpacity(0.9),
                  ),
                ),
                label: '',
              ),
            ],
          ),
        ),
      ),
      /*
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 10,
            height: 10,
            margin: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.deepPurple,
            ),
          ),
        ],
        /*
        children: _pageSelected
            .asMap()
            .entries
            .map(
              (entry) => Container(
                width: 10,
                height: 10,
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: entry.value ? Colors.deepPurple : Colors.grey,
                ),
              ),
            )
            .toList(),
            */
      ),
      */
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Positioned(
        bottom: 80,
        //height: 100,
        //top: 10,
        //bottom: 150,
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AnimatedContainer(
              //margin: EdgeInsets.all(8.0),
              padding: const EdgeInsets.all(8.0),
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInToLinear,
              width: _isCrossVisible ? 200.0 : 0.0,
              height: _isCrossVisible ? 200.0 : 0.0,
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent,
                borderRadius: BorderRadius.circular(28.0),
              ),
              child: Container(
                margin: const EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    showWidgets
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Mood check-in",
                                style: TextStyle(color: Colors.white),
                              ),
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: Colors.deepPurple.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Center(
                                  child: Image.asset(
                                    'lib/icons/smile.png',
                                    color: Colors.white,
                                    width: 20,
                                    height: 20,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Container(),
                    showWidgets
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Voice note",
                                  style: TextStyle(color: Colors.white)),
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: Colors.deepPurple.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Center(
                                  child: Image.asset(
                                    'lib/icons/audio-waves.png',
                                    color: Colors.white,
                                    width: 30,
                                    height: 30,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Container(),
                    showWidgets
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Add photo",
                                  style: TextStyle(color: Colors.white)),
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: Colors.deepPurple.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Center(
                                  child: Image.asset(
                                    'lib/icons/photo.png',
                                    color: Colors.white,
                                    width: 20,
                                    height: 20,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Container(),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                bottom: 22,
                //left: 10,
              ),
              height: 90,
              width: 85,
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent,
                borderRadius: BorderRadius.circular(35.0),
              ),
              child: IconButton(
                icon: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: _animationController.value * 0.5 * 3.1415,
                      child: child,
                    );
                  },
                  child: Icon(
                    _isCrossVisible ? Icons.close : Icons.add,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
                onPressed: _toggleAnimation,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _incrementTab(index) {
    setState(() {
      _cIndex = index;
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInToLinear,
      );
    });
  }
}
