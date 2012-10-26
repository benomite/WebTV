<?php
$baseUrl = Yii::app()->theme->baseUrl; 
$cs = Yii::app()->getClientScript();
$cs->registerCssFile($baseUrl.'/css/icons.css');
  
$this->pageTitle=Yii::app()->name . ' - Buttons & Icons';
$this->breadcrumbs=array(
	'Buttons & Icons',
);
?>
<h1>Buttons & Icons</h1>
<?php $this->beginWidget('zii.widgets.CPortlet', array(
				'title'=>'<span class="icon icon-brick">Button Styles</span>',
			));
?>
<div class="flash-notice">There are 5 button colors and over <strong>1000</strong> small icons to choose from.</div>
<div class="button_list">
<ul>
<li><?php echo CHtml::link('<span class="icon icon-accept">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'blue')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-anchor">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'blue')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-tick">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'blue')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-disk">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'blue')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-delete">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'blue')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-error">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'blue')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-lightbulb">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'blue')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-status_online">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'blue')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-status_offline">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'blue')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-status_busy">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'blue')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-status_away">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'blue')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-sound_low">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'blue')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-rss_go">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'blue')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-printer">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'blue')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-plugin">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'blue')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-phone_delete">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'blue')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-paintbrush">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'blue')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-note">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'blue')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-new">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'blue')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-money_add">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'blue')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-magnifier">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'blue')); ?></li>

</ul>

<ul>
<li><?php echo CHtml::link('<span class="icon icon-accept">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'green')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-anchor">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'green')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-tick">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'green')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-disk">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'green')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-delete">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'green')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-error">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'green')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-lightbulb">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'green')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-status_online">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'green')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-status_offline">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'green')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-status_busy">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'green')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-status_away">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'green')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-sound_low">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'green')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-rss_go">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'green')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-printer">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'green')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-plugin">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'green')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-phone_delete">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'green')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-paintbrush">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'green')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-note">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'green')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-new">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'green')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-money_add">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'green')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-magnifier">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'green')); ?></li>

</ul>


<ul>
<li><?php echo CHtml::link('<span class="icon icon-accept">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'yellow')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-anchor">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'yellow')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-tick">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'yellow')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-disk">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'yellow')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-delete">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'yellow')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-error">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'yellow')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-lightbulb">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'yellow')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-status_online">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'yellow')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-status_offline">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'yellow')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-status_busy">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'yellow')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-status_away">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'yellow')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-sound_low">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'yellow')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-rss_go">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'yellow')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-printer">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'yellow')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-plugin">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'yellow')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-phone_delete">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'yellow')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-paintbrush">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'yellow')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-note">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'yellow')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-new">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'yellow')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-money_add">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'yellow')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-magnifier">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'yellow')); ?></li>

</ul>


<ul>
<li><?php echo CHtml::link('<span class="icon icon-accept">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'red')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-anchor">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'red')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-tick">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'red')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-disk">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'red')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-delete">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'red')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-error">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'red')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-lightbulb">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'red')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-status_online">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'red')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-status_offline">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'red')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-status_busy">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'red')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-status_away">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'red')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-sound_low">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'red')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-rss_go">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'red')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-printer">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'red')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-plugin">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'red')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-phone_delete">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'red')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-paintbrush">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'red')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-note">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'red')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-new">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'red')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-money_add">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'red')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-magnifier">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'red')); ?></li>

</ul>


<ul>
<li><?php echo CHtml::link('<span class="icon icon-accept">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'grey')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-anchor">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'grey')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-tick">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'grey')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-disk">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'grey')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-delete">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'grey')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-error">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'grey')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-lightbulb">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'grey')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-status_online">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'grey')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-status_offline">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'grey')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-status_busy">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'grey')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-status_away">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'grey')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-sound_low">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'grey')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-rss_go">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'grey')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-printer">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'grey')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-plugin">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'grey')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-phone_delete">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'grey')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-paintbrush">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'grey')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-note">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'grey')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-new">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'grey')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-money_add">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'grey')); ?></li>
<li><?php echo CHtml::link('<span class="icon icon-magnifier">Button Text</span>',array('/site/page', 'view'=>'buttons_and_icons'),array('class'=>'grey')); ?></li>

</ul>
<br style="clear:left"/>
</div>
<?php $this->endWidget();?>

<br />
<div class="flash-notice">
<p>This is a "static" page. You may change the content of this page
by updating the file <tt><?php echo __FILE__; ?></tt>.</p>
</div>