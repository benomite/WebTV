<div class="view">

    <div class="comment-head">
        <?php  echo $data->author->username; ?>
        <?php echo Yii::app()->dateFormatter->formatDateTime($data->create_time, 'short'); ?>
    </div>
    <div class="comment-content">
    	<?php echo CHtml::encode($data->content); ?>
    </div>
</div>