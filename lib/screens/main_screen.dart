import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:santos_as_cegas/screens/blog.dart';

import 'package:santos_as_cegas/screens/tela_principal.dart';
import 'package:santos_as_cegas/screens/agendamento.dart';
import 'package:santos_as_cegas/screens/fale_conosco.dart';
import 'package:santos_as_cegas/screens/faq.dart';
import 'package:santos_as_cegas/screens/trajetos.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController _pageController;
  int _page = 0;

  List<Widget> _childrenFunc() => [
        TelaPrincipal(controller: _pageController),
        Trajetos(),
        Agendamento(controller: _pageController),
        Faq(),
        Blog(),
        FaleConosco(),
      ];

  // final List<Widget> _children = this._childrenFunc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: _childrenFunc(),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Theme.of(context).primaryColor,
          primaryColor: Theme.of(context).colorScheme.secondary,
          textTheme: Theme.of(context).textTheme.copyWith(
                caption: TextStyle(color: Colors.grey[500]),
              ),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.black,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Feather.home,
              ),
              label: "Início",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Feather.map_pin,
              ),
              label: 'Trajeto',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Feather.calendar,
              ),
              label: 'Agendar',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Feather.help_circle,
              ),
              label: "Dúvidas",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Feather.book,
              ),
              label: "Blog",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Feather.message_square,
              ),
              label: 'Contato',
            ),
          ],
          onTap: navigationTapped,
          currentIndex: _page,
        ),
      ),
    );
  }

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }
}
