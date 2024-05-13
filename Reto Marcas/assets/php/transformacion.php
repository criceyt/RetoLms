<?php
                    
                    require_once './Session.php'; 
                   
                    $session = new Session();

                    $session->execute("open tienda");

                    $xmlStr = $session->execute("xquery /tienda/juegos");
                   
                    $xslDoc = new DOMDocument();
                    $xslDoc->load('../xslt/all.xslt');
                  
                    $xmlDoc = new DOMDocument();
                    $xmlDoc->loadXML($xmlStr);
                  
                    $proc = new XSLTProcessor();
                    $proc->importStyleSheet($xslDoc);
                    $html = $proc->transformToXML($xmlDoc);
                    
                    echo $html;
                  
                    $session->close();
                    ?>