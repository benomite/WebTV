<div class="span3">

    <?php
        $html_link = "";
        if(isset($data->image) && $data->image != "") {
            $path = Yii::app()->image->createUrl('big_thumb', YiiBase::getPathOfAlias('webroot.images').DIRECTORY_SEPARATOR.$data->image);
            $html_link = CHtml::image($path, $data->title, array('class'=>'big_thumb'));
        }


        echo CHtml::link($html_link ,array('view','id'=>$data->id));
        echo "<h4>".$data->title."</h4>"
    ?>

</div>