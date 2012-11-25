<?php
$this->breadcrumbs=array(
	Yii::t('program', 'Episode Comments')=>array('index'),
	$model->id,
);

$this->menu=array(
	array('label'=>Yii::t('program', 'List Comments'),'url'=>array('index')),
	array('label'=>Yii::t('program', 'Create Comment'),'url'=>array('create')),
	array('label'=>Yii::t('program', 'Update Comment'),'url'=>array('update','id'=>$model->id)),
	array('label'=>Yii::t('program', 'Delete Comment'),'url'=>'#','linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>Yii::t('program', 'Manage Comments'),'url'=>array('admin')),
);
?>

<h1><?php echo Yii::t('program', 'View Comment'); ?></h1>

<?php $this->widget('bootstrap.widgets.TbDetailView',array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'content',
		'episode_id',
		'author_id',
		'status',
		'create_time',
	),
)); ?>
