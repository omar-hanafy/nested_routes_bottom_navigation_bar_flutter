import 'package:flutter/material.dart';

class MyRouteInformationParser extends RouteInformationParser<List<RouteSettings>> {
  const MyRouteInformationParser() : super();

  /// convert URL to APP
  @override
  Future<List<RouteSettings>> parseRouteInformation(RouteInformation routeInformation) {
    final Uri uri = Uri.parse(routeInformation.location!);

    if (uri.pathSegments.isEmpty) {
      return Future.value([const RouteSettings(name: '/')]);
    }

    final routeSettings = uri.pathSegments
        .map((pathSegment) => RouteSettings(
              name: '/$pathSegment',
              arguments:
                  pathSegment == uri.pathSegments.last ? uri.queryParameters : null,
            ))
        .toList();

    return Future.value(routeSettings);
  }

  /// convert APP to URL
  @override
  RouteInformation restoreRouteInformation(List<RouteSettings> configuration) {
    final location = configuration.last.name;
    final arguments = _restoreArguments(configuration.last);

    return RouteInformation(location: '$location$arguments');
  }

  String _restoreArguments(RouteSettings routeSettings) {
    if (routeSettings.name != '/product') return '';

    return '?id=${(routeSettings.arguments as Map)['id'].toString()}';
  }
}
