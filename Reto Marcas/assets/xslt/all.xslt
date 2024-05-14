<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <head>
        <title>Lista de Juegos</title>
        <style>
          table {
            border-collapse: collapse;
            width: 100%;
            border-radius: 8px; /* Agregar bordes redondeados */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Agregar sombra */
          }
          th, td {
            padding: 8px;
            text-align: left;
            position: relative; /* Establecer posición relativa para contener el contenido */
            z-index: 2; /* Asegurar que las celdas estén en el mismo contexto de apilamiento */
            color: black; /* Cambiar el color del texto a negro */
          }
          tr:nth-child(even) {
            background-color: #777777; /* Cambiar el color de fondo de las filas pares */
          }
          th {
            background-color: #f2f2f2;
            text-align: center; /* Centrar el contenido de los th */
            font-weight: bold; /* Hacer el texto del encabezado en negrita */
          }
          tr:hover {
            background-color: #f5f5f5;
            transform: scale(1.1); /* Ampliar la fila al pasar el cursor sobre ella */
            transition: transform 0.3s; /* Agregar transición suave */
          }
          tr:hover td {
            z-index: 2; /* Asegurar que las celdas ampliadas estén en un contexto de apilamiento superior */
            color: black; /* Cambiar el color del texto a negro al pasar el cursor sobre él */
          }
          img {
            width: 150px; /* Tamaño de las imágenes */
            height: auto; /* Mantener la proporción */
          }
          table a {
            color: black; /* Cambiar el color del texto de los enlaces dentro de la tabla a negro */
            text-decoration: none; /* Quitar subrayado de los enlaces */
          }
          table a:hover {
            color: black; /* Cambiar el color del texto de los enlaces dentro de la tabla a negro al pasar el cursor sobre ellos */
          }
          .container-video {
            position: relative;
            width: 100%;
            height: 450px; /* Ajusta la altura al 100% para cubrir completamente el contenedor */
            overflow: hidden;
          }
          .container-video video {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
            filter: brightness(0.4); /* Reduce el brillo del video */
          }
          .overlay {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            color: white;
            font-size: 24px;
            text-align: center;
            z-index: 3;
          }
        </style>
      </head>
      <body>
        <div class="container-video">
          <video muted="muted" loop="loop" playsinline="playsinline" autoplay="autoplay">
            <source src="http://ekainminecraft.duckdns.org/videos/Cyberpunk(1).mp4" type="video/mp4"/>
          </video>
          <div class="overlay">
            <p>Bienvenidos a nuestra tienda</p>
          </div>
        </div>
        <table>
          <tr>
            <th>Carátula</th>
            <th>Título</th>
            <th>Género</th>
            <th>Plataforma</th>
            <th>Precio</th>
          </tr>
          <xsl:for-each select="tienda/juegos/juego">
          <xsl:variable name="titulo" select="@titulo" />
          <xsl:variable name="codigoJuego" select="@codigoJuego" />
          <tr>
            <td>
              <a href="{concat('../../pages/games/InfoJuego.php?codigoJuego=', $codigoJuego)}">
                <img src="{caratula/@src}" alt="{$titulo}" />
              </a>
            </td>
            <td>
              <a href="{concat('../../pages/games/InfoJuego.php?codigoJuego=', $codigoJuego)}">
                <xsl:value-of select="$titulo" />
              </a>
            </td>
            <td>
              <xsl:for-each select="genero">
                <xsl:value-of select="." />
                <xsl:if test="position() != last()">, </xsl:if>
              </xsl:for-each>
            </td>
            <td>
              <xsl:for-each select="plataforma">
                <xsl:value-of select="." />
                <xsl:if test="position() != last()">, </xsl:if>
              </xsl:for-each>
            </td>
            <td>
              <xsl:value-of select="precio" />
            </td>
          </tr>
        </xsl:for-each>
      </table>
        
    </body>
  </html>
</xsl:template>
</xsl:stylesheet>
