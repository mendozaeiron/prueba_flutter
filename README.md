# PRUEBA TÉCNICA FLUTTER

## DESCRIPCIÓN
**Esta es una aplicación móvil desarrollada en Flutter como parte de una prueba técnica. La aplicación permite a los usuarios autenticarse, ver una lista de productos y acceder a los detalles de cada producto, todo utilizando el manejo de estado con BLoC.**

## REQUISITOS
**Para ejecutar esta aplicación, necesitarás tener instalado lo siguiente:**

- Visual Studio Code
- Android Studio (para poder ocupar tanto sus emuladores en Visual Studio Code una vez instalada la extension de Flutter y su SDK, como dispositivos físicos)
- Extension Flutter (Como consecuencia de su instalación tambien se instalará su dependencia que es Dart)
- Flutter SDK (versión mínima recomendada: 2.5.0 o superior)
- Conexión a Internet para obtener los datos desde la API FakeStoreAPI
- Un dispositivo físico o emulador (iOS/Android)

## INSTALACIÓN
**Clona el repositorio en tu máquina local:**
- git clone https://github.com/tu_usuario/prueba_flutter.git

**Navega hasta la carpeta del proyecto:**
- cd prueba_flutter

**Instala las dependencias del proyecto: Este comando descargará todas las dependencias necesarias para el proyecto, incluidas las librerías de BLoC y HTTP.**
- flutter pub get


## EJECUCIÓN
Conecta un dispositivo físico o emulador: Asegúrate de que tengas un dispositivo conectado o un emulador corriendo.

Ejecuta la aplicación en tu dispositivo o emulador:
- flutter run

Esto compilará y desplegará la aplicación en tu dispositivo o emulador.

## USO DE LA APLICACIÓN:

- En la pantalla de inicio, ingresa tu nombre de usuario y contraseña.
- Luego de la autenticación exitosa, podrás acceder a la lista de productos desde la API.
- Puedes hacer clic en un producto para ver sus detalles.

## ESTRUCTURA DEL PROYECTO
El proyecto está organizado en las siguientes carpetas:

- blocks/: Contiene los archivos BLoC (manejo de eventos y estados) para autenticación y productos.
- models/: Define los modelos de datos como User y Product.
- repositories/: Implementa las llamadas a la API para la autenticación y la obtención de productos.
- screens/: Define las pantallas de la aplicación (login, lista de productos, detalles del producto).

## RECURSOS EXTERNOS
- API de autenticación: https://fakestoreapi.com/auth/login
- API de productos: https://fakestoreapi.com/products

## NOTAS
- La aplicación maneja el estado de carga, éxito y error en las pantallas de login y de productos.
- Se utiliza BLoC como patrón de manejo de estado para garantizar una arquitectura desacoplada y escalable.
- Para probar la aplicación, debe usarse cualquier usuario que se encuentre en el objeto json, del siguiente link https://fakestoreapi.com/users
- El login maneja validaciones ya sea cuando los campos estan vacios, cuando falte por ingresar password o contraseña y/o se ingrese un usuario que no se encuentre en el objeto json señalado anteriormente
