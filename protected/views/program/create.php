<?php
$this->breadcrumbs=array(
    Yii::t('program', 'Programs')=>array('index'),
    Yii::t('program', 'Create'),
);

$this->menu=array(
	array('label'=>Yii::t('program', 'List Program'),'url'=>array('index')),
	array('label'=>Yii::t('program', 'Manage Program'),'url'=>array('admin')),
);
?>

<h1><?php echo Yii::t('program', 'Create Program'); ?></h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>