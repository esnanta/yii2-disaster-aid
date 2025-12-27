<?php

namespace common\models\search;

use common\models\VerificationVote;
use yii\base\Model;
use yii\data\ActiveDataProvider;

/**
 * app\models\VerificationVoteSearch represents the model behind the search form about `app\models\VerificationVote`.
 */
 class VerificationVoteSearch extends VerificationVote
{
    /**
     * @inheritdoc
     */
    public function rules(): array
    {
        return [
            [['id', 'verification_id', 'verification_action_id', 'voted_by', 'created_by', 'updated_by', 'deleted_by', 'verlock'], 'integer'],
            [['notes', 'voted_at', 'created_at', 'updated_at', 'is_deleted', 'deleted_at', 'uuid'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
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
        $query = VerificationVote::find();

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
            'verification_id' => $this->verification_id,
            'verification_action_id' => $this->verification_action_id,
            'voted_by' => $this->voted_by,
            'voted_at' => $this->voted_at,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
            'created_by' => $this->created_by,
            'updated_by' => $this->updated_by,
            'deleted_at' => $this->deleted_at,
            'deleted_by' => $this->deleted_by,
            'verlock' => $this->verlock,
        ]);

        $query->andFilterWhere(['like', 'notes', $this->notes])
            ->andFilterWhere(['like', 'is_deleted', $this->is_deleted])
            ->andFilterWhere(['like', 'uuid', $this->uuid]);

        return $dataProvider;
    }
}
