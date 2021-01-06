import 'package:flutter/material.dart';
import 'package:flutter_app_resume/contact/contact_page.dart';
import 'package:flutter_app_resume/home/home_page.dart';
import 'package:flutter_app_resume/project/project_page.dart';
import 'package:flutter_app_resume/repository/Repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'container_cubit.dart';

class ContainerPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => ContainerPage());
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return BlocProvider(
      create: (_) => ContainerCubit(context.read<Repository>()),
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: Container(
          height: 65.0,
          width: 65.0,
          child: FittedBox(
            child: Container(
              margin: EdgeInsets.only(bottom: 8),
              child: FloatingActionButton(
                onPressed: () {},
                child: Icon(
                  Icons.contact_phone,
                  color: Colors.white,
                ),
                // elevation: 5.0,
              ),
            ),
          ),
        ),
        bottomNavigationBar: BlocBuilder<ContainerCubit, ContainerState>(
            builder: (context, ContainerState state) {
          return BottomNavigationBar(
            currentIndex: state.index,
            // this will be set when a new tab is tapped
            items: [
              BottomNavigationBarItem(
                icon: new Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: new Icon(Icons.attach_file),
                label: 'Projects',
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.question_answer_rounded), label: 'Query')
            ],
            onTap: (index) => context.read<ContainerCubit>().pageTapped(index),
          );
        }),
        body: BlocBuilder<ContainerCubit, ContainerState>(
          builder: (context, ContainerState state) {
            return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Theme.of(context).primaryColor,
                    Theme.of(context).primaryColorLight
                  ]),
                ),
                child: SafeArea(
                  child: Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: screenSize.width * 0.06),
                      child: _getWidget(context, state)),
                ));
          },
        ),
      ),
    );
  }

  Widget _getWidget(context, ContainerState state) {
    if (state is ContainerHome)
      return HomePage();
    else if (state is ContainerProject)
      return ProjectPage();
    else if (state is ContainerContact)
      return ContactPage();
    else
      return HomePage();
  }
}
