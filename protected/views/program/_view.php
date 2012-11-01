<div class="view">

    <?php
    if(isset($data->image) && $data->image != ""){
        $url = 'http://'.Yii::app()->request->getServerName();
        $path = Yii::app()->image->createUrl('big_thumb', YiiBase::getPathOfAlias('webroot.images').DIRECTORY_SEPARATOR.$data->image);
        echo CHtml::image($path, $data->title, array());
    }
    ?>


</div>