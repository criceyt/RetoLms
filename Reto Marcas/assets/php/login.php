<?php
// Verificar si se ha enviado el formulario
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Obtener los valores del formulario
    $dni = $_POST["dni"];
    $password = $_POST["password"];

    try {
        // Importar la clase Session de BaseX
        require_once "../../../../basex/BDConexion.php";

        // Crear una nueva sesión BaseX
        $session = new Session();        

        // Abrir la base de datos
        $session->execute("open RETO");

        // Realizar la consulta para obtener el XML
        $xmlStr = $session->execute("xquery /");

        // Cerrar la sesión
        $session->close();

        // Convertir el string XML a un objeto SimpleXMLElement
        $xml = new SimpleXMLElement($xmlStr);

        // Función para buscar un usuario por DNI
        function buscarUsuarioPorDNI($xml, $dni) {
            foreach ($xml->usuarios->usuario as $usuario) {
                if ((string) $usuario->dni === $dni) {
                    return $usuario;
                }
            }
            return null;
        }

        // Buscar al usuario por DNI
        $usuario = buscarUsuarioPorDNI($xml, $dni);

        // Verificar si se encontró al usuario y si la contraseña coincide
        if ($usuario && (string) $usuario->contrasena === $password) {
            // Si las credenciales son correctas, iniciar sesión
            session_start();
            $_SESSION["dni"] = $dni; // Guardar el DNI en la sesión

            // Redireccionar al usuario a la página de la biblioteca, por ejemplo
            header("Location: ../../libreria.php");
            exit(); // Detener la ejecución del script después de la redirección
        } else {
            // Si las credenciales son incorrectas, redirigir al usuario al formulario de inicio de sesión con un mensaje de error
            header("Location: ../../login2.php?error=1");
            exit(); // Detener la ejecución del script después de la redirección
        }
    } catch (Exception $e) {
        // Manejar cualquier excepción
        echo "Error: " . $e->getMessage();
    }
}
?>