import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_chat_app/features/history/screens/chat_history_page.dart';
import 'package:mini_chat_app/features/offers/offer_screen.dart';
import 'package:mini_chat_app/features/settings/settings_screen.dart';
import 'package:mini_chat_app/features/users/screens/users_page.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            top: true,
            bottom: false,
            child: IndexedStack(
              index: state.selectedTab,
              children: const [UsersPage(), OffersScreen(), SettingsScreen()],
            ),
          ),
          bottomNavigationBar: Material(
            elevation: 8, // 👈 TOP elevation effect
            color: Colors.white,
            child: BottomNavigationBar(
              backgroundColor: Colors.white,
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.black,
              currentIndex: state.selectedTab,
              selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
              unselectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              onTap: (i) => context.read<HomeBloc>().add(ChangeTabEvent(i)),
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.chat_bubble_outline_rounded),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.sell_outlined),
                  label: 'Offers',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Settings',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
