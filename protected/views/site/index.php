<?php
/* @var $this SiteController */
$this->pageTitle = Yii::app()->name;

/**
 * Variables specific to yiitube widget
 **/
//TODO JCT récupérer videoCode + videoSource depuis bdd
//video code or complete url
$currentVideoCode = "Zg4WkbA7LU8";

//possible values: youtube, megavideo, vimeo, veoh
$currentVideoSource = "youtube";

/*Possible values for youtube:
small 560x349
normal 640x390
big 853x510
huge 1280x750*/
//TODO JCT update playerSize en fonction de la taille de la fenêtre
$playerSize = "big";

//TODO JCT dégager inline css de cette page. Attention à la width variable du div videoPlayer
?>

<!--<h1><?php echo CHtml::encode(Yii::app()->name); ?> Player</h1>-->

<div id="videoPlayer" style="margin-left:auto; margin-right:auto; width:853px;">
    <?php $this->widget('ext.Yiitube', array('player' => $currentVideoSource, 'v' => $currentVideoCode, 'size' => $playerSize)); ?>
</div>

<?php //TODO JCT intégrer panel des épisodes de la série en cours + dernières vidéos ajoutées + vidéos populaires ?>

<!--
<br/>
<ul>
    <li>Layout file: <code><?php echo $this->getLayoutFile('main'); ?></code></li>
</ul>

<p>For more details on how to further develop this application, please read
    the <a href="http://www.yiiframework.com/doc/">documentation</a>.
    Feel free to ask in the <a href="http://www.yiiframework.com/forum/">forum</a>,
    should you have any questions.</p>

-->