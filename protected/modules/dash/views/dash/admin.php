<?php
$this->breadcrumbs=array(
	'Dashboard'=>array('index'),
	'Manage Blocks',
);

$this->menu=array(
	array('label'=>'View Dashboard', 'url'=>array('index')),
	array('label'=>'Create Block', 'url'=>array('create')),
	array('label'=>'Order Blocks', 'url'=>array('order')),
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$.fn.yiiGridView.update('dashboard-grid', {
		data: $(this).serialize()
	});
	return false;
});
");
?>

<h1>Manage Blocks</h1>

<p>
You may optionally enter a comparison operator (<b>&lt;</b>, <b>&lt;=</b>, <b>&gt;</b>, <b>&gt;=</b>, <b>&lt;&gt;</b>
or <b>=</b>) at the beginning of each of your search values to specify how the comparison should be done.
</p>

<?php echo CHtml::link('Advanced Search','#',array('class'=>'search-button')); ?>
<div class="search-form" style="display:none">
<?php $this->renderPartial('_search',array(
	'model'=>$model,
)); ?>
</div><!-- search-form -->

<?php $this->widget('zii.widgets.grid.CGridView', array(
	'id'=>'dashblock-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	'columns'=>array(
		'id',
		'title',
		'actions',
		'weight',
    array(
      'name' => 'status',
      'value' => '$data->status == 1 ? "Yes" : "No"',
      'filter' => CHtml::activeDropDownList($model, 'status', array('' => 'Any', 1 => 'Yes', 0 => 'No')),
    ),
		array(
			'class'=>'CButtonColumn',
		),
	),
)); ?>
