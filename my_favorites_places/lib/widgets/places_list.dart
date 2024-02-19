import 'package:flutter/material.dart';
import 'package:my_favorites_places/models/place.dart';
import 'package:my_favorites_places/screens/place_details.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({super.key, required this.places});
  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    if (places.isEmpty) {
      return Center(
        child: Text('No places yet. Add one!',
        style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.onInverseSurface),
        ),
      );
    }
    return ListView.builder(
      itemCount: places.length,
      itemBuilder: (ctx, index) => ListTile(
        leading: CircleAvatar(
          radius: 26,
          backgroundImage: FileImage(places[index].image),
        ),
        title: Text(
          places[index].title,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Theme.of(context).colorScheme.onInverseSurface),
        ),
        subtitle: Text(places[index].location.address,
        style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: Theme.of(context).colorScheme.onInverseSurface),),
        onTap: () {
          Navigator.of(context).push(
                MaterialPageRoute(builder: (ctx) =>
                  PlaceDetailsScreen(place: places[index]),
                ),
              );
        },
      ),
    );
  }
}
