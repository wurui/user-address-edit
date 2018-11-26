<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:import href="mod.xsl" />
  <xsl:output method="html" doctype-public="" encoding="UTF-8"/>

  <xsl:template match="/root">
    <html env="{env/domain}" uid="{login/uid}">
      <head>
        <meta name="viewport" content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no"/>
        <title><xsl:value-of select="p/title"/></title>
        <link rel="stylesheet" type="text/css" href="http://a.oxm1.cc/css/ea.css" />
        <link rel="stylesheet" type="text/css" href="../asset/index.css?{generate-id(.)}" />
        <script src="http://l.oxm1.cc/3rd/require.js"></script>
      </head>
      <body>
        <oxpage>
        <div class="layout">
          <xsl:call-template name="wurui.user-address-edit" />
        </div>
      </oxpage>
        <script><![CDATA[
          require.config({
            urlArgs:function(id,url){
              if(/^https?:/.test(url)){
                return ''
              }
              return '?r='+Math.random()
            },

            paths: {
              jquery: 'http://l.oxm1.cc/3rd/jquery',
              zepto: 'http://l.oxm1.cc/3rd/zepto.min',
            },
            packages:[{name:"oxm",location:'https://a.oxm1.cc/oxm'},{name:'oxjs',location:'http://a.oxm1.cc/js/oxjs',main:'index-dev.js'}]
          });
          require(['zepto','oxjs','../asset/index'],function(undefine,oxjs,Mod){
          Mod && Mod.init && Mod.init($('.J_OXMod'));
          })
        ]]></script>
      </body>

    </html>
  </xsl:template>

</xsl:stylesheet>
