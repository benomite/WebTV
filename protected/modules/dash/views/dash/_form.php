<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'dashblock-form',
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'title'); ?>
		<?php echo $form->textField($model,'title',array('size'=>60,'maxlength'=>255)); ?>
		<?php echo $form->error($model,'title'); ?>
	</div>

  <div class="row">
    <?php echo CHtml::label('Controller', 'AutoController'); ?> 
    <?php echo CHtml::dropDownList('AutoController', '', $controllerOptions); ?>
    <p class="hint">Select a controller to autopopulate the actions below.</p>
  </div>

	<div class="row">
		<?php echo $form->labelEx($model,'actions'); ?>
		<?php echo $form->textArea($model,'actions',array('rows'=>6, 'cols'=>50)); ?>
		<?php echo $form->error($model,'actions'); ?>
    <p class="hint">Use the format <strong>URL|Title</strong>, separating each entry on a new line.</p>
    <p class="hint">Remember to include <strong>http://</strong> before external URLs.</p>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'status'); ?>
		<?php echo $form->checkBox($model,'status'); ?>
		<?php echo $form->error($model,'status'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->

<?php
$path = $this->createUrl('/dash/dash/populate');
$js = <<<JS
jQuery("#AutoController").change(function() {
  jQuery.post("{$path}", {controller:jQuery(this).val()}, function(data) {
    jQuery("#DashBlock_actions").val(data);
  });
});
JS;
Yii::app()->clientScript->registerCoreScript('jquery');
Yii::app()->clientScript->registerScript('controller-populate', $js, CClientScript::POS_END);
?>
