import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:AiRi/utils/my_navigator.dart';
import '../category/category_page.dart';
import '../home/home_page.dart';
import '../manage/manage_page.dart';
import '../order/order_page.dart';
import 'components/my_bottom_navigation_bar.dart';
import 'store/main_provider.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    hideScreen();
  }

  ///hide your splash screen
  Future<void> hideScreen() async {
    Future.delayed(Duration(milliseconds: 750), () {});
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final mainState = Provider.of<MainProvider>(context, listen: false);
    // 保存 ctx
    MyNavigator.ctx = context;

    /// According to -the height of iphone X, the height is removed from the top and bottom
    // return ScreenUtilInit(
    //   designSize: Size(375, 812 - 44 - 34),
    //   builder: () => Scaffold(
    //     backgroundColor: Color(0xfffefefe),
    //     bottomNavigationBar: MyBottomNavigationBar(onTap: (index) {
    //       mainState.tabBarPageController.jumpToPage(index);
    //       setState(() {
    //         mainState.setTabBarSelectedIndex = index;
    //       });

    //     }),
    //     body: PageView(
    //       controller: mainState.tabBarPageController,
    //       children: <Widget>[HomePage(), CategoryPage(), OrderPage(), ManagePage()],
    //       physics: NeverScrollableScrollPhysics(),
    //     ),
    //   ),
    // );

    return Scaffold(
      backgroundColor: Color(0xfffefefe),
      bottomNavigationBar: MyBottomNavigationBar(onTap: (index) {
        mainState.tabBarPageController.jumpToPage(index);
        setState(() {
          mainState.setTabBarSelectedIndex = index;
        });
      }),
      body: PageView(
        controller: mainState.tabBarPageController,
        children: <Widget>[
          HomePage(),
          CategoryPage(),
          OrderPage(),
          ManagePage()
        ],
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
