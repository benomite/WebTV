    <?php
/* @var $this SiteController */
$this->pageTitle = "weexbe TV Player";

/** add css & js needed by the video slider */
$script = Yii::app()->getClientScript();
$script->registerScriptFile(Yii::app()->request->baseUrl + "js/jquery-1.8.3.js",CClientScript::POS_HEAD);

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
$playerSize = "small";


//$videoArray = $this->$dataProvider->getData();

/*$videoArray = array (
    "video 1a" => "http://www.youtube.com/watch?v=QBBWKvY-VDc",
    "video 2" => "http://www.youtube.com/watch?v=ZXMQqLnRhRI",
    "video 3" => "http://youtu.be/L0CsLefLisE",
    "video 4"=> "http://youtu.be/L0CsLefLisE"
);*/

//TODO JCT dégager inline css de cette page. Attention à la width variable du div videoPlayer
?>

<div id="videoPlayer" style="margin-left:auto; margin-right:auto; width:853px;">
    <?php $this->widget('ext.Yiitube', array('player' => $currentVideoSource, 'v' => $currentVideoCode, 'size' => $playerSize)); ?>
</div>

<div id="videoSlider">
    <ul>
        <?php foreach ($dataProvider->getData() as $episode)
    {
        echo "<li><a href='$episode->title'>$episode->video</a></li>";
    }?>
    </ul>
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