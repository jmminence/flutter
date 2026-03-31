import 'package:flutter/material.dart';

import '../data/maestros_mock.dart';
import '../widgets/theme_mode_button.dart';

/// Exploración básica: maestros de construcción "cerca" (datos mock).
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cerca de ti'),
        actions: const [
          ThemeModeButton(),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              'Hola${email.isNotEmpty ? ', ${email.split('@').first}' : ''}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Maestros de construcción en tu zona (ejemplo). Más adelante: mapa, filtros y perfiles reales.',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: scheme.onSurfaceVariant,
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: SearchBar(
              hintText: 'Buscar oficio o nombre (pronto)',
              leading: const Icon(Icons.search),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Búsqueda: pendiente de definir')),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: maestrosMock.length,
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final m = maestrosMock[index];
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: scheme.primaryContainer,
                      foregroundColor: scheme.onPrimaryContainer,
                      child: const Icon(Icons.construction),
                    ),
                    title: Text(m.nombre),
                    subtitle: Text(m.especialidad),
                    trailing: Text(
                      m.distanciaEjemplo,
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            color: scheme.primary,
                          ),
                    ),
                    onTap: () {
                      showDialog<void>(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: Text(m.nombre),
                          content: Text(
                            '${m.especialidad}\n\nAquí irá el perfil completo: trabajos, valoraciones, contacto, etc.',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(ctx),
                              child: const Text('Cerrar'),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: OutlinedButton.icon(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.logout),
              label: const Text('Cerrar sesión'),
            ),
          ),
        ],
      ),
    );
  }
}
