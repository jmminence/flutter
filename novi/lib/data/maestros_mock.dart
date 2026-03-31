/// Perfil mínimo de maestro (datos de ejemplo; luego vendrá de API + ubicación).
class MaestroPerfil {
  const MaestroPerfil({
    required this.nombre,
    required this.especialidad,
    required this.distanciaEjemplo,
  });

  final String nombre;
  final String especialidad;

  /// Texto ficticio hasta tener geolocalización real.
  final String distanciaEjemplo;
}

/// Lista demo para maquetar la lista "cerca de ti".
const List<MaestroPerfil> maestrosMock = [
  MaestroPerfil(
    nombre: 'R. Gómez',
    especialidad: 'Albañilería y hormigón',
    distanciaEjemplo: '~0,8 km',
  ),
  MaestroPerfil(
    nombre: 'Electricidad Sur',
    especialidad: 'Instalaciones y tableros',
    distanciaEjemplo: '~1,2 km',
  ),
  MaestroPerfil(
    nombre: 'Pinturas Vega',
    especialidad: 'Interiores y fachadas',
    distanciaEjemplo: '~1,5 km',
  ),
];
