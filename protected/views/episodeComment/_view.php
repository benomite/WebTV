<div class="row episode-comment">

    <div class="span2">
        <span class="<?php echo $data->id; ?>">
            <?php $this->widget('bootstrap.widgets.TbButton',array(
            'icon' => 'thumbs-down',
            'type' => 'danger',
            'size' => 'small',
            'htmlOptions' => array(
                'class'=>'down-vote',
                'title' => Yii::t('program', 'This comment is not constructive, It will not be helpful for the artist'),
            ),
        ));?>
        </span>
        <span class="vote-num">
            <?php echo $data->votes; ?>
        </span>
        <span class="<?php echo $data->id; ?>">
            <?php
            $can_vote = $data->userCanVote();
            $this->widget('bootstrap.widgets.TbButton',array(
            'icon' => 'thumbs-up',
            'type' => 'success',
            'size' => 'small',
            'htmlOptions' => array(
                'class'=>'up-vote',
                'title' => Yii::t('program', 'This comment is useful, it will help the artist to improve videos'),
            ),
        )); ?>
        </span>
    </div>

    <div class="span10">
        <div class="comment-head">

            <?php  echo $data->author->username; ?>
            <?php echo Yii::app()->dateFormatter->formatDateTime($data->create_time, 'short'); ?>

        </div>
        <div class="comment-content">
                <?php echo CHtml::encode($data->content); ?>
        </div>
    </div>

</div>