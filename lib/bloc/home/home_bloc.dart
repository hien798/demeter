import 'package:demeter/bloc/base/base_bloc.dart';
import 'package:demeter/model/device.dart';
import 'package:demeter/model/dfamily.dart';
import 'package:demeter/model/camera.dart';
import 'package:demeter/model/project.dart';
import 'package:demeter/utils/path.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

enum LayoutType { device, project, detail }

class HomeBloc extends BaseBloc {
  final _layoutController = BehaviorSubject<LayoutType>();

  Stream<LayoutType> get layoutStream => _layoutController.stream;

  HomeBloc() {
    _layoutController.add(LayoutType.device);
  }

  changeLayout(LayoutType type) {
    _layoutController.add(type);
  }

  int projectIndex = 0;

  List<Project> projects = [
    Project(
      name: 'Tomato',
      image: ImagePath.dv_tomato,
      camera: ImagePath.dv_farm,
    ),
    Project(
      name: 'Living Room',
      image: ImagePath.dv_room,
      camera: ImagePath.dv_room,
    ),
  ];

  List<Device> devices = [
    Device(image: ImagePath.dv_light, name: 'Light', status: true, desc: 'On'),
    Device(image: ImagePath.dv_pump, name: 'Pump', status: false, desc: 'Off'),
    Device(image: ImagePath.dv_fan, name: 'Fan 1', status: true, desc: 'Off'),
    Device(
        image: ImagePath.dv_fan,
        name: 'Fan 2',
        status: true,
        desc: 'Normal Speed'),
  ];

  DFamily dfamily = DFamily(
    name: 'DFamily',
    image: ImagePath.dv_dfamily,
    desc: 'On',
    status: true,
    light: true,
    pump: false,
    fan: false,
  );

  Camera camera = Camera(
    name: 'Camera',
    image: ImagePath.dv_camera,
    desc: 'On',
    status: true,
    camera: ImagePath.dv_farm,
  );
}
