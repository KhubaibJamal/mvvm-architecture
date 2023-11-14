import 'package:flutter/material.dart';
import 'package:mvvm/data/response/status.dart';
import 'package:mvvm/utils/routes/routes.dart';
import 'package:mvvm/view_model/home_view_model.dart';
import 'package:mvvm/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModel homeViewModel = HomeViewModel();

  @override
  void initState() {
    // TODO: implement initState
    homeViewModel.getMovieListApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userPreferences = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        automaticallyImplyLeading: false,
        actions: [
          InkWell(
            onTap: () {
              userPreferences.remove().then((value) {
                Navigator.pushNamed(context, RouteName.login);
              });
            },
            child: const Center(
              child: Text('Logout'),
            ),
          ),
          const SizedBox(width: 20)
        ],
      ),
      body: ChangeNotifierProvider<HomeViewModel>(
        create: (BuildContext context) => HomeViewModel(),
        child: Consumer<HomeViewModel>(
          builder: (context, provider, _) {
            switch (provider.movieList.status) {
              case Status.loading:
                return const Center(child: CircularProgressIndicator());

              case Status.error:
                return Center(
                    child: Text(provider.movieList.message.toString()));

              case Status.completed:
                return ListView.builder(
                  // itemCount: provider.movieList.data!.data!.length,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: Image.network(
                          '${provider.movieList.data!.data![index].avatar}',
                          height: 40,
                          width: 40,
                          fit: BoxFit.cover,
                        ),
                        title: Text(
                            '${provider.movieList.data!.data![index]..firstName}'),
                        subtitle: Text(
                            "${provider.movieList.data!.data![index].email}"),
                      ),
                    );
                  },
                );

              default:
                return Container();
            }
          },
        ),
      ),
    );
  }
}
