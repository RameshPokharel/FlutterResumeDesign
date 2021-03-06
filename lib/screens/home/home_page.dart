import 'package:flutter/material.dart';
import 'package:flutter_app_resume/screens/home/cubit/home_cubit.dart';
import 'package:flutter_app_resume/screens/home/specialization/special_skills.dart';
import 'package:flutter_app_resume/screens/home/specialization/specialization.dart';
import 'package:flutter_app_resume/repository/Repository.dart';
import 'package:flutter_app_resume/screens/home/top/top_section.dart';
import 'package:flutter_app_resume/screens/home/specialization/qualification.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app_resume/screens/contact/project_in_mind.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return BlocProvider(
      create: (_) => HomeCubit(repository: context.read<Repository>())
        ..getUserInformation(),
      child: CustomScrollView(
        controller: ScrollController(),
        slivers: [
          SliverToBoxAdapter(
            child: TopSection(),
          ),
          SliverToBoxAdapter(child: Specialization()),
          SliverToBoxAdapter(
              child: Container(
                  margin: EdgeInsets.only(
                    top: screenSize.width * 0.01,
                  ),
                  child: SpecialSkills())),
          SliverToBoxAdapter(
              child: Container(
                  margin: EdgeInsets.only(
                    top: screenSize.width * 0.08,
                  ),
                  child: Qualification())),
          SliverToBoxAdapter(
              child: Container(
                  margin: EdgeInsets.only(
                    top: screenSize.width * 0.08,
                    bottom: screenSize.height * 0.08,

                  ),
                  child: ProjectMind())),
        ],
      ),
    );
  }
}
