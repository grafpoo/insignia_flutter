/*
 * Copyright 2018 John Guthrie. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

// TODO: History of quiz results (advice on weakest?)
// TODO: Settings - choice of services to use (can name groups and they show up on radio buttons - limited to 3?)

import 'package:flutter/material.dart';
import 'package:insignia_flutter/shared_lib.dart';

class UserSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _bloc = AppState.of(context).blocProvider.userBloc;
    return Stack(
      children: <Widget>[
        CustomScrollView(
          slivers: <Widget>[
            CustomSliverHeader(
              headerText: "Profile",
            ),
            SliverToBoxAdapter(
              child: UserProfileForm(),
            ),
            CustomSliverHeader(
              headerText: "My Products",
            ),
            StreamBuilder(
              stream: _bloc.user,
              initialData: ECommerceUser(userProducts: []),
              builder: (BuildContext context,
                  AsyncSnapshot<ECommerceUser> snapshot) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    var _product = snapshot.data.userProducts[index];
                    return Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom:
                                BorderSide(width: .5, color: Colors.black54),
                          ),
                        ),
                        child: Dismissible(
                          direction: DismissDirection.endToStart,
                          background: Container(color: Colors.red[300]),
                          key: Key(_product.toString()),
                          child: Container(
                            child: ListTile(
                              title: Text(_product.title),
                            ),
                          ),
                          onDismissed: (DismissDirection dir) {
                            Scaffold.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: AppColors.primary,
                                content: Text(
                                  "${_product.title} deleted.",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline
                                      .copyWith(
                                          color: AppColors.accentTextColor),
                                ),
                              ),
                            );
                          },
                        ));
                  }, childCount: snapshot.data.userProducts.length),
                );
              },
            )
          ],
        ),
        Positioned(
          bottom: Spacing.matGridUnit(),
          right: Spacing.matGridUnit(),
          child: FloatingActionButton.extended(
              icon: Icon(Icons.add),
              label: Text("New Product"),
              onPressed: () {
                Navigator.push(
                  context,
                  FadeInSlideOutRoute(
                    builder: (context) => AddNewProductPageContainer(),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
