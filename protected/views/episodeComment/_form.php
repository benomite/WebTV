<?php $form=$this->beginWidget('bootstrap.widgets.TbActiveForm',array(
	'id'=>'episode-comment-form',
	'enableAjaxValidation'=>false,
)); ?>

	<?php echo $form->errorSummary($model); ?>

	<?php echo $form->textAreaRow($model,'content',array('rows'=>6, 'cols'=>50, 'class'=>'span8')); ?>

	<div class="form-actions">
		<?php $this->widget('bootstrap.widgets.TbButton', array(
			'buttonType'=>'submit',
			'type'=>'primary',
			'label'=> Yii::t('app', 'Send'),
		)); ?>
	</div>

<?php $this->endWidget(); ?>
