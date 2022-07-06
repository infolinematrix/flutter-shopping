import 'package:AiRi/components/components.dart';
import 'package:AiRi/model/goods.dart';
import 'package:AiRi/pages/manage/store/manage_page_provider.dart';
import 'package:AiRi/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:icofont_flutter/icofont_flutter.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ManagePage extends StatelessWidget {
  final String? supplierId;
  const ManagePage({Key? key, this.supplierId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ManagePageProvider(),
      child: Scaffold(
        body: ManageContainer(),
        backgroundColor: AppColors.supplierColor1,
      ),
    );
  }
}

class ManageContainer extends StatelessWidget {
  const ManageContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<ManagePageProvider>(context);
    return Container(
      color: AppColors.primaryBackground,
      child: SmartRefresher(
        controller: state.refreshController,
        enablePullUp: true,
        enablePullDown: false,
        onLoading: state.loadData,
        footer: MyCustomFooter(),
        child: CustomScrollView(
          slivers: <Widget>[
                SliverToBoxAdapter(
                  child: Stack(
                    children: <Widget>[
                      _buildTop(context),
                      _buildFunc(context),
                      // _buildImageRecommend(context),
                      _buildMoreFunc(context),
                    ],
                  ),
                ),
              ] +
              _hotCommodity(state.hotList),
        ),
      ),
    );
  }

  /// 上方
  Widget _buildTop(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: 20, top: MediaQuery.of(context).padding.top + 20),
      height: 240,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.buttonLine1, AppColors.buttonLine2],
        ),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 60,
            child: Row(
              children: <Widget>[
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    // borderRadius: BorderRadius.circular(50),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                      // bottomRight: Radius.circular(50)
                    ),
                  ),
                  // child: Image.network(
                  //   'https://yanxuan.nosdn.127.net/4cb504b640d917efcccf5fe6c73f6428.png',
                  //   height: 60,
                  //   width: 60,
                  // ),
                  child: Icon(IcoFontIcons.businessMan, size: 40),
                ),
                Container(
                  padding: EdgeInsets.only(top: 16, left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Rajdhani Garments',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      Divider(height: 1),
                      Text('Siliguri ~ 9832893116',
                          style: TextStyle(color: Colors.black, fontSize: 12)),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            width: 120,
            height: 70,
            margin: EdgeInsets.only(right: 8),
            child: Center(
              child: Container(
                height: 30,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: AppColors.splashColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Icon(Iconfont.redpacket_fil,
                        color: AppColors.buyNow2, size: 18),
                    Text(
                      'daily check-in',
                      style:
                          TextStyle(color: AppColors.primaryText, fontSize: 12),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  /// 我的功能
  Widget _buildFunc(BuildContext context) {
    return Container(
      height: 130,
      margin: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 100, left: 10, right: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: LeftTitle(
              title: 'My function',
            ),
          ),
          MyDivider(),
          Container(
            padding: EdgeInsets.only(left: 15, right: 15, top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _buildIconItem(IcoFontIcons.brandIcofont, 'Coupon',
                    Color(0xFF4A4A4A), AppColors.primaryText),
                _buildIconItem(IcoFontIcons.card, 'Wallet', Color(0xFF4A4A4A),
                    AppColors.primaryText),
                _buildIconItem(IcoFontIcons.saleDiscount, 'Offers',
                    Color(0xFF4A4A4A), AppColors.primaryText),
                _buildIconItem(Iconfont.question, 'Help', Color(0xFF4A4A4A),
                    AppColors.primaryText),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 图片推荐
  // Widget _buildImageRecommend(BuildContext context) {
  //   return Container(
  //     height: 80,
  //     width: MediaQuery.of(context).size.width - 20,
  //     margin: EdgeInsets.only(
  //         top: MediaQuery.of(context).padding.top + 230, left: 10, right: 10),
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.circular(8),
  //     ),
  //     child: ClipRRect(
  //       borderRadius: BorderRadius.circular(8),
  //       child: Image.network(
  //         'https://gw.alicdn.com/imgextra/i3/43/O1CN01ZPUEId1CBjWPLKzea_!!43-0-lubanu.jpg',
  //         fit: BoxFit.fitWidth,
  //       ),
  //     ),
  //   );
  // }

  /// 更多工具
  Widget _buildMoreFunc(BuildContext context) {
    Color iconColor = Color(0xFF505257);
    return Container(
      height: 200,
      margin: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 240, left: 10, right: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 10),
            child: LeftTitle(
              title: 'Tools',
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 15, right: 15, top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _buildIconItem(IcoFontIcons.numbered, 'Orders', iconColor,
                    AppColors.primaryText),
                _buildIconItem(IcoFontIcons.basket, 'My Cart', iconColor,
                    AppColors.primaryText),
                _buildIconItem(IcoFontIcons.list, 'Saved Items', iconColor,
                    AppColors.primaryText),
                _buildIconItem(IcoFontIcons.love, 'Wishlist', iconColor,
                    AppColors.primaryText),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 15, right: 15, top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _buildIconItem(IcoFontIcons.supportFaq, 'FAQs', iconColor,
                    AppColors.primaryText),
                _buildIconItem(IcoFontIcons.rupeePlus, 'Bank Detail', iconColor,
                    AppColors.primaryText),
                _buildIconItem(IcoFontIcons.uiMap, 'Shipping Address',
                    iconColor, AppColors.primaryText),
                _buildIconItem(Iconfont.shuang11, 'History', iconColor,
                    AppColors.primaryText),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 热销商品区域
  List<Widget> _hotCommodity(List<GoodsList> hotList) {
    return [
      SliverToBoxAdapter(
        child: Container(
          height: 44,
          padding: EdgeInsets.only(left: 15),
          decoration: BoxDecoration(
            color: AppColors.primaryBackground,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5),
            ),
          ),
          child: LeftTitle(
            tipColor: AppColors.primaryColor,
            title: 'Recommendation',
          ),
        ),
      ),
      SliverToBoxAdapter(
        child: Container(
          padding: EdgeInsets.only(left: 15, right: 15),
          child: Wrap(
            spacing: 8.0, // 主轴(水平)方向间距
            runSpacing: 10.0, // 纵轴（垂直）方向间距
            alignment: WrapAlignment.start, //沿主轴方向居中
            direction: Axis.horizontal,
            children: hotList.map<Widget>(
              (item) {
                return CommdityItemHome(goodData: item);
              },
            ).toList(),
          ),
        ),
      ),
      SliverToBoxAdapter(
        child: Container(
          margin: EdgeInsets.only(left: 15, right: 15),
          height: 15,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(5),
              bottomRight: Radius.circular(5),
            ),
          ),
          child: null,
        ),
      ),
    ];
  }

  /// 每个图标
  Widget _buildIconItem(
      IconData iconData, String title, Color iconColor, Color textColor) {
    return Column(
      children: <Widget>[
        Icon(
          iconData,
          color: iconColor,
          size: 28,
        ),
        SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(color: textColor, fontSize: 12),
        )
      ],
    );
  }
}
