<?php

namespace common\models;

use Yii;
use common\models\base\MediaFile as BaseMediaFile;

/**
 * This is the model class for table "t_media_file".
 */
class MediaFile extends BaseMediaFile
{
    /**
     * @inheritdoc
     */
    public function rules(): array
    {
        return array_replace_recursive(parent::rules(),
	    [
            [['entity_type_id', 'entity_id', 'uploaded_by', 'created_by', 'updated_by', 'deleted_by', 'verlock'], 'integer'],
            [['taken_at', 'created_at', 'updated_at', 'deleted_at'], 'safe'],
            [['file_path'], 'string', 'max' => 500],
            [['notes'], 'string', 'max' => 255],
            [['file_type'], 'string', 'max' => 50],
            [['mime_type'], 'string', 'max' => 100],
            [['is_deleted'], 'integer'],
            [['uuid'], 'string', 'max' => 36],
            [['verlock'], 'default', 'value' => '0'],
            [['verlock'], 'mootensai\components\OptimisticLockValidator']
        ]);
    }
	
    /**
     * @inheritdoc
     */
    public function attributeHints(): array
    {
        return [
            'id' => Yii::t('common', 'ID'),
            'entity_type_id' => Yii::t('common', 'Entity Type ID'),
            'entity_id' => Yii::t('common', 'Entity ID'),
            'file_path' => Yii::t('common', 'File Path'),
            'notes' => Yii::t('common', 'Notes'),
            'file_type' => Yii::t('common', 'File Type'),
            'mime_type' => Yii::t('common', 'Mime Type'),
            'taken_at' => Yii::t('common', 'Taken At'),
            'uploaded_by' => Yii::t('common', 'Uploaded By'),
            'is_deleted' => Yii::t('common', 'Is Deleted'),
            'verlock' => Yii::t('common', 'Verlock'),
            'uuid' => Yii::t('common', 'Uuid'),
        ];
    }
}
