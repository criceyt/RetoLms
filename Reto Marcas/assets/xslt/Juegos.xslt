<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    
    <!-- Template para el elemento 'juego' -->
    <xsl:template match="juego">
        <script type="text/javascript" src="../js/comprar.js"></script>
        <xsl:variable name="currentCodigoJuego" select="@codigoJuego" />
        <xsl:if test="$currentCodigoJuego = $codigoJuego">
            
        <!-- Inicio del contenido -->
        <div class="right-section">
            <!-- Encabezado -->
            <div class="header">
                <div class="back">
                    <a href="#" onclick="history.go(-1)"><i class="fas fa-arrow-left"></i> Go back to store</a>
                </div>
                <!-- Título del juego -->
                <h2><xsl:value-of select="titulo"/></h2>
                <!-- Precio del juego -->
                <form id="buyForm" method="get" action="../php/comprar.php" target="_blank">
                    <input type="hidden" id="codigoJuegoInput" name="codigoJuego" value="" />
                    <button id="buyButton" onclick="sendCodeToPHP()">Comprar <xsl:value-of select="concat('$', precio)"/></button>
                </form>
                
                <!-- Enlace para añadir a lista de deseos -->
                <a href=""><i class="fas fa-heart"></i>Add to wishlist</a>
            </div>
            <!-- Contenedor del video -->
            <div class="container-video">
                <video muted="muted" loop="loop" playsinline="playsinline" autoplay="autoplay">
                    <!-- Fuente del video -->
                    <source>
                        <xsl:attribute name="src">
                            <xsl:value-of select="trailer"/>
                        </xsl:attribute>
                        <xsl:attribute name="type">video/mp4</xsl:attribute>
                    </source>
                </video>
            </div>
            <!-- Sección "Acerca del juego" -->
            <section class="about">
                <div class="left">
                    <!-- Rating -->
                    <h4><xsl:text>Rating </xsl:text><xsl:value-of select="rating"/></h4>
                    <!-- Descripción -->
                    <h2>About the game</h2>
                    <p><xsl:value-of select="descripcion"/></p>
                </div>
                <div class="right">
                    <!-- Detalles del juego -->
                    <table>
                        <tr>
                            <td><span>Genre:</span></td>
                            <td><xsl:for-each select="generos/genero"><xsl:value-of select="."/><xsl:if test="position() != last()">, </xsl:if></xsl:for-each></td>
                        </tr>
                        <tr>
                            <td><span>Developer:</span></td>
                            <td><xsl:value-of select="developer"/></td>
                        </tr>
                        <tr>
                            <td><span>Publisher:</span></td>
                            <td><xsl:value-of select="publisher"/></td>
                        </tr>
                        <tr>
                            <td><span>Release date:</span></td>
                            <td><xsl:value-of select="release_date"/></td>
                        </tr>
                        <tr>
                            <td><span>Website:</span></td>
                            <td><a href="{website}"><xsl:value-of select="website"/></a></td>
                        </tr>
                    </table>
                </div>
            </section>
            <!-- Sección "Requerimientos del sistema" -->
            <section class="system">
                <div class="left">
                    <!-- Título -->
                    <div class="title">
                        <h2>System requirements</h2>
                        <!-- Iconos de sistema operativo -->
                        <a href="" class="active">
                            <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 448 512">
                                <!-- Icono de Windows -->
                            </svg>
                        </a>
                        <a href="">
                            <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 448 512">
                                <!-- Icono de macOS -->
                            </svg>
                        </a>
                        <a href="">
                            <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 384 512">
                                <!-- Icono de Linux -->
                            </svg>
                        </a>
                    </div>
                    <!-- Requerimientos mínimos -->
                    <h3>Minimal system requirements:</h3>
                    <table>
                        <tr>
                            <td><span>System:</span></td>
                            <td><xsl:value-of select="system_requirements/minimal/system"/></td>
                        </tr>
                        <tr>
                            <td><span>Processor:</span></td>
                            <td><xsl:value-of select="system_requirements/minimal/processor"/></td>
                        </tr>
                        <tr>
                            <td><span>Memory:</span></td>
                            <td><xsl:value-of select="system_requirements/minimal/memory"/></td>
                        </tr>
                        <tr>
                            <td><span>Graphics:</span></td>
                            <td><xsl:value-of select="system_requirements/minimal/graphics"/></td>
                        </tr>
                        <tr>
                            <td><span>Storage:</span></td>
                            <td><xsl:value-of select="system_requirements/minimal/storage"/></td>
                        </tr>
                        <tr>
                            <td><span>Sound:</span></td>
                            <td><xsl:value-of select="system_requirements/minimal/sound"/></td>
                        </tr>
                    </table>
                </div>
                <div class="right">
                    <!-- Requerimientos recomendados -->
                    <h3>Recommended system requirements:</h3>
                    <table>
                        <tr>
                            <td><span>System:</span></td>
                            <td><xsl:value-of select="system_requirements/recommended/system"/></td>
                        </tr>
                        <tr>
                            <td><span>Processor:</span></td>
                            <td><xsl:value-of select="system_requirements/recommended/processor"/></td>
                        </tr>
                        <tr>
                            <td><span>Memory:</span></td>
                            <td><xsl:value-of select="system_requirements/recommended/memory"/></td>
                        </tr>
                        <tr>
                            <td><span>Graphics:</span></td>
                            <td><xsl:value-of select="system_requirements/recommended/graphics"/></td>
                        </tr>
                        <tr>
                            <td><span>Storage:</span></td>
                            <td><xsl:value-of select="system_requirements/recommended/storage"/></td>
                        </tr>
                        <tr>
                            <td><span>Sound:</span></td>
                            <td><xsl:value-of select="system_requirements/recommended/sound"/></td>
                        </tr>
                    </table>
                </div>
            </section>
        </div>
        <!-- Fin del contenido -->
    </xsl:if>
    </xsl:template>
</xsl:stylesheet>
