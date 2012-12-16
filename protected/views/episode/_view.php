<div class="row episode-list">
    <div class="span3">
        <?php
        $html_link = "";
        if(isset($data->image) && $data->image != "") {
            $path = Yii::app()->image->createUrl('img3_full', YiiBase::getPathOfAlias('webroot.images').DIRECTORY_SEPARATOR.$data->image);
            $html_link = CHtml::image($path, $data->title, array());
        }
        echo CHtml::link($html_link ,array('/episode/view','id'=>$data->id));
        ?>
    </div>
    <div class="span9">
        <?php
        echo "<h4>".$data->getFullTitle()."</h4>";
        echo "<p>".$data->description."</p>";
        ?>
    </div>

</div>