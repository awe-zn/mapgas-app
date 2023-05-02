import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_config/flutter_config.dart';

class GoogleMapsBody extends StatefulWidget {
  const GoogleMapsBody({Key? key}) : super(key: key);

  @override
  State<GoogleMapsBody> createState() => _GoogleMapsBodyState();
}

class _GoogleMapsBodyState extends State<GoogleMapsBody> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _determineLoc(),
        builder: (context, snapshot){
          if(snapshot.hasData) {
            // return Center(child: Text('${snapshot.data.latitude}'));
            return GoogleMap(
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
              padding: const EdgeInsets.only(bottom: 60.0),
              initialCameraPosition: CameraPosition(
                  zoom: 15.0,
                  target: LatLng(snapshot.data!.latitude, snapshot.data!.longitude)
              ),
            );
          }
          else{
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }
    );
  }

  Future<Position> _determineLoc() async{
    bool serviceEnable;
    LocationPermission permission;

    serviceEnable = await Geolocator.isLocationServiceEnabled();
    if(!serviceEnable){
      return Future.error('Location must be provided!');
    }

    permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();

      if(permission == LocationPermission.denied) return Future.error('Location permission denied');
    }

    Position position = await Geolocator.getCurrentPosition();
    return position;
  }
}

