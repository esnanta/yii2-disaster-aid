<?php

namespace common\models\search;

use common\models\AidDistributionDetails;
use yii\base\Model;
use yii\data\ActiveDataProvider;

/**
 * app\models\AidDistributionDetailsSearch represents the model behind the search form about `app\models\AidDistributionDetails`.
 */
 class AidDistributionDetailsSearch extends AidDistributionDetails
{
    /**
     * @inheritdoc
     */
    public function rules(): array
    {
        return [
            [['id', 'aid_distribution_id', 'aid_item_id', 'quantity', 'unit_id', 'verlock'], 'integer'],
            [['uuid'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios(): array
    {
        // bypass scenarios() implementation in the parent class
        return (new Model)->scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search(array $params): ActiveDataProvider
    {
        $query = AidDistributionDetails::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        $query->andFilterWhere([
            'id' => $this->id,
            'aid_distribution_id' => $this->aid_distribution_id,
            'aid_item_id' => $this->aid_item_id,
            'quantity' => $this->quantity,
            'unit_id' => $this->unit_id,
            'verlock' => $this->verlock,
        ]);

        $query->andFilterWhere(['like', 'uuid', $this->uuid]);

        return $dataProvider;
    }
}
