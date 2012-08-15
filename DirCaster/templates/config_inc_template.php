<?php
//============================================================================
// DirCaster specific variables (CHANGE the items below to match YOUR feed)
// Required by dircaster.php
//============================================================================

  // Podcast Title Variable
  $titleTAG       = "REPLACE_TITLE";
  // Podcast Discription
  $descriptionTAG = "b3caster feeds on other podcasts! All rights goes to them!";
  // Your Podcast Website URL
  $linkTAG        = "REPLACE_LINK";
  // Atom link tag - This should be the exact name of the URL
  // (including the script name) due to the rel="self" attribute
  // 'http://.../dircaster.php' or 'http://.../some folder/dircaster.php'
  $linkAtomTAG    = "$linkTAG";
  // The following settings can be used to increase or decrease
  // The date/time rendered for pubDate and buildDate
  // Possible use would be to compensate for a faultily web server time
  // as it relates to annual time shifts.
  // NOTE: Only one should be set to TRUE
  // If both are FALSE, then normal current server time is used (default)
  $timeAdjstMinus  = FALSE; // reduces the two dates by 1 hour, if TRUE
  $timeAdjstPlus   = FALSE; // increases the two dates by 1 hour, IF TRUE
  // The directory where the podcast data is located. This has to be relative
  // to the directory of dircast, as it has to be accessable from clients.
    $mediaDir       = "REPLACE_MEDIA_DIR";
  // For iTunes "New Feed" feature - to change your URL for the feed - should it
  // ever be necessary - also set the "$NEWfeedURL_ON" value to "yes" to
  // activate it.
  $NEWfeedURL     = "REPLACE_LINK";
  $NEWfeedURL_ON  = "yes";
  // Your Copyright String
  $copyrightTAG   = "b3caster";
  // Podcast Language Tag
  $languageTAG    = "en-us";
  // Site Webmaster E-mail Address
  $webMasterTAG   = "b3caster@paapereira.com (b3caster)";
  // Give The DirCaster Project some "props!"
  $generatorTAG   = "b3caster is based on DirCaster V0.9h - www.DirCaster.org";
  // "Time to Live"
  $ttlTAG         = "60";
  // Your image should be 600 by 600 pixels - (gif, jpg, or png)
  $rssImageUrlTAG   = "REPLACE_IMAGE_FILE";
  // Image Tag
  $rssImageTitleTAG = "$titleTAG";
  // Image Link
  $rssImageLinkTAG = $linkTAG;
  // Set the "maxFeeds" variable to the number of podcasts you want displayed
  // in the feed when it is accessed... in this way, you can limit the number
  // shown, speeding up execution.
  $maxFeeds         = "250";
  // Set the "enclosurePrefix" variable to allow redirect bia another site
  // Such as a stats analysis via an external provider, such as
  // Raw Voice Media's TechPodcasts
  // or Blubrry Stats System.  Leave as '' for no enclosure.
  $enclosurePrefix  = '' ;
  //$enclosurePrefix  = '' ; // for no redirect
  // Allowed File Types in Feed URL
  $sftypes = "(.m4v .mp3 .m4a .m4b .asf .wma .avi .mov .mp4)";
  // location of the "getid3" library - should be the default unless you changed
  // it in your directory structure.
  $id3LibPath       = "./lib_getid3/getid3/getid3.php";
  // file extension of itme override file
  $descriptionsFileType = '.txt';
  // Delimiter
  $delim1 = ' ';
  //---------------------------------------------------------------------------
  // iTunes specific tags below - See iTunes RSS feed tech info for details at:
  // http://www.apple.com/itunes/store/podcaststechspecs.html#_Toc526931674
  // iTunes specific tags
  //---------------------------------------------------------------------------
  $iTunesNameSpace = "xmlns:itunes=\"http://www.itunes.com/dtds/podcast-1.0.dtd\"";
  $atomNameSpace   = "xmlns:atom=\"http://www.w3.org/2005/Atom\"";
  // To satisfily the feed validator. Make $atomNameSpace = '' to drop Atom
  $nameSpaceTAG = $iTunesNameSpace . ' ' . $atomNameSpace;

  //-- Explict Tag options: "yes" = IS Explicit, "no" = Not saying one way or
  //-- another, "clean" = Is a "G" rated clean feed suitable for kids.
  $explicitTAG    = "clean";
  $summaryTAG     = "b3caster feeds on other servers! All rights goes to them!";
  $authorTAG      = "b3caster";
  $ownerNameTAG   = "b3caster";
  $ownerEmailTAG  = "b3caster@paapereira.com (b3caster)";
  $topCategoryTAG = "Technology";
  $subCategoryTAG = "Tech News";
  $keywordTAG     = "Linux Action Show, Linux, Jupiter Broadcasting, TWIT";
  $imageUrlTAG    = "REPLACE_IMAGE_FILE";
  $imageTitleTAG  = "Your Logo Info";
  $imageLinkTAG   = "http://bontemps.myownb3.com/b3caster";
  $imageItemTAG   = "no";
//============================================================================
//
// end of DirCaster Variables.
//
//============================================================================
?>
