<div class="row episode-comment">

    <div class="span10">
        <div class="comment-head">

            <?php  echo $data->author->username; ?>
            <?php echo Yii::app()->dateFormatter->formatDateTime($data->create_time, 'short'); ?>

        </div>
        <div class="comment-content">
                <?php echo CHtml::encode($data->content); ?>
        </div>
    </div>
    <div class="span2">
        <?php echo $data->votes; ?>
    </div>
</div>