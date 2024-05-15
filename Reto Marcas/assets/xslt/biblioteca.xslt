<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:param name="dni" />
  <xsl:template match="/">
    <html>
      <head>
        <title>Lista de Juegos</title>
        <style>
          .image-container {
            position: relative;
            display: flex;
            flex-wrap: wrap; /* Las imágenes se envuelven en filas adicionales */
            max-width: 100%; /* Establece el ancho máximo al 100% del contenedor padre */
           
          }
          
          .image-container img {
            width: 240px; /* Ancho definido */
            height: 430px; /* Altura definida */
            object-fit: cover;
            opacity: .6;
            transition: .5s ease;
            /* Añadido para espacio entre las imágenes */
            position: relative;
           
          }
          
          /* Aplicar el efecto de hover */
          .image-container img:hover {
            cursor: crosshair;
            width: 430px; /* Ancho al que cambia en el hover */
            opacity: 1;
            filter: contrast(100%);
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
            <p>Bienvenidos a su biblioteca</p>
          </div>
        </div>
        <xsl:choose>
          <!-- Verificar si el parámetro $dni está definido -->
          <xsl:when test="$dni">
            <div class="image-container">
              <xsl:for-each
                select="/tienda/juegos/juego[contains(concat(',', @propietarios, ','), concat(',', $dni, ','))]">
                <xsl:variable name="titulo" select="@titulo" />
                <xsl:variable name="codigoJuego"
                  select="@codigoJuego" />
                <xsl:variable name="caratulaSrc" select="caratula/@src" />
                <a
                  href="{concat('../php/InfoJuego.php?codigoJuego=', $codigoJuego)}">
                  <div class="title-container">
                    <img src="{$caratulaSrc}" alt="{$titulo}" />
                    <!-- Título superpuesto -->
                  
                  </div>
                </a>
              </xsl:for-each>
            </div>

          </xsl:when>
          <xsl:otherwise>
            <!-- Si no está definido, mostrar un mensaje para que el usuario se logee -->
          <p>Por favor, inicie sesión para acceder a su biblioteca.</p>
          </xsl:otherwise>
        </xsl:choose>
      </body>
    </html>

  </xsl:template>
</xsl:stylesheet>
