<?php

/**
 * This is the model class for table "Image".
 *
 * The followings are the available columns in table 'Image':
 * @property integer $id
 * @property string $path
 * @property string $name
 * @property string $description
 * @property string $creationDate
 * @property string $lastUpdate
 * @property integer $isActive
 * @property integer $artist_id
 *
 * The followings are the available model relations:
 * @property Artist $artist
 * @property Playlist[] $playlists
 * @property PlaylistMedia[] $playlistMedias
 */
class Image extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return Image the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'Image';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('path, name, lastUpdate, artist_id', 'required'),
			array('isActive, artist_id', 'numerical', 'integerOnly'=>true),
			array('path', 'length', 'max'=>150),
			array('name', 'length', 'max'=>80),
			array('description', 'length', 'max'=>300),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, path, name, description, creationDate, lastUpdate, isActive, artist_id', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
			'artist' => array(self::BELONGS_TO, 'Artist', 'artist_id'),
			'playlists' => array(self::HAS_MANY, 'Playlist', 'image_id'),
			'playlistMedias' => array(self::HAS_MANY, 'PlaylistMedia', 'image_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'path' => 'Path',
			'name' => 'Name',
			'description' => 'Description',
			'creationDate' => 'Creation Date',
			'lastUpdate' => 'Last Update',
			'isActive' => 'Is Active',
			'artist_id' => 'Artist',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 * @return CActiveDataProvider the data provider that can return the models based on the search/filter conditions.
	 */
	public function search()
	{
		// Warning: Please modify the following code to remove attributes that
		// should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('id',$this->id);
		$criteria->compare('path',$this->path,true);
		$criteria->compare('name',$this->name,true);
		$criteria->compare('description',$this->description,true);
		$criteria->compare('creationDate',$this->creationDate,true);
		$criteria->compare('lastUpdate',$this->lastUpdate,true);
		$criteria->compare('isActive',$this->isActive);
		$criteria->compare('artist_id',$this->artist_id);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}