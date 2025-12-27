<?php

namespace common\models;

use Yii;
use common\models\base\VerificationAction as BaseVerificationAction;

/**
 * This is the model class for table "t_verification_action".
 */
class VerificationAction extends BaseVerificationAction
{
    /**
     * @inheritdoc
     */
    public function rules(): array
    {
        return array_replace_recursive(parent::rules(),
	    [
            [['weight', 'created_by', 'updated_by', 'deleted_by', 'verlock'], 'integer'],
            [['description'], 'string'],
            [['created_at', 'updated_at', 'deleted_at'], 'safe'],
            [['code'], 'string', 'max' => 50],
            [['title'], 'string', 'max' => 255],
            [['is_deleted'], 'integer'],
            [['uuid'], 'string', 'max' => 36],
            [['code'], 'unique'],
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
            'id' => Yii::t('app', 'ID'),
            'code' => Yii::t('app', 'Code'),
            'title' => Yii::t('app', 'Title'),
            'weight' => Yii::t('app', 'Weight'),
            'description' => Yii::t('app', 'Description'),
            'is_deleted' => Yii::t('app', 'Is Deleted'),
            'verlock' => Yii::t('app', 'Verlock'),
            'uuid' => Yii::t('app', 'Uuid'),
        ];
    }
}
