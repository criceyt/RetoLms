<?php
// Cargar el archivo XML
$xml = simplexml_load_file("../xml/RETO.xml");

// Función para buscar un usuario por DNI
function buscarUsuarioPorDNI($xml, $dni) {
    foreach ($xml->usuarios->usuario as $usuario) {
        if ((string) $usuario->dni === $dni) {
            return $usuario;
        }
    }
    return null;
}

// Verificar si se ha enviado el formulario
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Obtener los valores del formulario
    $dni = $_POST["dni"];
    $password = $_POST["password"];

    // Buscar al usuario por DNI
    $usuario = buscarUsuarioPorDNI($xml, $dni);

    // Mostrar mensaje de depuración
    if ($usuario) {
        echo "Usuario encontrado: " . $usuario->nombre . " " . $usuario->apellido;
    } else {
        echo "Usuario no encontrado.";
    }

    // Verificar si se encontró al usuario y si la contraseña coincide
    if ($usuario && (string) $usuario->contrasena === $password) {
        // Si las credenciales son correctas, iniciar sesión
        session_start();
        $_SESSION["dni"] = $dni; // Guardar el DNI en la sesión

        // Redireccionar al usuario a la página de la biblioteca, por ejemplo
        header("Location: ../../libreria.php");
        exit(); // Detener la ejecución del script después de la redirección
    } else {
        // Si las credenciales son incorrectas, mostrar un mensaje de error
        echo "Credenciales incorrectas. Por favor, inténtalo de nuevo.";
    }
}
?>
