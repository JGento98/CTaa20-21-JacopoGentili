<?xml version="1.0" encoding="UTF-8"?>
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
      <script src="funzioni.js"></script>
     </head>
  
  <body>
 
    <xsl:apply-templates select="//tei:titleStmt/tei:title"/><!-- TITOLO  --> 
    <xsl:apply-templates select="//tei:idno"/><!-- DESCRIZIONE  --> 
    <xsl:apply-templates select="//tei:additional//tei:listBibl"/><!-- BIBLIOGRAFIA  -->

    <!--legenda-->
    <hr />
    <div id="legenda">
    <h3>Legenda degli interventi editoriali</h3>
    <p>La nostra versione digitale del testo è stato suddivisa in <b>Pericopi</b> 
      seguendo la trascrizione del PDF "Prolusioni all'università di Ginevra", i tre puntini "..." indicano che la pericope inizia in un'altra pagina o finisce in un'altra. <br></br><br></br>

      Per rendere l'edizione digitale più simile al manoscritto abbiamo inserito nel testo anche le parti cancellate dall'autore che 
      non sono presenti nella trascrizione, le quali saranno individuabili come [cancellazioni] e tramite gli appositi bottoni è possibile mostrarle e nasconderle
      per rendere il testo più leggbile. Le aggiunte autoriali che si trovano ai margini della pagina o sopra una cancellatura sono state evidenziate in rosso.   <br></br><br></br>
       Per facilitare la comprensione, l'utente può cliccare sul bottone <b>"traduzione"</b> e leggere la traduzione italiana delle pagine codificate.
     <br/>
       I fenomeni testuali che sono stati riscontrati nel testo sono stati evidenziati come nella legenda:<br>

       </br> i <b>termini tecnici</b> sono evidenziati in giallo, le "n" 
       si riferiscono alle <b>note</b> sono anche queste dei link che ancorano
       il riferimento nel testo,all'apposita voce nella sezione corrispondente, raggiungibile con un click sulla parola interessata.
       <br/>
       Inoltre sono presenti delle <b>abbreviazioni</b> all'interno del testo, sarà possbile interagirvi passandoci sopra con la freccia del mouse, in quel caso verra mostrato il significato dell'abbreviazione.
   </p>
   <table>
    <tr><td><b>Aggiunte</b></td><td><span style="color:red;">Esempio</span></td></tr>
    <tr><td><b>Cancellazioni</b></td><td><span style="font-size:10px; font-style:italic;">[Cancellazione]</span></td></tr>
    <tr><td><b>Termini tecnici</b></td><td> <span style="background-color:yellow;">Esempio</span></td></tr>
    <tr><td><b>Sottolineature</b></td><td><span style="text-decoration:underline;">Esempio</span></td></tr>
  </table>
  <p id="notaLegenda"> Cliccando su una linea dell'immagine verremo rimandati sulla rispettiva linea nel testo  </p>
   </div>
    
  
    <!-- pagina 7 -->
    <hr />
    <h2>Pagina 7</h2>
    <div class="p7">
      <xsl:apply-templates select="//tei:surface[@xml:id='facspp7']"/> <!--IMG PAG7 -->
      <xsl:apply-templates select="//tei:ab[@xml:id='testopag7']"/>
    </div>
    <div id="notes7"> 
        <h3>Note</h3>
        <xsl:apply-templates select="//tei:div[@type='notes_7']" /> 
    </div>

    <div id="gloss7">
        <h3>Glosse</h3>
        <xsl:apply-templates select="//tei:div[@type='list_7']/tei:list[@type='terminology']"/> 
    </div>

      <!-- pagina 8 -->
      <hr />
      <h2>Pagina 8</h2>
      <div class="p8">
        <xsl:apply-templates select="//tei:surface[@xml:id='facspp8']"/> <!--IMG PAG7 -->
        <xsl:apply-templates select="//tei:ab[@xml:id='testopag8']"/>
      </div>
      <div id="notes8">
        <h3>Note</h3>
        <xsl:apply-templates select="//tei:div[@type='notes_8']" /> 
    </div>

    <div id="gloss8">
        <h3>Glosse</h3>
        <xsl:apply-templates select="//tei:div[@type='list_8']/tei:list[@type='terminology']"/> 
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
<xsl:template  match="tei:titleStmt//tei:title">
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

<!-- BIBLIOGRAFIA --> 
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
<!-- //////////////////////////////// --> 


<!-- testo P7 --> 
<xsl:template match="//tei:ab[@xml:id='testopag7']">
 <div id="testoP7">
 <button onclick="visualizza('trad7','testo7'); return false">Traduzione</button>
 <button onclick="pulisci();">Rimuovi cancellazioni</button>
 <button onclick="mostra();">mostra cancellazioni</button>
      <h4><xsl:value-of select="//tei:head/tei:num"/></h4>
      <p id="testo7">
      <xsl:apply-templates select="//tei:seg[@xml:id='pericope1_7']" />
      </p>
      <p style="display:none" id="trad7">
      <xsl:value-of select="//tei:div[@type='traduzione7']" />
      </p>
  </div>
</xsl:template>

<!--match pericope pagina 7-->
<xsl:template match="//tei:seg[@xml:id='pericope1_7']">
 <xsl:apply-templates />
 <xsl:if test="//tei:seg[@xml:id='pericope1_7']/tei:lb[@facs]">
      <xsl:call-template name="dividi"></xsl:call-template>
</xsl:if>
<xsl:if test="//tei:ptr[@target]">
    <xsl:call-template name="ancora"></xsl:call-template>
</xsl:if>
<xsl:if test="//tei:choice">
 <xsl:call-template name="abbrexp"></xsl:call-template>
 </xsl:if>
</xsl:template>

<!--glosse e termini pagina 7-->
<xsl:template match="//tei:div[@type='list_7']/tei:list[@type='terminology']">
    <xsl:for-each select="//tei:div[@type='list_7']/tei:list[@type='terminology']/tei:item">
    <xsl:variable name="Id" select="tei:term/@xml:id" />
    <a name="{$Id}"><b><xsl:value-of select="tei:term"/></b>:</a>
    
      <p><xsl:value-of select="tei:gloss"/></p>
      </xsl:for-each>
</xsl:template>

 <!-- IMG p7 --> 
<xsl:template match="//tei:surface[@xml:id='facspp7']//tei:graphic">
    <img alt="imgP7" width="768" height="810" usemap="#map1">
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
            <area class = "a1" onmouseover="document.getElementById('{$Id}').style.backgroundcolor='red';"  shape="rect" id="{$Id}" coords="{$ulx},{$uly},{$lrx},{$lry}" href="{$Link}" />
        <xsl:value-of select="." />
      </xsl:for-each>
    </map>
</xsl:template>


<!--pagina 8-->
<xsl:template match="//tei:ab[@xml:id='testopag8']">
 <div id="testoP8">
      <button onclick="visualizza('trad8','testo8'); return false">Traduzione</button>
      <button onclick="pulisci();">Rimuovi cancellazioni</button>
      <button onclick="mostra();">mostra cancellazioni</button>
      <h4><xsl:value-of select="//tei:body[@n='2']/tei:head/tei:num"/></h4>
      <p id="testo8">
        <xsl:apply-templates select="//tei:ab[@xml:id='testopag8']/tei:seg[@type='pericope8']" />
      </p>
      <p style="display:none" id="trad8">
      <xsl:apply-templates select="//tei:div[@type='traduzione8']" />
      </p>
  </div>
</xsl:template>


<!--match su pericope_8-->

<xsl:template match="//tei:ab[@xml:id='testopag8']/tei:seg[@type='pericope8']">
 <xsl:apply-templates /> 
 <br />
      <xsl:call-template name="dividi"></xsl:call-template>
       <xsl:call-template name="ancora"></xsl:call-template>
        <xsl:call-template name="abbrexp"></xsl:call-template>
</xsl:template>


<!--glosse pagina 8-->
<xsl:template match="//tei:div[@type='list_8']/tei:list[@type='terminology']">
  <xsl:for-each select="//tei:div[@type='list_8']/tei:list[@type='terminology']/tei:item">
    <xsl:variable name="Id" select="tei:term/@xml:id" />
    <a name="{$Id}"><b><xsl:value-of select="tei:term"/></b>:</a>
  
  <p><xsl:value-of select="tei:gloss"/></p>
  </xsl:for-each>
 </xsl:template>

 <!-- IMG p8 --> 
<xsl:template match="//tei:surface[@xml:id='facspp8']//tei:graphic">
    <img alt="imgP8" width="768" height="810" usemap="#map2">
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
            <area class="a2" shape="rect" title="{$Id}" coords="{$ulx},{$uly},{$lrx},{$lry}" href="{$Link}" />
        <xsl:value-of select="." />
      </xsl:for-each>
    </map>
</xsl:template>



<!--funzioni generali-->
<xsl:template name="dividi" match="//tei:lb[@facs]">
<br  />
<xsl:variable name="Id" select="@facs"/>
<xsl:variable name="Link" select="concat('', $Id)"/>
<xsl:text>&#160;</xsl:text><a name="{$Id}" href="{$Link}"><xsl:value-of select="substring-after($Id, '#')" /></a>

</xsl:template>

<!--dividi pericope trad8-->
<xsl:template match="//tei:div[@type='traduzione8']">
<xsl:apply-templates select="//tei:seg[@type='pericopetrad_8']" />
</xsl:template>

<xsl:template match="tei:seg[@type='pericopetrad_8']">
<xsl:apply-templates />
<br />
<br />
</xsl:template>

<!--cancellazioni-->
<xsl:template name="del" match="tei:seg//tei:del">
    <xsl:text>&#160;</xsl:text><em class="del" style="font-size:10px; font-style:italic;">[Cancellazione]</em>
</xsl:template>

<!--aggiunte-->
<xsl:template name="add" match="//tei:seg//tei:add">
   <xsl:text>&#160;</xsl:text> 
   <span style="color:red;"><xsl:value-of select="."/>
  </span>
</xsl:template>

<!--sottolineatura-->
<xsl:template name="sottolinea" match="//tei:seg//tei:hi">
    <xsl:text>&#160;</xsl:text><span style="text-decoration:underline;"><xsl:value-of select="."/></span>
</xsl:template>

<!--collegamento termini-->
<xsl:template name="evidenziaTerm" match="//tei:seg//tei:term">
 <xsl:variable name="Id" select="@ref"/>
  <xsl:variable name="Link" select="concat('', $Id)"/>
  <span style="background-color:yellow;"><a name="{$Id}" href="{$Link}" ><xsl:value-of select="."/></a></span>   
</xsl:template>

<!--choice / espansioni abbreviazioni-->
<xsl:template name="abbrexp" match="//tei:choice">
  <xsl:variable name="idExt" select="tei:expan/@n"/>
  <span id="{$idExt}" class="exp" style="display:none;" href="javascript:void(0);"><xsl:value-of select="tei:expan"/></span>
  
  <xsl:variable name="idAbbr" select="//tei:abbr/@n"/>
  <a class="abbr" id="{$idAbbr}" onmouseout="document.getElementById('{$idExt}').style.display='none';" onmouseover="document.getElementById('{$idExt}').style.display='inline';" ><xsl:value-of select="tei:abbr"/></a>
</xsl:template>

<!-- ancore 7 nel testo collegate alle note-->

<xsl:template  name="ancora" match="//tei:ptr[@target]"> 
  <xsl:variable name="Id" select="@target"/>
  <xsl:variable name="Link" select="concat('', $Id)"/>
  <xsl:text> &#160; </xsl:text><a name="{$Id}" href="{$Link}" ><xsl:value-of select="substring-after($Id, '#')"/></a>
</xsl:template>

<!--ancore delle note collegate al testo7-->
<xsl:template name="ancornote7" match="//tei:div[@type='notes_7']">
        <xsl:for-each select="//tei:div[@type='notes_7']//tei:note">
          <xsl:sort select="@xml:id"/>
          <xsl:variable name="Id" select="@xml:id"/>
          <xsl:variable name="Link" select="concat('##', $Id)"/>
            <ul><li><a name="{$Id}" href="{$Link}"><xsl:value-of select="concat(' [', $Id, '] ')"/></a>
            <xsl:value-of select="."/></li></ul>
        </xsl:for-each>
  </xsl:template>

<!-- ancore delle note 8 collegate al testo-->
<xsl:template name="ancornote8" match="//tei:div[@type='notes_8']">
        <xsl:for-each select="//tei:div[@type='notes_8']//tei:note">
          <xsl:sort select="@xml:id"/>
          <xsl:variable name="Id" select="@xml:id"/>
          <xsl:variable name="Link" select="concat('##', $Id)"/>
            <ul><li><a name="{$Id}" href="{$Link}"><xsl:value-of select="concat(' [', $Id, '] ')"/></a>
            <xsl:value-of select="."/></li></ul>
        </xsl:for-each>
  </xsl:template>

  <!--informazioni dell'intestazione-->
<xsl:template match="//tei:editionStmt">
  <xsl:value-of select="//tei:resp"/>
        <br></br>
        <xsl:value-of select="//tei:name[@ref='#JG']"/>
        <br></br>
        <xsl:value-of select="//tei:name[@ref='#WB']"/>
        <br></br>
        <br></br>
</xsl:template>

<!--pie di pagina-->
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

</xsl:stylesheet>