<?php
$baseUrl = Yii::app()->theme->baseUrl; 
$cs = Yii::app()->getClientScript();
$cs->registerScriptFile('http://www.google.com/jsapi');
$cs->registerCoreScript('jquery');
$cs->registerScriptFile($baseUrl.'/js/jquery.gvChart-1.0.1.min.js');
$cs->registerScriptFile($baseUrl.'/js/pbs.init.js');
  
$this->pageTitle=Yii::app()->name . ' - Graphs & Charts';
$this->breadcrumbs=array(
	'Graphs & Charts',
);
?>
<h1>Graphs & Charts</h1>

<?php
$this->beginWidget('zii.widgets.CPortlet', array(
	'title'=>'<span class="icon icon-chart_bar">Column Chart</span>',
));
?>
<div class="chart1">
    <div>
        <div class="text">
            <table class="myChart">
                <thead>
                    <tr>
                        <th></th>
                        <th>Jan</th>
                        <th>Feb</th>
                        <th>Mar</th>
                        <th>Apr</th>
                        <th>May</th>
                        <th>Jun</th>
                        <th>Jul</th>
                        <th>Aug</th>
                        <th>Sep</th>
                        <th>Oct</th>
                        <th>Nov</th>
                        <th>Dec</th>
                    </tr>
                </thead>

                <tbody>
                    <tr>
                        <th>Sales</th>
                        <td>34523</td>
                        <td>22123</td>
                        <td>25031</td>
                        <td>30342</td>
                        <td>45321</td>
                        <td>46234</td>
                        <td>50434</td>
                        <td>61302</td>
                        <td>75321</td>
                        <td>61232</td>
                        <td>43423</td>
                        <td>85762</td>
                    </tr>
                    <tr>
                        <th>Quotes</th>
                        <td>39523</td>
                        <td>26123</td>
                        <td>29031</td>
                        <td>34342</td>
                        <td>48321</td>
                        <td>42234</td>
                        <td>56434</td>
                        <td>67302</td>
                        <td>71321</td>
                        <td>69232</td>
                        <td>46423</td>
                        <td>80762</td>
                    </tr>
                    <tr>
                        <th>Visitors<td>
                        <td>67031</td>
                        <td>10342</td>
                        <td>68321</td>
                        <td>22234</td>
                        <td>16434</td>
                        <td>87302</td>
                        <td>31321</td>
                        <td>79232</td>
                        <td>96423</td>
                        <td>30762</td>
                    </tr>
                </tbody>
            </table>
            
            
        </div>
    </div>
</div>
<?php $this->endWidget();?>
<div class="container showgrid">
<div class="span-12">
<?php
$this->beginWidget('zii.widgets.CPortlet', array(
	'title'=>'<span class="icon icon-chart_pie">Pie Chart</span>',
));
?>
<div class="chart2">
<div>
        <div class="text">
            <table class="myChart">
                <thead>
                    <tr>
                        <th></th>
                        <th>Jan</th>
                        <th>Feb</th>
                        <th>Mar</th>
                        <th>Apr</th>
                        <th>May</th>
                        <th>Jun</th>
                        <th>Jul</th>
                    </tr>
                </thead>
    
                <tbody>
                    <tr>
                      <th>Sales</th>
                      <td>3923</td>
                      <td>2923</td>
                      <td>2931</td>
                      <td>3942</td>
                      <td>4921</td>
                      <td>6934</td>
                      <td>5934</td>
                    </tr>
                    <tr>
                      <th>Quotes</th>
                      <td>3623</td>
                      <td>2623</td>
                      <td>2831</td>
                      <td>3842</td>
                      <td>4821</td>
                      <td>6534</td>
                      <td>5134</td>
                    </tr>
                    <tr>
                      <th>Visitors </th>
                        <td>3523</td>
                        <td>2223</td>
                        <td>2531</td>
                        <td>3342</td>
                        <td>4521</td>
                        <td>6234</td>
                        <td>5434</td>
                    </tr>
                </tbody>
            </table>
            
            
      </div>
  </div>
</div>
<?php $this->endWidget();?>
</div>
<div class="span-11 last">
<?php
$this->beginWidget('zii.widgets.CPortlet', array(
	'title'=>'<span class="icon icon-chart_bar">Line Chart</span>',
));
?>
<div class="chart3">
    <div>
        <div class="text">
            <table class="myChart">
                <thead>
                    <tr>
                        <th></th>
                        <th>Jan</th>
                        <th>Feb</th>
                        <th>Mar</th>
                        <th>Apr</th>
                        <th>May</th>
                        <th>Jun</th>
                    </tr>
                </thead>

                <tbody>
                    <tr>
                        <th>Quotes</th>
                        <td>39523</td>
                        <td>26123</td>
                        <td>29031</td>
                        <td>34342</td>
                        <td>48321</td>
                        <td>42234</td>
                    </tr>
                    <tr>
                        <th>Sales</th>
                        <td>34523</td>
                        <td>22123</td>
                        <td>25031</td>
                        <td>30342</td>
                        <td>45321</td>
                        <td>46234</td>
                    </tr>
                </tbody>
            </table>
            
            
        </div>
    </div>
</div>
<?php $this->endWidget();?>
</div>
</div>
<?php
$this->beginWidget('zii.widgets.CPortlet', array(
	'title'=>'<span class="icon icon-chart_bar">Bar Chart</span>',
));
?>
<div class="chart4">
    <div>
        <div class="text">
            <table class="myChart">
                <thead>
                    <tr>
                        <th></th>
                        <th>Jan</th>
                        <th>Feb</th>
                        <th>Mar</th>
                        <th>Apr</th>
                        <th>May</th>
                        <th>Jun</th>
                    </tr>
                </thead>

                <tbody>
                    <tr>
                        <th>Sales</th>
                        <td>34523</td>
                        <td>22123</td>
                        <td>25031</td>
                        <td>30342</td>
                        <td>45321</td>
                        <td>46234</td>
                    </tr>
                    <tr>
                        <th>Quotes</th>
                        <td>39523</td>
                        <td>26123</td>
                        <td>29031</td>
                        <td>34342</td>
                        <td>48321</td>
                        <td>42234</td>
                    </tr>
                    <tr>
                        <th>Visitors<td>
                        <td>67031</td>
                        <td>10342</td>
                        <td>68321</td>
                        <td>22234</td>
                        <td>16434</td>
                    </tr>
                </tbody>
            </table>
            
            
        </div>
    </div>
</div>
<?php $this->endWidget();?>

<?php
$this->beginWidget('zii.widgets.CPortlet', array(
	'title'=>'<span class="icon icon-chart_bar">Area Chart</span>',
));
?>
<div class="chart5">
    <div>
        <div class="text">
            <table class="myChart">
                <thead>
                    <tr>
                        <th></th>
                        <th>Jan</th>
                        <th>Feb</th>
                        <th>Mar</th>
                        <th>Apr</th>
                        <th>May</th>
                        <th>Jun</th>
                    </tr>
                </thead>

                <tbody>
                    <tr>
                        <th>Sales</th>
                        <td>34523</td>
                        <td>22123</td>
                        <td>25031</td>
                        <td>30342</td>
                        <td>45321</td>
                        <td>46234</td>
                    </tr>
                    <tr>
                        <th>Quotes</th>
                        <td>39523</td>
                        <td>26123</td>
                        <td>29031</td>
                        <td>34342</td>
                        <td>48321</td>
                        <td>42234</td>
                    </tr>
                    <tr>
                        <th>Visitors<td>
                        <td>67031</td>
                        <td>10342</td>
                        <td>68321</td>
                        <td>22234</td>
                        <td>16434</td>
                    </tr>
                </tbody>
            </table>
            
            
        </div>
    </div>
</div>
<?php $this->endWidget();?>

<div class="flash-notice">
<p>This is a "static" page. You may change the content of this page
by updating the file <tt><?php echo __FILE__; ?></tt>.</p>
</div>