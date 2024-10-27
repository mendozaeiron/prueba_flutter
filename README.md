Prueba Técnica Flutter
Descripción
Esta es una aplicación móvil desarrollada en Flutter como parte de una prueba técnica. La aplicación permite a los usuarios autenticarse, ver una lista de productos y acceder a los detalles de cada producto, todo utilizando el manejo de estado con BLoC.

Requisitos
Para ejecutar esta aplicación, necesitarás tener instalado lo siguiente:

Flutter SDK (versión mínima recomendada: 2.5.0 o superior)
Conexión a Internet para obtener los datos desde la API FakeStoreAPI
Un dispositivo físico o emulador (iOS/Android)

Instalación
Clona el repositorio en tu máquina local:
git clone https://github.com/tu_usuario/prueba_flutter.git

Navega hasta la carpeta del proyecto:
cd prueba_flutter

Instala las dependencias del proyecto: Este comando descargará todas las dependencias necesarias para el proyecto, incluidas las librerías de BLoC y HTTP.
flutter pub get

Ejecución
Conecta un dispositivo físico o emulador: Asegúrate de que tengas un dispositivo conectado o un emulador corriendo.

Ejecuta la aplicación en tu dispositivo o emulador:
flutter run

Esto compilará y desplegará la aplicación en tu dispositivo o emulador.

Uso de la aplicación:

En la pantalla de inicio, ingresa tu nombre de usuario y contraseña.
Luego de la autenticación exitosa, podrás acceder a la lista de productos desde la API.
Puedes hacer clic en un producto para ver sus detalles.

Estructura del Proyecto
El proyecto está organizado en las siguientes carpetas:

blocs/: Contiene los archivos BLoC (manejo de eventos y estados) para autenticación y productos.
models/: Define los modelos de datos como User y Product.
repositories/: Implementa las llamadas a la API para la autenticación y la obtención de productos.
screens/: Define las pantallas de la aplicación (login, lista de productos, detalles del producto).

Recursos Externos
API de autenticación: https://fakestoreapi.com/auth/login
API de productos: https://fakestoreapi.com/products

Notas
La aplicación maneja el estado de carga, éxito y error en las pantallas de login.
Se utiliza BLoC como patrón de manejo de estado para garantizar una arquitectura desacoplada y escalable.
Para probar la aplicación debe usarse cualquier usuario que se encuentra en el objeto json del siguiente link https://fakestoreapi.com/users
El login maneja validaciones ya sea cuando los campos estan vacios, cuando falte por ingresar password o contraseña y/o se ingrese un usuario que no se encuentre en el objeto json señalado anteriormente
