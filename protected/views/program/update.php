<?php
$this->breadcrumbs=array(
	Yii::t('program', 'Programs')=>array('index'),
	$model->title=>array('view','id'=>$model->id),
	Yii::t('program', 'Update'),
);

$this->menu=array(
	array('label'=>Yii::t('program', 'List Program'),'url'=>array('index')),
	array('label'=>Yii::t('program', 'Create Program'),'url'=>array('create')),
	array('label'=>Yii::t('program', 'View Program'),'url'=>array('view','id'=>$model->id)),
	array('label'=>Yii::t('program', 'Manage Program'),'url'=>array('admin')),
);
?>

<h1>Update Program <?php echo $model->id; ?></h1>

<?php echo $this->renderPartial('_form',array('model'=>$model)); ?>