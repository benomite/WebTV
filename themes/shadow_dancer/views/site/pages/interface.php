<?php

$baseUrl = Yii::app()->theme->baseUrl; 
$cs = Yii::app()->getClientScript();
$cs->registerCssFile($baseUrl.'/css/jquery.css');
  
$this->pageTitle=Yii::app()->name . ' - Interface Elements';
$this->breadcrumbs=array(
	'Interface Elements',
);

$sample_content = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed turpis diam, facilisis nec egestas quis, pharetra eget diam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed turpis diam, facilisis nec egestas quis, pharetra eget diam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed turpis diam, facilisis nec egestas quis, pharetra eget diam.';
?>
<h1>Interface Elements</h1>

<h2>Flash Messages</h2>
<div class="flash-notice"><b>NOTICE:</b> This is an example of a notice message.</div>
<div class="flash-success"><b>SUCCESS:</b> This is an example of a success message to show you that things have gone according to plan.</div>
<div class="flash-error"><b>ERROR:</b> This is an example of an error message to show you that things have gone wrong.</div>

<div class="container showgrid">
    <div class="span-12">

<h2>CJuiTabs</h2>
<?php
$this->widget('zii.widgets.jui.CJuiTabs', array(
    'tabs'=>array(
        'StaticTab 1'=>$sample_content,
        'StaticTab 2'=>array('content'=>$sample_content, 'id'=>'tab2'),
        // panel 3 contains the content rendered by a partial view
        'AjaxTab'=>$sample_content,
    ),
    // additional javascript options for the tabs plugin
    'options'=>array(
        'collapsible'=>true,
    ),
	'htmlOptions'=>array('class'=>'shadowtabs'),
));

?>

<br />
<h2>CJuiAccordion</h2>
<?php
$this->widget('zii.widgets.jui.CJuiAccordion', array(
    'panels'=>array(
        'Panel 1'=>$sample_content,
        'Panel 2'=>$sample_content,
		'Panel 3'=>$sample_content, 
        // panel 3 contains the content rendered by a partial view
        //'panel 3'=>$this->renderPartial('_partial',null,true),
    ),
    // additional javascript options for the accordion plugin
    'options'=>array(
        'animated'=>'bounceslide',
    ),
	'htmlOptions'=>array('class'=>'shadowaccordion'),
));
?>
    </div>
    <div class="span-11 last">
<h2>CJuiProgressBar</h2>
<?php
$this->widget('zii.widgets.jui.CJuiProgressBar', array(
    'value'=>75,
    'htmlOptions'=>array(
        'style'=>'height:20px;',
		'class'=>'shadowprogressbar'
    ),
));
?>
<br />
<?php
$this->widget('zii.widgets.jui.CJuiProgressBar', array(
    'value'=>45,
    'htmlOptions'=>array(
        'style'=>'height:20px;',
		'class'=>'shadowprogressbar'
    ),
));
?>
<br />
<h2>CJuiSlider</h2>
<label for="amt">Volume:</label>
<input type="text" id="amt" style="border:0; font-weight:bold;"  value="35" />
<?php
$this->widget('zii.widgets.jui.CJuiSlider', array(
	'value'=>35,
    'id'=>'amtSlider',
    // additional javascript options for the slider plugin
    'options'=>array(
        'min'=>0,
        'max'=>50,
		'slide'=>'js:function(event, ui) { $("#amt").val(ui.value);}', 
    ),
    'htmlOptions'=>array(
		'class'=>'shadowslider'
    ),
));
?>

<br />
<label for="amt1">Volume:</label>
<input type="text" id="amt1" style="border:0; font-weight:bold;" value="15"/>
<?php
$this->widget('zii.widgets.jui.CJuiSlider', array(
    'value'=>15,
    // additional javascript options for the slider plugin
    'options'=>array(
        'min'=>0,
        'max'=>50,
		'slide'=>'js:function(event, ui) { $("#amt1").val(ui.value);}', 
    ),
	 'htmlOptions'=>array(
		'class'=>'shadowslider-dark'
    ),
    
));
?>

<br />
<h2>CJuiSliderInput</h2>
<?php
$this->widget('zii.widgets.jui.CJuiSliderInput', array(
    'name'=>'rate',
    'value'=>37,
    // additional javascript options for the slider plugin
    'options'=>array(
        'min'=>10,
        'max'=>50,
    ),
	'htmlOptions'=>array(
		'class'=>'shadowslider'
    ),
));

?>
<br />
<?php
$this->widget('zii.widgets.jui.CJuiSliderInput', array(
    'name'=>'rate2',
    'value'=>45,
    // additional javascript options for the slider plugin
    'options'=>array(
        'min'=>10,
        'max'=>50,
    ),
	'htmlOptions'=>array(
		'class'=>'shadowslider'
    ),
));

?>
<br />
<h2>CJuiButton</h2>
<?php
$this->widget('zii.widgets.jui.CJuiButton',
	array(
		'name'=>'button',
			'caption'=>'Click on me!',
		'value'=>'asd',
		'htmlOptions'=>array(
        'style'=>'height:40px;',
		'class'=>'shadowbutton'
    	),
		'onclick'=>'js:function(){alert("The button has been clicked!"); this.blur(); return false;}',
		)
);
?>

<?php
$this->widget('zii.widgets.jui.CJuiButton',
	array(
		'name'=>'button',
			'caption'=>'Click on me!',
		'value'=>'asd',
		'htmlOptions'=>array(
        'style'=>'height:40px;',
		'class'=>'button green'
    	),
		'onclick'=>'js:function(){alert("The button has been clicked!"); this.blur(); return false;}',
		)
);
?>

<?php
$this->widget('zii.widgets.jui.CJuiButton',
	array(
		'name'=>'button',
			'caption'=>'Click on me!',
		'value'=>'asd',
		'htmlOptions'=>array(
        'style'=>'height:40px;',
		'class'=>'button red'
    	),
		'onclick'=>'js:function(){alert("The button has been clicked!"); this.blur(); return false;}',
		)
);
?>
<br />
<br />
<?php
$this->widget('zii.widgets.jui.CJuiButton',
	array(
		'name'=>'button',
			'caption'=>'Click on me!',
		'value'=>'asd',
		'htmlOptions'=>array(
        'style'=>'height:40px;',
		'class'=>' button blue'
    	),
		'onclick'=>'js:function(){alert("The button has been clicked!"); this.blur(); return false;}',
		)
);
?>
<?php
$this->widget('zii.widgets.jui.CJuiButton',
	array(
		'name'=>'button',
			'caption'=>'Click on me!',
		'value'=>'asd',
		'htmlOptions'=>array(
        'style'=>'height:40px;',
		'class'=>' button yellow'
    	),
		'onclick'=>'js:function(){alert("The button has been clicked!"); this.blur(); return false;}',
		)
);
?>
<?php
$this->widget('zii.widgets.jui.CJuiButton',
	array(
		'name'=>'button2',
			'caption'=>'Click on me!',
		'value'=>'asd2',
		'htmlOptions'=>array(
        'style'=>'height:40px;'
    	),
		'onclick'=>'js:function(){alert("The button has been clicked!"); this.blur(); return false;}',
		)
);
?>
<br />
<br />
<?php
$this->widget('zii.widgets.jui.CJuiButton',
	array(
		'name'=>'button',
			'caption'=>'Click on me!',
		'value'=>'asd',
		'htmlOptions'=>array(
        'style'=>'height:40px;',
		'class'=>' button grey'
    	),
		'onclick'=>'js:function(){alert("The button has been clicked!"); this.blur(); return false;}',
		)
);
?>
<br /><br />
<h2>CJuiDatePicker</h2>
<?php
$this->widget('zii.widgets.jui.CJuiDatePicker', array(
    'name'=>'publishDate',
    // additional javascript options for the date picker plugin
    'options'=>array(
        'showAnim'=>'fold',
    ),
    'htmlOptions'=>array(
		'class'=>'shadowdatepicker'
    ),
));
?>

<br />
<br />

<h2>CJuiDialog</h2>
<?php
$this->beginWidget('zii.widgets.jui.CJuiDialog', array(
    'id'=>'mydialog',
    // additional javascript options for the dialog plugin
    'options'=>array(
        'title'=>'Dialog box 1',
        'autoOpen'=>false,
    ),
	'htmlOptions'=>array(
		'class'=>'shadowdialog'
    ),
));

    echo 'dialog content here';

$this->endWidget('zii.widgets.jui.CJuiDialog');

// the link that may open the dialog
echo CHtml::link('open dialog', '#', array(
   'onclick'=>'$("#mydialog").dialog("open"); return false;',
));
?>

    </div>
    

</div>
<br />
<div class="flash-notice">
<p>This is a "static" page. You may change the content of this page
by updating the file <tt><?php echo __FILE__; ?></tt>.</p>
</div>