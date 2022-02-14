import 'package:moduler_structure/Exceptions/FlowException.dart';

final modulerProvider = ModulerProvider();

class ModulerProvider {
  final providers = <String, dynamic>{};

  String _getProviderName<T>() => '$T';

  T get<T>() {
    final providerName = _getProviderName<T>();

    if (!providers.containsKey(providerName)) {
      throw FlowException('Este Provider no se encuentra registrado');
    }

    return providers[providerName];
  }

  void set<T>(dynamic provider) {
    final providerName = _getProviderName<T>();
    providers[providerName] = provider;
  }
}
