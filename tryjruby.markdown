---
layout: main
title: Try JRuby!
---
# Try JRuby!

JRuby is very versatile when it comes to deploying, so there's a number of ways you can try it right now!

## TryRuby.org

The interactive tutorial at (Try Ruby)[tryruby.org] runs atop a sandboxed, server-side instance of JRuby.

Note that this version may lag behind official releases, but it gives you a general feel for what interactive JRuby is like.

## WebStart

JRuby's interactive console, like many Java apps, can be started as a WebStart application.

You can download the console as a (WebStart JNLP file)[http://jruby.org/tryjruby/irb.jnlp] or launch it directly on some browser by clicking below:

<script src="http://www.java.com/js/deployJava.js"></script>
<script>
    // using JavaScript to get location of JNLP file relative to HTML page
    var dir = location.href.substring(0, location.href.lastIndexOf('/')+1);
    var url = dir + "tryjruby/irb.jnlp";
    deployJava.createWebStartLaunchButton(url, '1.6.0');
</script>

## Java Applet

Some browsers also support embedding Java applets via the Java browser plugin. If you can launch the applet below, you'll have a fully-interactive JRuby instance to play with.

<script language="JavaScript"><!--
function startApplet() {
    appletsource='<applet code="org.jruby.JRubyApplet.class" archive="{{ site.urls.tryjruby }}/jruby-complete-signed.jar" width="700" height="500">\n';
    appletsource+='<param name="jruby.console" value="true" />\n';
    appletsource+='<param name="jruby.banner" value="Welcome to JRuby on the Web!" />\n';
    appletsource+='<param name="jruby.eval" value="ARGV << \'-f\' << \'--readline\' << \'--prompt\' << \'simple\'; require \'irb\' ; require \'irb/completion\' ; Thread.new { IRB.start }" />\n';
    appletsource+='</applet>\n';
    document.getElementById('appletplace').innerHTML=appletsource;
}
//--></script> 

