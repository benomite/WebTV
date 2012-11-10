<?php
$this->breadcrumbs=array(
	'Dashboard',
);

$this->menu=array(
	array('label'=>'Create Block', 'url'=>array('create')),
	array('label'=>'Manage Blocks', 'url'=>array('admin')),
	array('label'=>'Order Blocks', 'url'=>array('order')),
);
?>

<h1>Dashboard</h1>

<?php $this->widget('zii.widgets.CListView', array(
  'id' => 'dashboard',
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
  'summaryText'=>FALSE,
)); ?>

<?php
if (Yii::app()->getModule('dash')->useMasonry) {
  $js = <<<JS
  jQuery('#dashboard').masonry({
    itemSelector : '.dashboard-block',
    columnWidth : 250
  });
JS;

  Yii::app()->clientScript->registerScriptFile(Yii::app()->getModule('dash')->assetsFolder .'/js/jquery.masonry.min.js', CClientScript::POS_END);
  Yii::app()->clientScript->registerScript('dash-masonry', $js, CClientScript::POS_END);
}
?>
