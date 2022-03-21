import 'package:tz/model/model_image_screen.dart';

abstract class PublicationsRepository {
  Future<List<PublicationModel>> getPublications();
}
