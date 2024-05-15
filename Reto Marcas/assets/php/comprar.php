<?php 
session_start();
require_once("../../../../basex/BDConexion.php");

try {
    // Recupera los datos del formulario
    $dni = $_SESSION["dni"];
    $codigoJuego = $_GET['codigoJuego'];

    // Ruta del archivo XQuery
    $rutaXq = "../xq/comprar.xq";
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
    $query->bind('$codigoJuego',$codigoJuego);
 
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
