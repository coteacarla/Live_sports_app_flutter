import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
	const HiveService._();

	static Future<void> init() async {
		await Hive.initFlutter();
	}

	static Future<Box<Map>> openMapBox(String name) {
		return Hive.isBoxOpen(name)
				? Future.value(Hive.box<Map>(name))
				: Hive.openBox<Map>(name);
	}
}
