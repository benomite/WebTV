<?php
$this->pageTitle=Yii::app()->name . ' - Calendar';
$this->breadcrumbs=array(
	'Calendar',
);
?>
<h1>Calendar</h1>

<?php
$this->widget('application.extensions.fullcalendar.FullcalendarGraphWidget', 
    array(
        'data'=>array(
                'title'=> 'All Day Event',
                'start'=> '2012-01-23',
				'end'=> '2012-01-25',
        ),
        'options'=>array(
            'editable'=>true,
        ),
        'htmlOptions'=>array(
               'class'=>'cal_theme',
			   'style'=>'width:910px;margin: 0 auto;'
        ),
    )
);
?>
<br />
<div class="flash-notice">
<p>This is a "static" page. You may change the content of this page
by updating the file <tt><?php echo __FILE__; ?></tt>.</p>
</div>