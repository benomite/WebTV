<div class="span3">

    <?php
        $html_link = "";
        if(isset($data->image) && $data->image != "") {
            $path = Yii::app()->image->createUrl('img3_full', YiiBase::getPathOfAlias('webroot.images').DIRECTORY_SEPARATOR.$data->image);
            $html_link = CHtml::image($path, $data->title, array('class'=>'img3_full prgm-box'));
        }


        echo CHtml::link($html_link ,array('view','id'=>$data->id));
        echo "<h4>".$data->getSmallTitle()."</h4>"
    ?>

</div>