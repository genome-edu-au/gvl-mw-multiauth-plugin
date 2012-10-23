gvl-mw-multiauth-plugin
=======================

Mediawiki MultiAuth Plugin for the Genomics VL Wiki (https://genome.edu.au/)

The MultiAuthPlugin provides Shibboleth SSO suport for Mediawiki.

The GVL uses this for AAF (http://aaf.edu.au) logins to the GVL wiki.
Some changes to the original code were made:

- to support the AAF attributes the GVL Service Provider requests
- to change the text 
- to support MW 1.19


MultiAuthPlugin for Mediawiki
=============================

- MediaWiki MultiAuth website: http://www.mediawiki.org/wiki/Extension:MultiAuthPlugin
- MultiAuth website:           http://multiauth.berlios.de/
- MultiAuthPlugin svn repo:    http://developer.berlios.de/svn/?group_id=11296

The software is licenced under the GPLv3: http://svn.berlios.de/wsvn/multiauth/trunk/src/main/php/COPYING

Notes
=====

- You might find caching problems with some browsers like Chrome when users log in and view a page they already viewed while logged out. the 'if-modified-since' request header seems to override the 'Vary:Cookies' response header for caching. Mediawiki code in includes/OutputPage.php has a  function checkLastModified( $timestamp ) which ignores the wikidbUserID cookie has changed when checking if the page has changed. Mediawiki responds with 304 Not Modified. Chrome seems to ignore the fact that the cookie for the wikidbUserID has been set (its not present when user logged out), and so displays the wrong cached page - the one for the logged-out page where the cookie is absent.
 - The workaround seems to be to edit your LocalSettings.php to bypass the Mediawiki code for checkLastModified() by setting this variable:
    $wgCachePages = false;
