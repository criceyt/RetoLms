<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Juegos</title>
</head>
<body>
    <?php
    ini_set('display_errors', 1);
    ini_set('display_startup_errors', 1);
    error_reporting(E_ALL);
    // Obtener el ID del juego desde la URL
    $id = isset($_GET['id']) ? (int) $_GET['id'] : 1;

    // Leer datos del juego desde archivo XML
    $xml = simplexml_load_file('../../assets/xml/Juegos.xml');

    // Buscar el juego con el ID especificado
    $juego = null;
    foreach ($xml->juego as $juego_xml) {
        if ((int) $juego_xml['id'] === $id) {
            $juego = $juego_xml;
            break;
        }
    }

    // Verificar que se encontró el juego
    if (!$juego) {
        echo "Juego no encontrado.";
        exit;
    }

    // Crear array asociativo con los datos del juego
    $datos_juego = [
        'titulo' => (string) $juego->titulo,
        'precio' => (float) $juego->precio,
        'rating' => (float) $juego->rating,
        'descripcion' => (string) $juego->descripcion,
        'developer' => (string) $juego->developer,
        'publisher' => (string) $juego->publisher,
        'release_date' => (string) $juego->release_date,
        'website' => (string) $juego->website,
        'trailer' => (string) $juego->trailer,
        'minimos' => [
            'os' => (string) $juego->minimos->os,
            'processor' => (string) $juego->minimos->processor,
            'memory' => (string) $juego->minimos->memory,
            'graphics' => (string) $juego->minimos->graphics,
            'storage' => (string) $juego->minimos->storage
        ],
        'recomendados' => [
            'os' => (string) $juego->recomendados->os,
            'processor' => (string) $juego->recomendados->processor,
            'memory' => (string) $juego->recomendados->memory,
            'graphics' => (string) $juego->recomendados->graphics,
            'storage' => (string) $juego->recomendados->storage
        ]
    ];

    // Incluir la plantilla HTML y pasar el array de datos
    include 'pantillacompleta.html';
    ?>
</body>
</html>