import 'package:event_planner/data/models/image_model.dart';
import 'package:event_planner/data/models/organizers_model.dart';
import 'package:event_planner/domain/services/api_client.dart';
import 'package:event_planner/domain/use_cases/event_case.dart';

class EventService extends EventCase {
  @override
  Future<List<ImageModel>?> getImages() async {
    try {
      List<ImageModel> images = [];
      final response = await ApiClient().dio.get('/photos');

      for (var image in response.data) {
        images.add(ImageModel.fromJson(image));
      }
      return images;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<OrganizersModel>?> getOrganizers() async {
    try {
      List<OrganizersModel> organizers = [];
      final response = await ApiClient().dio.get('/users');

      for (var organizer in response.data) {
        organizers.add(OrganizersModel.fromJson(organizer));
      }
      return organizers;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
