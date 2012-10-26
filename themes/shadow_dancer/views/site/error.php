<?php
$this->pageTitle=Yii::app()->name . ' - Error';
$this->breadcrumbs=array(
	'Error',
);
?>

<h2 class="error_header">Error <?php echo $code; ?></h2>

<div class="error error_message">
<?php echo CHtml::encode($message); ?>
</div>