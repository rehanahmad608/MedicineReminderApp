import 'package:flutter/material.dart';

class RDBottomBar extends StatefulWidget {
  final String label;

  const RDBottomBar({Key? key, required this.label}) : super(key: key);

  @override
  _RDBottomBarState createState() => _RDBottomBarState();
}

class _RDBottomBarState extends State<RDBottomBar> {
  @override
  Widget build(BuildContext context) {
    void navigateToHome() {
      // Navigator.pushReplacement(
      //   context,
      //   PageRouteBuilder(
      //     pageBuilder: (context, animation1, animation2) => const HomeScreen(),
      //     transitionDuration: Duration.zero,
      //     reverseTransitionDuration: Duration.zero,
      //   ),
      // );
    }

    void navigateToInbox() {
      // Navigator.pushReplacement(
      //   context,
      //   PageRouteBuilder(
      //     pageBuilder: (context, animation1, animation2) => const Inbox(),
      //     transitionDuration: Duration.zero,
      //     reverseTransitionDuration: Duration.zero,
      //   ),
      // );
    }

    void navigateToOrders() {
      // print('navigating to order');
      // final state = BlocProvider.of<UserBloc>(context).state;
      // print(state);
      // if (state is UserLoggedIn) {
      //   BlocProvider.of<OrderBloc>(context)
      //       .add(GetCustomerOrders(uid: state.user.id));
      // }
      // BlocListener<OrderBloc, OrderState>(listener: (context, orderState) {
      //   print(orderState);
      //   if (orderState is GotCustomerOrders) {
      //
      //   }
      // });

      // Navigator.pushReplacement(
      //   context,
      //   PageRouteBuilder(
      //     pageBuilder: (context, animation1, animation2) =>
      //         const ActiveOrderScreen(),
      //     transitionDuration: Duration.zero,
      //     reverseTransitionDuration: Duration.zero,
      //   ),
      // );
    }

    void navigateToNotify() {
      // Navigator.pushReplacement(
      //     context,
      //     PageRouteBuilder(
      //       pageBuilder: (context, animation1, animation2) =>
      //           const NotificationScreens(
      //         mobileNum: '',
      //       ),
      //       transitionDuration: Duration.zero,
      //       reverseTransitionDuration: Duration.zero,
      //     ));
    }

    navigateToMenu() {
      // Navigator.pushReplacement(
      //     context,
      //     PageRouteBuilder(
      //       pageBuilder: (context, animation1, animation2) => const AppDrawer(),
      //       transitionDuration: Duration.zero,
      //       reverseTransitionDuration: Duration.zero,
      //     ));

      // AppDrawer();
    }

    Widget iconForBottomBar(String label, String icon, bool isSelected,
        double width, double height) {
      return Container(
          width:
              // isSelected ? 24 :
              width,
          height:
              // isSelected ? 35 :
              height,
          decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage(icon), fit: BoxFit.contain),
          ));
    }

    String labelByValue(int intValue) {
      if (intValue == 0) {
        return 'Home';
      } else if (intValue == 1) {
        return 'Inbox';
      } else if (intValue == 2) {
        return 'Orders';
      } else if (intValue == 3) {
        return 'Notification';
      } else if (intValue == 4) {
        return 'Menu';
      } else {
        return " ";
      }
    }

    int indexByLabel(String label) {
      if (label == 'Home') {
        return 0;
      } else if (label == 'Inbox') {
        return 1;
      } else if (label == 'Orders') {
        return 2;
      } else if (label == 'Notification') {
        return 3;
      } else if (label == 'Menu') {
        return 4;
      } else {
        return -1;
      }
    }

    return BottomNavigationBar(
        backgroundColor: Colors.white,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: iconForBottomBar(
                  widget.label,
                  widget.label == 'Home'
                      ? 'assets/icons/bottomBar/homeF.png'
                      : 'assets/icons/bottomBar/homeIcon.png',
                  widget.label == 'Home' ? true : false,
                  19,
                  28),
              label: 'Home',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: iconForBottomBar(
                  widget.label,
                  widget.label == 'Inbox'
                      ? 'assets/icons/bottomBar/inboxF.png'
                      : 'assets/icons/bottomBar/inboxIcon.png',
                  widget.label == 'Inbox' ? true : false,
                  22,
                  28),
              label: 'Inbox',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
            icon: iconForBottomBar(
                widget.label,
                widget.label == 'Orders'
                    ? 'assets/icons/bottomBar/ordersF.png'
                    : 'assets/icons/bottomBar/ordersIcon.png',
                widget.label == 'Orders' ? true : false,
                19,
                28),
            label: 'Orders',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: iconForBottomBar(
                widget.label,
                widget.label == 'Notification'
                    ? 'assets/icons/bottomBar/notifyF.png'
                    : 'assets/icons/bottomBar/notifyIcon.png',
                widget.label == 'Notification' ? true : false,
                19,
                28),
            label: 'Notification',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: iconForBottomBar(
                widget.label,
                widget.label == 'Menu'
                    ? 'assets/icons/bottomBar/menuF.png'
                    : 'assets/icons/bottomBar/menuIcon.png',
                widget.label == 'Menu' ? true : false,
                19,
                28),
            label: 'Menu',
            backgroundColor: Colors.white,
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: indexByLabel(widget.label),
        selectedItemColor: Colors.blue.shade800,
        unselectedItemColor: Colors.blue.shade800,
        showUnselectedLabels: true,
        unselectedFontSize: 14,
        selectedFontSize: 15,
        iconSize: 30,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
        selectedIconTheme: const IconThemeData(size: 33),
        onTap: (int value) {
          if (indexByLabel(widget.label) != value) {
            String newLabel = labelByValue(value);

            if (newLabel == 'Home') {
              navigateToHome();
            } else if (newLabel == 'Inbox') {
              navigateToInbox();
            } else if (newLabel == 'Orders') {
              navigateToOrders();
            } else if (newLabel == 'Notification') {
              navigateToNotify();
            } else if (newLabel == 'Menu') {
              navigateToMenu();
            }
          }
          // setState(() {
          //   _index = value;
          // });
        },
        elevation: 25);
  }
}
