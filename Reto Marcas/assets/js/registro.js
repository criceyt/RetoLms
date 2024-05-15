function enviarDatos() {
    var dni = document.getElementById("dni").value;
    var nombre = document.getElementById("nombre").value;
    var apellido = document.getElementById("apellido").value;
    var tipo_contacto = document.getElementById("tipo_contacto").value;
    var codigoPostal = document.getElementById("codigoPostal").value;
    var contrasena = document.getElementById("contrasena").value;

    // Corregir la condición para verificar si algún campo está vacío
    if (dni === "" || nombre === "" || apellido === "" || tipo_contacto === "" || codigoPostal === "" || contrasena === "") {
        alert("Por favor, completa todos los campos.");
        return;
    }
    // Si todos los campos están llenos, enviar el formulario
    document.getElementById("formulario").submit();
}
