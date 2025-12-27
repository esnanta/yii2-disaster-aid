<?php

namespace common\models;

use Yii;
use common\models\base\AidDistributionDetails as BaseAidDistributionDetails;

/**
 * This is the model class for table "t_aid_distribution_details".
 */
class AidDistributionDetails extends BaseAidDistributionDetails
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return array_replace_recursive(parent::rules(),
	    [
            [['aid_distribution_id', 'item_id', 'quantity', 'unit_id', 'verlock'], 'integer'],
            [['uuid'], 'string', 'max' => 36],
            [['verlock'], 'default', 'value' => '0'],
            [['verlock'], 'mootensai\components\OptimisticLockValidator']
        ]);
    }
	
    /**
     * @inheritdoc
     */
    public function attributeHints()
    {
        return [
            'id' => Yii::t('common', 'ID'),
            'aid_distribution_id' => Yii::t('common', 'Aid Distribution ID'),
            'item_id' => Yii::t('common', 'Item ID'),
            'quantity' => Yii::t('common', 'Quantity'),
            'unit_id' => Yii::t('common', 'Unit ID'),
            'verlock' => Yii::t('common', 'Verlock'),
            'uuid' => Yii::t('common', 'Uuid'),
        ];
    }
}
