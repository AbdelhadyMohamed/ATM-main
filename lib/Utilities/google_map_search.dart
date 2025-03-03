import 'package:atm/Utilities/strings.dart';
import 'package:atm/Utilities/theme_helper.dart';
import 'package:atm/core/Language/locales.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_webservice/places.dart';


class GoogleSearchHelper {
  static const String _googleApiKey = 'AIzaSyDxGfP9wVkkoIDBRwqR1i4H7afn-oQm33w';
  static const Mode _mode = Mode.overlay;
  static Future<PlacesDetailsResponse> googleSearch({
    Widget? logo,
    required BuildContext context,
    startText = ''
  }) async {
    Prediction? p = await PlacesAutocomplete.show(
        startText: startText,
        region: startText,
        logo: const Text(""),
        context: context,
        // proxyBaseUrl: API.autocompleteUrl,
        apiKey: _googleApiKey,
        // onError: onError,
        mode: _mode,
        language: 'en',
        strictbounds: false,
        types: [""],
        decoration: InputDecoration(
            icon: Icon(
              Icons.search,
              color: ThemeClass.of(context).medGrey,
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            hintText: Strings.searchLocation.tr,
            hintStyle: TextStyle(color: Colors.black.withOpacity(0.3))),
        components: [
          Component(Component.country, "sa"),
          // Component(Component.country, "egy"),
        ]);

    GoogleMapsPlaces places = GoogleMapsPlaces(

        apiKey: _googleApiKey,
        apiHeaders: await const GoogleApiHeaders().getHeaders());
    PlacesDetailsResponse detail = await places.getDetailsByPlaceId(p?.placeId ?? '',        language: 'en');
    return detail;
  }

// static void onError(PlacesAutocompleteResponse response) {
//   ToastHelper.showError(message: response.status);
// }
}
