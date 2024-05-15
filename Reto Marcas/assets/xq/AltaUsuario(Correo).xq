xquery version "3.1";

declare variable $dni as xs:string external;
declare variable $nombre as xs:string external;
declare variable $apellido as xs:string external;
declare variable $tipo_contacto as xs:string external;
declare variable $codigoPostal as xs:string external;
declare variable $contrasena as xs:string external;

declare variable $usuarios := db:open("RETO")/tienda/usuarios;

let $nuevoUsuario :=
    <usuario id="{$dni}">
        <dni>{$dni}</dni>
        <nombre>{$nombre}</nombre>
        <apellido>{$apellido}</apellido>
        <tipo_contacto>{$tipo_contacto}</tipo_contacto>
        <codigoPostal>{$codigoPostal}</codigoPostal>
        <contrasena>{$contrasena}</contrasena>
    </usuario>

return
    (
        insert node $nuevoUsuario into $usuarios,
        ()
    )