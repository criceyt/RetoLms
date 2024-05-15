<?php 

require_once("../../../../basex/BDConexion.php");

try {
    // Recupera los datos del formulario
    $dni = $_GET["dni"];
    $nombre = $_GET["nombre"];
    $apellido = $_GET["apellido"];
    $tipo_contacto = $_GET["tipo_contacto"];
    $codigoPostal = $_GET["codigoPostal"];
    $contrasena = $_GET["contrasena"]; 

    // Ruta del archivo XQuery
    $rutaXq = "../xq/AltaUsuario(Correo).xq";
    $fichero = fopen($rutaXq, "r"); // Abrimos el fichero $rutaXq en modo lectura "r"
    $xq = fread($fichero, filesize($rutaXq)); // Leemos el contenido del fichero y lo guardamos en la variable $xq
    fclose($fichero); // Cerramos el fichero

   
    // Crear sesión
    $session = new Session();    
    // Abrir base de datos
    $session->execute("open RETO"); // open y el nombre de la base de datos en el servidor BaseX
    // Preparar la consulta XQuery
    $query = $session->query($xq);
    // Asignar los parámetros de la consulta
    $query->bind('$dni',$dni);
    $query->bind('$nombre',$nombre);
    $query->bind('$apellido',$apellido);
    $query->bind('$tipo_contacto',$tipo_contacto);
    $query->bind('$codigoPostal',$codigoPostal);
    $query->bind('$contrasena',$contrasena);

    // Ejecutar la consulta
    $result = $query->execute();
    
    // Cerrar la consulta
    $query->close();
    // Cerrar la sesión
    $session->close();

    // Mostrar el resultado
    
} catch(Exception $e) {
    // Manejar cualquier excepción
    echo $e->getMessage();
}

?>
