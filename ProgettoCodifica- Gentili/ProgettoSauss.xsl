<xsl:stylesheet version="1.0" 
    xmlns="http://www.w3.org/1999/xhtml" 
    xmlns:html="http://www.w3.org/1999/xhtml" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei ="http://www.tei-c.org/ns/1.0"
    >

<xsl:output method="html" version="5.0" indent="yes"/>

<!-- MAIN  --> 
<xsl:template match="/">


  <html>
     <head>
      <link rel="stylesheet" type="text/css" href="stileSauss.css"/>
      <script type="text/javascript" language="javascript">
        function visualizza(id1,id2){
          
          if (document.getElementById(id1))
          {
            if(document.getElementById(id1).style.display == 'block')
              {
                document.getElementById(id1).style.display = 'none';
              }else{
                document.getElementById(id1).style.display = 'block';
                        }
                        
          }
          if (document.getElementById(id2))
          {
            if(document.getElementById(id2).style.display == 'none')
              {
                document.getElementById(id2).style.display = 'block';
              }else{
                document.getElementById(id2).style.display = 'none';
                        }
                        
          }
         
         }
         
        </script>
     </head>
  
  <body>

    <xsl:apply-templates select="//tei:titleStmt/tei:title"/><!-- TITOLO  --> 

    <xsl:apply-templates select="//tei:idno"/><!-- DESCRIZIONE  --> 

    <xsl:apply-templates select="//tei:surrogates//tei:listBibl"/><!-- Bibliografia  -->

    

    <!-- PAG7  -->
    <hr />
    <h2>Pagina 7</h2>
    <div class="p7">
      <xsl:apply-templates select="//tei:surface[@xml:id='facspp7']"/> <!--IMG PAG7 -->
      <xsl:apply-templates select="//tei:div[@xml:id='page7']"/>
      
      <!--TESTO PAG7  -->
    </div>

    <div id="notes7"> 
        <h3>Note</h3>
        <xsl:apply-templates select="//tei:div[@type='notes_7']" /> <!-- NOTE PAG7-->
    </div>

    <div id="gloss7">
        <h3>Glosse</h3>
        <xsl:apply-templates select="//tei:div[@type='list_7']//tei:list[@type='terminology']//tei:item"/> <!--GLOSSE PAG7-->
    </div>


    <!-- PAG8  -->
    <hr />
    <h2>Pagina 8</h2>
    <div class="p8">
      <xsl:apply-templates select="//tei:surface[@xml:id='facspp8']"/><!--IMG  PAG8 -->
      <xsl:apply-templates select="//tei:div[@xml:id='page8']"/><!--TESTO PAG8  -->
    </div>
      <div id="notes8">
        <h3>Note</h3>
        <xsl:apply-templates select="//tei:div[@type='notes_8']" /> <!-- NOTE PAG8-->
    </div>

    <div id="gloss8">
        <h3>Glosse</h3>
        <xsl:apply-templates select="//tei:div[@type='list_8']//tei:list[@type='terminology']//tei:item"/> <!--GLOSSE PAG8-->
    </div>

    <div class="piepagina">
      <h3>PROLUSIONI ALL’UNIVERSITÀ DI GINEVRA</h3>
      <p><xsl:apply-templates select="//tei:titleStmt/tei:respStmt[@xml:id='trascr']" /></p>
        <p><xsl:apply-templates select="//tei:sourceDesc/tei:bibl/tei:ref" /></p>
        <p><xsl:apply-templates select="//tei:sourceDesc/tei:bibl/tei:availability/tei:licence" /></p>
        
    </div>
  </body>
  </html>
</xsl:template> 


<!-- //////////////////////////////// --> 


<!-- TITOLO  --> 
<xsl:template  match="tei:title">
      <div id="intro"> 
      <h1>
        <xsl:value-of select="." />
      </h1>
      <h2>
        <xsl:value-of select="//tei:author" />
      </h2>
      <h3>
        <xsl:apply-templates select="//tei:editionStmt" /><!--editori-->
      </h3>
      </div>
  </xsl:template>
<!-- //////////////////////////////// --> 


<!-- DESCRIZIONE --> 
<xsl:template  match="tei:idno">
      <div id="infoManoscritto"> 
      <p>
        <h3>informazioni sul manoscritto</h3>
        <b>Identificatore: </b><xsl:value-of select="."/> <br></br>
        <b>Deposito: </b><xsl:value-of select="//tei:repository"/><br></br>
        <b>Dimensione: </b><xsl:value-of select="//tei:extent"/><br></br>
        <b>Origine: </b><xsl:value-of select="//tei:origin"/><br></br>
        <b>Provenienza: </b><xsl:value-of select="//tei:provenance"/><br></br>
        <b>Acquisizione: </b><xsl:value-of select="//tei:acquisition"/><br></br>
        <b>Realizzazione a mano: </b><xsl:value-of select="//tei:handNote"/><br></br>
      
      
      </p>
      </div>
     
  </xsl:template>
<!-- //////////////////////////////// --> 
<xsl:template  match="tei:listBibl">
      <div id="infoBibl"> 
      <p>
        <h3>Bibliografia</h3>
        <xsl:variable name="Link" select="//tei:bibl[@xml:id='bibl1']//tei:ptr/@target" />
        <a href="{$Link}"> <xsl:value-of select="//tei:bibl[@xml:id='bibl1']//tei:title"/> </a><br></br>
        <xsl:value-of select="//tei:bibl[@xml:id='bibl1']//tei:note[@xml:id ='notebibl1']"/>
        <br></br><br></br>

        <xsl:variable name="Link2" select="//tei:bibl[@xml:id='bibl2']//tei:ptr/@target" />
        <a href="{$Link2}"><xsl:value-of select="//tei:bibl[@xml:id='bibl2']//tei:title"/></a><br></br>
        <xsl:value-of select="//tei:bibl[@xml:id='bibl2']//tei:note[@xml:id ='notebibl2']"/>
        <br></br>
      
      </p>
      </div>
     
  </xsl:template>

<!-- PAGINA P7 -->
<xsl:template match="//tei:div[@xml:id='page7']">
 <div id="testoP7">
  <button onclick="visualizza('trad7','testo7'); return false">Traduzione</button>
  <h4><xsl:value-of select="tei:head/tei:num"/></h4>
  <p id="testo7">
    <xsl:for-each select="//tei:seg[@type='line7']">
     <xsl:value-of select="."/>
     <xsl:call-template name="ancora7"></xsl:call-template>
     <xsl:call-template name="dividi"></xsl:call-template>
    </xsl:for-each>
  </p>
  <p style="display:none" id="trad7">Quel che è 
    chiaro, come mille volte abbiamo ripetuto, è che 
    l’uomo senza linguaggio sarebbe forse l’uomo, ma 
    non sarebbe un essere che si avvicina nemmeno 
    approssimativamente all’uomo che noi conosciamo 
    e che siamo, perché il linguaggio è stato il più 
    formidabile motore d’azione collettiva da una parte, 
    e di educazione individuale dall’altra, strumento 
    senza il quale di fatto l’individuo o la specie non 
    avrebbero potuto nemmeno aspirare a sviluppare in 
    nessun senso le proprie facoltà innate.</p>
    <br></br>
  </div>
</xsl:template>

    <!-- note pag7  --> 
    <xsl:template match="//tei:div[@type='notes_7']//tei:note">
    <xsl:call-template name="ancornote7"></xsl:call-template><xsl:value-of select="." />
    </xsl:template>

<!-- glosse p7  --> 
<xsl:template match="//tei:div[@type='list_7']//tei:list[@type='terminology']//tei:item">
  <b><xsl:value-of select="tei:term"/></b>:
  <p><xsl:value-of select="tei:gloss"/></p>
 
</xsl:template>

<!-- PAGINA P8 -->
<xsl:template match="//tei:div[@xml:id='page8']">
 <div id="testoP8">
  <button onclick="visualizza('trad8','testo8'); return false">Traduzione</button>
  <h4><xsl:value-of select="tei:head/tei:num"/></h4>
  <p id="testo8">
    <xsl:for-each select="//tei:seg[@type='line8']">
     <xsl:value-of select="."/>
     <xsl:call-template name="ancora8"></xsl:call-template>
     <xsl:call-template name="dividi"></xsl:call-template>
    </xsl:for-each>
  </p>
  <p style="display:none" id="trad8">
    Qui si presenta quest’obiezione, secondo noi 
più o meno fondata: ma allora tu trasformi lo studio 
delle lingue nello studio del linguaggio considerato 
come facoltà dell’uomo, come uno dei segni 
distintivi della sua specie, come carattere 
antropologico o per così dire zoologico.Signori, 
si tratta qui d’un punto sul quale dovrei disporre 
d’un tempo considerevole per esporre, sviluppare e 
giustificare il mio punto di vista, che non è altro che 
quello di tutti i linguisti al giorno d’oggi: e cioè che 
lo studio del linguaggio come fatto umano è tutto o 
quasi tutto ricompreso nello studio delle lingue.Il 
fisiologo, lo psicologo e il logico potranno dissertare 
a lungo, il filosofo potrà poi riprendere i risultati 
combinati della logica, della psicologia e della 
fisiologia: mai, mi permetto di dire, i più elementari 
fenomeni del linguaggio saranno subodorati, o 
chiaramente intuiti, classificati e compresi, se non si 
ricorre in prima e in ultima istanza allo studio delle 
lingue.Lingua e linguaggio non sono che una 
medesima cosa; l’uno è la generalizzazione 
dell’altra.Voler studiare il linguaggio
  </p>
  
  </div>
</xsl:template>



<!-- glosse p8  --> 
<xsl:template match="//tei:div[@type='list_8']//tei:list[@type='terminology']//tei:item">
  <b><xsl:value-of select="tei:term"/></b>:
  <p><xsl:value-of select="tei:gloss"/></p>
 
</xsl:template>
<!-- //////////////////////////////// --> 




<!-- note pag8  --> 
<xsl:template match="//tei:div[@type='notes_8']//tei:note">
  <xsl:call-template name="ancornote8"></xsl:call-template><xsl:value-of select="." />
</xsl:template>

<!-- AGGIUNGE SPAZIO QUANDO TROVA UN LB-->

<xsl:template name="dividi" match="//tei:lb[@facs]">
<xsl:variable name="Id" select="tei:lb/@facs"/>
<xsl:variable name="Link" select="concat('', $Id)"/>
<a name="{$Id}" id="alb" href="{$Link}"><xsl:value-of select="concat(' [', $Id, '] ')"/></a>
 <br></br>
 <br></br>
 </xsl:template>
 

<!--ancora nel p 7-->
<xsl:template  name="ancora7" match="//tei:seg[@type='line7']">
  <xsl:if test="tei:ptr[@target]">
  <xsl:variable name="Id" select="tei:ptr/@target"/>
  <xsl:variable name="Link" select="concat('', $Id)"/>
  <a name="{$Id}" href="{$Link}" ><xsl:value-of select="concat('[',$Id,']')"/></a>
  </xsl:if>
</xsl:template>

<!--ancora nelle note 7 -->
<xsl:template name="ancornote7" match="//tei:div[@type='notes_7']">
        <xsl:for-each select="//tei:div[@type='notes_7']//tei:note">
          <xsl:sort select="@xml:id"/>
          <xsl:variable name="Id" select="@xml:id"/>
          <xsl:variable name="Link" select="concat('##', $Id)"/>
            <ul><li><a name="{$Id}" href="{$Link}"><xsl:value-of select="concat(' [', $Id, '] ')"/></a>
            <xsl:value-of select="."/></li></ul>
        </xsl:for-each>
  </xsl:template>

<!--ancora nel p 8 -->
<xsl:template  name="ancora8" match="//tei:seg[@type='line8']">
  <xsl:if test="tei:ptr[@target]">
  <xsl:variable name="Id" select="tei:ptr/@target"/>
  <xsl:variable name="Link" select="concat('', $Id)"/>
  <a name="{$Id}" href="{$Link}" ><xsl:value-of select="concat('[',$Id,']')"/></a>
  </xsl:if>
</xsl:template>

<!--ancora nelle note 8 -->
<xsl:template name="ancornote8" match="//tei:div[@type='notes_8']">
        <xsl:for-each select="//tei:div[@type='notes_8']//tei:note">
          <xsl:sort select="@xml:id"/>
          <xsl:variable name="Id" select="@xml:id"/>
          <xsl:variable name="Link" select="concat('##', $Id)"/>
            <ul><li><a name="{$Id}" href="{$Link}"><xsl:value-of select="concat(' [', $Id, '] ')"/></a>
            <xsl:value-of select="."/></li></ul>
        </xsl:for-each>
  </xsl:template>

<!--FOOTER-->
<xsl:template match="//tei:editionStmt">
<xsl:value-of select="//tei:resp"/>
        <br></br>
        <xsl:value-of select="//tei:name[@ref='#JG']"/>
        <br></br>
        <xsl:value-of select="//tei:name[@ref='#WB']"/>
        <br></br>
        <br></br>

</xsl:template>

<xsl:template match="//tei:titleStmt/tei:respStmt[@xml:id='trascr']">
<b>Edizione Francese a cura di</b>
  <br />
  <b><xsl:value-of select="//tei:name[@ref='#SB']" /></b>
    e <b><xsl:value-of select="//tei:name[@ref='#RE']" /></b>
</xsl:template>

<xsl:template match="//tei:sourceDesc/tei:bibl/tei:ref">
  <xsl:variable name="Link" select="."/>
  <a href="{$Link}">Link archivio</a>
</xsl:template>

<xsl:template match="//tei:sourceDesc/tei:bibl/tei:availability/tei:licence">
  <xsl:variable name="Link" select="@target"/>
  <a href="{$Link}"><xsl:value-of select="." /></a>
</xsl:template>

<!--zone7-->
<xsl:template match="//tei:surface[@xml:id='facspp7']//tei:graphic">
    <img id="imgP7" width="768" height="810" usemap="#map1">
          <xsl:attribute name="src">
            <xsl:value-of select="@url"/>
          </xsl:attribute>
    </img>
    <map name="map1">
    <xsl:for-each select="//tei:surface[@xml:id='facspp7']//tei:zone">
    <xsl:variable name="Id" select="@xml:id" />
    <xsl:variable name="ulx" select="@ulx" />
    <xsl:variable name="uly" select="@uly" />
    <xsl:variable name="lrx" select="@lrx" />
    <xsl:variable name="lry" select="@lry" />
    <xsl:variable name="Link" select="concat('##', $Id)" />
    <area shape="rect" id="{$Id}" coords="{$ulx},{$uly},{$lrx},{$lry}" href="{$Link}" />
    <xsl:value-of select="." />
    </xsl:for-each>
    </map>
</xsl:template>

<!--zone8-->
<xsl:template match="//tei:surface[@xml:id='facspp8']//tei:graphic">
    <img id="imgP8" width="872" height="920" usemap="#map2">
          <xsl:attribute name="src">
            <xsl:value-of select="@url"/>
          </xsl:attribute>
    </img>
    <map name="map2">
    <xsl:for-each select="//tei:surface[@xml:id='facspp8']//tei:zone">
    <xsl:variable name="Id" select="@xml:id" />
    <xsl:variable name="ulx" select="@ulx" />
    <xsl:variable name="uly" select="@uly" />
    <xsl:variable name="lrx" select="@lrx" />
    <xsl:variable name="lry" select="@lry" />
    <xsl:variable name="Link" select="concat('##', $Id)" />
    <area shape="rect" id="{$Id}" coords="{$ulx},{$uly},{$lrx},{$lry}" href="{$Link}" />
    <xsl:value-of select="." />
    </xsl:for-each>
    </map>
</xsl:template>

</xsl:stylesheet>