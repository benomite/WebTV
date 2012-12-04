<?php
class CImage extends CApplicationComponent 
{
  public $toolkit;
  public $presets=array();

	public function init() {
		parent::init();
    
    Yii::import('ext.imageapi.ImageToolkit');
    Yii::import('ext.imageapi.GDImageToolkit');
		$this->toolkit = new GDImageToolkit;
	}
  
  public function getInfo($file) {
    return $this->toolkit->getInfo($file);
  }  

  
  public function createPath($presetName, $file) {
    if (!file_exists($file)) return false;
    
    $preset = $this->presets[$presetName];
    if (isset($preset)) {
      $basename = basename($file);
      $targetPath = Yii::getPathOfAlias($preset['cacheIn']);
      $targetFile = $targetPath .'/'. $basename;
      if (!file_exists($targetPath)) mkdir($targetPath, 0777, true); // mkdir recursive
      
      if (file_exists($targetFile)) {  
        return $targetFile;
      } else {
        copy($file, $targetFile);
        foreach($preset['actions'] as $action=>$params) {
          switch($action) {
            case 'scaleAndCrop': 
              $this->scaleAndCrop($targetFile, $targetFile, $params['width'], $params['height']); break;
            case 'scale': 
              $this->scale($targetFile, $targetFile, $params['width'], $params['height']); break;
            case 'resize': 
              $this->resize($targetFile, $targetFile, $params['width'], $params['height']); break;
            case 'rotate': 
              $this->rotate($targetFile, $targetFile, $params['degrees'], $params['background']); break;   
            case 'crop': 
              $this->crop($targetFile, $targetFile, $params['x'], $params['y'], $params['width'], $params['height']); break;                
          }
        }
        return $targetFile;
      }
    } else {
      return false;
    }    
  }
  public function createUrl($presetName, $file) {
    if (!file_exists($file)) return false;
    
    $preset = $this->presets[$presetName];
    if (isset($preset)) {
      $targetPath = Yii::getPathOfAlias($preset['cacheIn']);
      $generatedPath = $this->createPath($presetName, $file);
      
      $webrootPath = Yii::getPathOfAlias('webroot');
      if(strpos($generatedPath, $webrootPath) !== FALSE) {
        $generatedPath = substr($generatedPath, strlen($webrootPath));
      }

      $generatedUrl = str_replace('\\', '/', Yii::app()->baseUrl.$generatedPath);
      return $generatedUrl;
    } else {
      return false;
    }      
  }
  
  public function scaleAndCrop($source, $destination, $width, $height) {
    $info = self::getInfo($source);

    $scale = max($width / $info['width'], $height / $info['height']);
    $x = round(($info['width'] * $scale - $width) / 2);
    $y = round(($info['height'] * $scale - $height) / 2);

    if ($this->toolkit->resize($source, $destination, $info['width'] * $scale, $info['height'] * $scale)) {    
      return $this->toolkit->crop($destination, $destination, $x, $y, $width, $height);
    }
    return FALSE;
  }

  public function scale($source, $destination, $width, $height) {
    $info = self::getInfo($source);

    // Don't scale up.
    if ($width >= $info['width'] && $height >= $info['height']) {
      return FALSE;
    }

    $aspect = $info['height'] / $info['width'];
    if ($aspect < $height / $width) {
      $width = (int)min($width, $info['width']);
      $height = (int)round($width * $aspect);
    }
    else {
      $height = (int)min($height, $info['height']);
      $width = (int)round($height / $aspect);
    }

    return $this->toolkit->resize($source, $destination, $width, $height);
  }

  public function resize($source, $destination, $width, $height) {
    return $this->toolkit->resize($source, $destination, $width, $height);
  }

  public function rotate($source, $destination, $degrees, $background = 0x000000) {
    return $this->toolkit->rotate($source, $destination, $degrees, $background);
  }

  public function crop($source, $destination, $x, $y, $width, $height) {
    return $this->toolkit->crop($source, $destination, $x, $y, $width, $height);
  }
}