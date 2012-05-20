<?php

/**
 * This is the model class for table "Playlist_Media".
 *
 * The followings are the available columns in table 'Playlist_Media':
 * @property integer $id
 * @property integer $playlist_id
 * @property integer $image_id
 * @property integer $audio_id
 * @property integer $video_id
 *
 * The followings are the available model relations:
 * @property Playlist $playlist
 * @property Image $image
 * @property Audio $audio
 * @property Video $video
 */
class PlaylistMedia extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return PlaylistMedia the static model class
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
		return 'Playlist_Media';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('playlist_id', 'required'),
			array('playlist_id, image_id, audio_id, video_id', 'numerical', 'integerOnly'=>true),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, playlist_id, image_id, audio_id, video_id', 'safe', 'on'=>'search'),
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
			'playlist' => array(self::BELONGS_TO, 'Playlist', 'playlist_id'),
			'image' => array(self::BELONGS_TO, 'Image', 'image_id'),
			'audio' => array(self::BELONGS_TO, 'Audio', 'audio_id'),
			'video' => array(self::BELONGS_TO, 'Video', 'video_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'playlist_id' => 'Playlist',
			'image_id' => 'Image',
			'audio_id' => 'Audio',
			'video_id' => 'Video',
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
		$criteria->compare('playlist_id',$this->playlist_id);
		$criteria->compare('image_id',$this->image_id);
		$criteria->compare('audio_id',$this->audio_id);
		$criteria->compare('video_id',$this->video_id);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}