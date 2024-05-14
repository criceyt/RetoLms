<?php
if (isset($_GET['id'])) {
    $idJuego = $_GET['id'];

    // Cargar el segundo archivo XML con los datos adicionales de los juegos
    $xml = simplexml_load_file('../../assets/xml/Juegos.xml');

    // Buscar el juego por ID en el nuevo archivo XML
    $juego = $xml->xpath("//juego[@id='$idJuego']");

    if ($juego) {
        // Mostrar todos los detalles del juego
        echo "<h1>{$juego[0]->titulo}</h1>";
        echo "<p>Precio: {$juego[0]->precio}</p>";
        echo "<p>Rating: {$juego[0]->rating}</p>";
        echo "<p>Descripción: {$juego[0]->descripcion}</p>";
        echo "<p>Desarrollador: {$juego[0]->developer}</p>";
        echo "<p>Publicador: {$juego[0]->publisher}</p>";
        echo "<p>Fecha de lanzamiento: {$juego[0]->release_date}</p>";
        echo "<p>Website: <a href='{$juego[0]->website}'>{$juego[0]->website}</a></p>";
        echo "<p>Trailer:</p>";
        echo "<video width='320' height='240' controls>";
        echo "<source src='{$juego[0]->trailer}' type='video/mp4'>";
        echo "Tu navegador no soporta el elemento de video.";
        echo "</video>";
        echo "<h2>Requisitos del sistema</h2>";
        echo "<h3>Requisitos mínimos:</h3>";
        echo "<ul>";
        foreach ($juego[0]->system_requirements->minimal->children() as $requirement) {
            echo "<li>{$requirement->getName()}: {$requirement}</li>";
        }
        echo "</ul>";

        echo "<h3>Requisitos recomendados:</h3>";
        echo "<ul>";
        foreach ($juego[0]->system_requirements->recommended->children() as $requirement) {
            echo "<li>{$requirement->getName()}: {$requirement}</li>";
        }
        echo "</ul>";
    } else {
        // Mostrar un mensaje de error si no se encuentra el juego
        echo "<p>El juego con ID $idJuego no fue encontrado.</p>";
    }
} else {
    // Mostrar un mensaje de error si no se proporciona un ID de juego en la URL
    echo "<p>No se proporcionó un ID de juego en la URL.</p>";
}
?>
