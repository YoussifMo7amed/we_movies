import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:we_movies/modules/bloc/cubit.dart';
import 'package:we_movies/modules/bloc/states.dart';
import 'package:we_movies/shared/components/component.dart';
import 'package:we_movies/shared/styles/colors.dart';

class Search extends StatelessWidget {
  var Formkey = GlobalKey<FormState>();
  var textcontroler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieCubit, MovieStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit =MovieCubit.get(context);
        return SafeArea(
              child: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Form(
                  key: Formkey,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        dfaultFormField(
                          textStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 24.0
                          ),
                          controller: textcontroler,
                          type: TextInputType.text,
                          label: 'Search movie',
                          prefix: Icon(Icons.search,color: Colors.white54,size: 36.0,),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Text';
                            }
                            return null;
                          },
                          onsubmit: (String Text) {
                         //   ShopSearchCubit.get(context).GetSearch(Text: Text);
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ConditionalBuilder(
                          condition: state is! MovieNewMoviesLoadingState&&state is! MoviePopularLoadingState,
                          fallback: (context) => LinearProgressIndicator(),
                          builder:(context) =>  Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "New Movie",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                        ),
                          SizedBox(height: 10),
                          Container(
                            height: 289,
                            decoration:
                                BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
                            child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: 5, // Placeholder for the number of trending movies
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Card(
                                    elevation: 0,
                                    color: defaultcolor2,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(20.0),
                                          child: Image.network(
                                           "http://image.tmdb.org/t/p/w500/${cubit.newMoviesModel!.result[index].backdropPath}", 
                                            width: 150,
                                            height: 225,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Container(
                                          width: 125,
                                          height: 50,
                                          child: Text(
                                          "${cubit.newMoviesModel!.result[index].title}",
                                            textAlign: TextAlign.start,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style:
                                                TextStyle(color: Colors.white, fontSize: 17.0,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),
                                          ),
                                        ),
                                         // Placeholder for movie name
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Most Popular",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          
                          Container(
                            height: 290,
                            decoration:
                                BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
                            child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: 5, // Placeholder for the number of trending movies
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Card(
                                    elevation: 0,
                                    color: defaultcolor2,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(20.0),
                                          child: Image.network(
                                           "http://image.tmdb.org/t/p/w500/${cubit.popularMoviesModel!.result[index].backdropPath}", 
                                            width: 150,
                                            height: 228,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Container(
                                          width: 125,
                                          height: 50,
                                          child: Text(
                                          "${cubit.popularMoviesModel!.result[index].title}",
                                            textAlign: TextAlign.start,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style:
                                                TextStyle(color: Colors.white, fontSize: 17.0,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),
                                          ),
                                        ),
                                         // Placeholder for movie name
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        /*if (state is ShopsearchLoadingState)
                          LinearProgressIndicator(),
                        SizedBox(
                          height: 10,
                        ),
                        if (state is ShopsearchSuccesState)
                          Expanded(
                            child: ListView.separated(
                                itemBuilder: (context, index) => buildListproduct(
                                    ShopSearchCubit.get(context)
                                        .model!
                                        .data!
                                        .data![index],
                                    context,
                                    isOldprice: false),
                                separatorBuilder: (context, index) => myDivider(),
                                itemCount: ShopSearchCubit.get(context)
                                    .model!
                                    .data!
                                    .data!
                                    .length),
                          ),*/
                      ],
                    ),
                  ),
                ),
              ),
            );
      },
    );
  }
}
