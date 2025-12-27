<?php

namespace common\models\query;

use common\models\AidPlanDetails;
use yii\db\ActiveRecord;

/**
 * This is the ActiveQuery class for [[AidPlanDetails]].
 *
 * @see AidPlanDetails
 */
class AidPlanDetailsQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        $this->andWhere('[[status]]=1');
        return $this;
    }*/

    /**
     * @inheritdoc
     * @return AidPlanDetails[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return array|ActiveRecord|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
