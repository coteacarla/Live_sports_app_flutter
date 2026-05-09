import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:io';

abstract class NetworkInfo {
	Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
	NetworkInfoImpl(this._connectivity);

	final Connectivity _connectivity;

	@override
	Future<bool> get isConnected async {
		try {
			final result = await _connectivity.checkConnectivity();
			if (result.any((item) => item != ConnectivityResult.none)) {
				return true;
			}
		} catch (_) {
			// Fall back to DNS probe below.
		}

		try {
			final lookup = await InternetAddress.lookup('www.thesportsdb.com');
			return lookup.isNotEmpty && lookup.first.rawAddress.isNotEmpty;
		} catch (_) {
			return false;
		}
	}
}
