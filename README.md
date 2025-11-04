# Global66

Este proyecto es una prueba técnica para puesto frontend de global66.

# Ejecución del proyecto

Dentro del proyecto tenemos un script llamado "flutterinit.sh", el cual podemos ejecutar de la siguiente manera:

### **Llamada Script**
sh flutterinit.sh

Esto debe ser suficiente, en caso de tener problemas con ese script se puede inicializar todo de forma manual de la siguiente manera:

# Ejecución manual

### **Limpiar proyecto**
flutter clean
flutter pub get

### **Generar código en watch mode (desarrollo)**
flutter pub run build_runner watch --delete-conflicting-outputs

### **Analizar código**
flutter analyze

### **Ejecutar tests**
flutter test

### **Build para Android**
flutter build apk --release

### **Build para iOS**
flutter build ios --release

### **Ejecución en dispositivo**
flutter run


# Arquitectura del proyecto

Tenemos un proyecto que tiene como patrones prinicpales Clean Architecture + BLoC/Riverpod

Si bien el uso de BLoC y Riverpod al mismo tiempo puede causar confusión a la hora de un proyecto real solo se esta haciendo el uso de ambos para demostrar el uso de ellos, pero es bien sabido que lo mejor es solo estar apegado a un solo enfoque.


## 📁 Estructura por Capas

### **Presentación de archivos (UI)**
```
src/
├── bloc/
│   └── pokedex/
│       └── pokemon_list_bloc.dart      # BLoC
│       ...
├── providers/
│   └── pokedex/
│       └── pokemon_provider.dart      # Riverprod
│       ...
├── ui/
│   └── pokedex/
│       ├── pokemon_list_view.dart      # Pantalla lista
│       └── pokemon_detail_view.dart    # Pantalla detalle
│       ...
├── widgets/
│   ├── pokemon_info_card.dart      # Card reutilizable
│   ├── types_bottom_modal.dart     # Modal de filtros
│   └── oval_type.dart              # Insignia de tipos
```
Se busco mantener una estructura de los archivos organizadas según las 4 opciones que se tienen en el navigation bottom bar (pokedex, regiones, favoritos, perfil)

### **State Management (Híbrido)**

**BLoC Pattern:**

Con BLoC se busco manejar principalmente la lista de elementos (pokemones), eventos y estados (paginación, búsqueda) y se maneja la lógica de carga de elementos.

**Riverpod:**

Por otra parte con Riverpod, el manejo de los favoritos y DIO, era más simple para manejos de estados globales y se controla la persistencia de datos con SharedPreferences.


## IA utilizada

Se hizo uso de 2 IAs para el apoyo en el proyecto en situaciones muy puntuales.

**ChatGPT**

- Quisiera hacer un icono para una aplicación me podrías generar un zip con todas las resoluciones necesarias tanto para android como ios, quiero que sea una pokebola mezclada con el logo de global66, en lugar del botón del medio de la pokebola quiero que sean las curvas del logo, con colores brillantes y un poco de 3D, que el zip sea llamado icono_global, adjunto imagen del logo del global66.

Fue para generar un icono para la aplicación.

**CLaude**

- Generate a I18N_SETUP.md file, to explain how to use and works "flutter_i18n".

La idea era generar un archivo para explicar como funciona la internacionalización utilizando flutter_i18n.

- How to integrate "riverpod_annotation" into a project with "flutter_riverpod"?

Tengo poco contacto con riverpod con anotaciones y comencé el proyecto usando riverpod sin ellas.

- How to use "freezed" in a flutter project?

No tengo tanto conocimiento sobre freezed, lo utilice en un proyecto hace algún tiempo pero ya estaba implementado, nunca me había tocado implementarlo desde 0.

## Seguridad

Este proyecto en particular no necesita muchas capas de seguridad, no necesita encriptación de datos, autentificaciones, validación de inputs que puedan ser sensibles, ni grandes manejos de errores.

Sin embargo se presto atención en el manejo de errores ya sea por tiempo excesivo de respuestas, se manejan timeouts en Dio en este caso se hace la llamada a los pokemones de 20 en 20, que son paginados mientras se intenta seguir haciendo scroll, ya que el traer absolutamente todos los pokémones podía dar un tiempo de carga muy alto. Por otra parte, manejos de errores en el caso del uso de las apis, por ejemplo: en el caso de la busqueda se esta utilizando el endpoint "https://pokeapi.co/api/v2/pokemon/${name}" asi que posiblemente se puede dar el caso de que escriban mal el nombre de algún pokemon en ese caso se muestra un snackbar informando que ocurrió un error.

Podemos decir que la seguridad realmente es baja, pero para un proyecto con datos totalmente públicos puede ser aceptable.

## Comentarios

La única vista no desarrollada fue la del perfil, en los documentos de figma no había nada relacionada a ella, ni existían muchos datos relevantes para colocar en allí, como se integró la internacionalización en el proyecto,  en ella se colocó la opción para el cambio de idioma para aprovecharla de alguna forma.

La verdad por el diseño en figma no entendí muy bien como hacer aparecer el filtro, así que agregue un botón más y deje el botón con lupa para activar el buscador.

versiones utilizadas:

Flutter 3.29.0 • channel stable • https://github.com/flutter/flutter.git
Framework • revision 35c388afb5 (8 months ago) • 2025-02-10 12:48:41 -0800
Engine • revision f73bfc4522
Tools • Dart 3.7.0 • DevTools 2.42.2