<?php

namespace common\models;

use Yii;
use common\models\base\AidPlanDetails as BaseAidPlanDetails;

/**
 * This is the model class for table "t_aid_plan_details".
 */
class AidPlanDetails extends BaseAidPlanDetails
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return array_replace_recursive(parent::rules(),
	    [
            [['aid_plan_id', 'item_id', 'quantity', 'unit_id', 'verlock'], 'integer'],
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
            'aid_plan_id' => Yii::t('common', 'Aid Plan ID'),
            'item_id' => Yii::t('common', 'Item ID'),
            'quantity' => Yii::t('common', 'Quantity'),
            'unit_id' => Yii::t('common', 'Unit ID'),
            'verlock' => Yii::t('common', 'Verlock'),
            'uuid' => Yii::t('common', 'Uuid'),
        ];
    }
}
