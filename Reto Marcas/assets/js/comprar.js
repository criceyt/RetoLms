// script.js

function sendCodeToPHP() {
    // Obtener el código de juego de la URL
    var urlParams = new URLSearchParams(window.location.search);
    var codigoJuego = urlParams.get('codigoJuego');
    
    // Realizar una solicitud AJAX para enviar el código de juego a un script PHP
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            // Aquí puedes manejar la respuesta del servidor si es necesario
            console.log("Código de juego enviado exitosamente a PHP.");
        }
    };
    // Establecer la URL del script PHP al que enviar los datos
    var url = "../php/comprar.php";
    // Definir los datos a enviar al script PHP (en este caso, el código de juego)
    var params = "codigoJuego=" + codigoJuego;
    // Configurar la solicitud AJAX
    xmlhttp.open("POST", url, true);
    xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    // Enviar la solicitud AJAX
    xmlhttp.send(params);
}
