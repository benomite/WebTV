<?php
$this->breadcrumbs=array(
    Yii::t('program', 'Episodes'),
);

$this->menu=array(
	array('label'=>Yii::t('program', 'Create Episode'),'url'=>array('create')),
	array('label'=>Yii::t('program', 'Manage Episode'),'url'=>array('admin')),
);
?>

<h1>Episodes</h1>

<?php $this->widget('bootstrap.widgets.TbListView',array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
