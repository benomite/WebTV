<?php $form=$this->beginWidget('bootstrap.widgets.TbActiveForm',array(
	'id'=>'episode-form',
	'enableAjaxValidation'=>false,
    'htmlOptions' => array('enctype' => 'multipart/form-data'),
)); ?>

	<p class="help-block"><?php echo Yii::t('Site', 'Fields with <span class="required">*</span> are required.'); ?></p>

	<?php echo $form->errorSummary($model); ?>

	<?php echo $form->textFieldRow($model,'title',array('class'=>'span5','maxlength'=>128)); ?>

    <?php echo $form->textFieldRow($model,'number',array('class'=>'span1')); ?>
    <p class="help-block"><?php echo Yii::t('Program', 'Can be any small text.
                                                    Ex: 1, 2-part2 or 0 (test).
                                                    Will be displayed like "Episode XXX.
                                                    Leave empty if there is no episode number');?></p>

	<?php echo $form->textAreaRow($model,'description',array('rows'=>6, 'cols'=>50, 'class'=>'span8')); ?>

    <?php echo $form->fileFieldRow($model, 'image'); ?>

	<?php echo $form->textAreaRow($model,'video',array('rows'=>4, 'cols'=>50, 'class'=>'span8')); ?>

	<?php echo $form->dropDownList($model,'status', Lookup::items('EpisodeStatus'), array('class'=>'span5')); ?>

    <input type="hidden" name="program_id" value="<?php echo $model->program_id; ?>" />

	<div class="form-actions">
		<?php $this->widget('bootstrap.widgets.TbButton', array(
			'buttonType'=>'submit',
			'type'=>'primary',
			'label'=>$model->isNewRecord ? Yii::t('Site', 'Create') : Yii::t('Site', 'Save'),
		)); ?>
	</div>

<?php $this->endWidget(); ?>
