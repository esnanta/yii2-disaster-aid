<?php

/**
 * @var yii\web\View $this
 * @var common\models\DisasterType $model
 */

$this->title = Yii::t('backend', 'Update {modelClass}: ', [
    'modelClass' => 'Disaster Type',
]) . ' ' . $model->title;
$this->params['breadcrumbs'][] = ['label' => Yii::t('backend', 'Disaster Types'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->title, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('backend', 'Update');
?>
<div class="disaster-type-update">

    <?php echo $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
